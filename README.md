# Time-Multiplexed SIMD FPU

## Descripción General

Es una unidad de punto flotante (FPU) que implementa operaciones SIMD mediante multiplexación temporal. Utiliza un único core de 64 bits para procesar secuencialmente múltiples operaciones de menor precisión, logrando un balance óptimo entre área de silicio y funcionalidad SIMD.

## Arquitectura

```
┌─────────────────────────────────────────────────────────────────────────────┐
│                                  fpu_top                                    │
│                                                                             │
│  ┌───────────────────────────────────────────────────────────────────────┐  │
│  │                         FSM Sequencer                                 │  │
│  │  IDLE ──► PROC_* ──► WAIT_* ──► ... ──► IDLE                          │  │
│  │                                                                       │  │
│  │  Controla el flujo de operaciones SIMD secuenciales                   │  │
│  └───────────────────────────────────────────────────────────────────────┘  │
│                                    │                                        │
│         ┌──────────────────────────┼──────────────────────────┐             │
│         │                          │                          │             │
│         ▼                          ▼                          ▼             │
│  ┌─────────────┐           ┌─────────────┐           ┌─────────────┐        │
│  │ Operand A   │           │  Slot MUX   │           │ Operand B   │        │
│  │   Reg       │──────────►│             │◄──────────│   Reg       │        │
│  │  [63:0]     │           │  Selecciona │           │  [63:0]     │        │
│  └─────────────┘           │  porción de │           └─────────────┘        │
│                            │  operandos  │                                  │
│                            └──────┬──────┘                                  │
│                                   │                                         │
│                    ┌──────────────┴──────────────┐                          │
│                    │                             │                          │
│                    ▼                             ▼                          │
│           ┌───────────────┐             ┌───────────────┐                   │
│           │  fp_unpack A  │             │  fp_unpack B  │                   │
│           │               │             │               │                   │
│           │ FP16/32/64 →  │             │ FP16/32/64 →  │                   │
│           │ Internal FP64 │             │ Internal FP64 │                   │
│           └───────┬───────┘             └───────┬───────┘                   │
│                   │                             │                           │
│                   └──────────────┬──────────────┘                           │
│                                  │                                          │
│                                  ▼                                          │
│                    ┌─────────────────────────┐                              │
│                    │       fpu_core          │                              │
│                    │                         │                              │
│                    │  ┌───────────────────┐  │                              │
│                    │  │ ADD/SUB Unit      │  │                              │
│                    │  │ (54-bit aligned)  │  │                              │
│                    │  └───────────────────┘  │                              │
│                    │  ┌───────────────────┐  │                              │
│                    │  │ MUL Unit          │  │                              │
│                    │  │ (54x54 → 108-bit) │  │                              │
│                    │  └───────────────────┘  │                              │
│                    │  ┌───────────────────┐  │                              │
│                    │  │ DIV Unit          │  │                              │
│                    │  │ (107-bit / 54-bit)│  │                              │
│                    │  └───────────────────┘  │                              │
│                    │                         │                              │
│                    └────────────┬────────────┘                              │
│                                 │                                           │
│                                 ▼                                           │
│                    ┌─────────────────────────┐                              │
│                    │       fp_pack           │                              │
│                    │                         │                              │
│                    │  Internal FP64 →        │                              │
│                    │  FP16/FP32/FP64         │                              │
│                    └────────────┬────────────┘                              │
│                                 │                                           │
│                                 ▼                                           │
│  ┌───────────────────────────────────────────────────────────────────────┐  │
│  │                      Result Accumulator                               │  │
│  │                                                                       │  │
│  │  FP64: result[63:0]  ← packed_result                                  │  │
│  │  FP32: result[31:0]  ← packed_result[31:0]  (slot 0)                  │  │
│  │        result[63:32] ← packed_result[31:0]  (slot 1)                  │  │
│  │  FP16: result[15:0]  ← packed_result[15:0]  (slot 0)                  │  │
│  │        result[31:16] ← packed_result[15:0]  (slot 1)                  │  │
│  │        result[47:32] ← packed_result[15:0]  (slot 2)                  │  │
│  │        result[63:48] ← packed_result[15:0]  (slot 3)                  │  │
│  └───────────────────────────────────────────────────────────────────────┘  │
│                                                                             │
└─────────────────────────────────────────────────────────────────────────────┘
```

## Máquina de Estados (FSM)

La FSM controla el secuenciamiento de operaciones SIMD:

```
                              ┌──────────────────────────────────────────────┐
                              │                                              │
                              ▼                                              │
                         ┌────────┐                                          │
           valid_in ────►│  IDLE  │◄────────────────────────────────────┐    │
                         └────┬───┘                                     │    │
                              │                                         │    │
          ┌───────────────────┼───────────────────┐                     │    │
          │                   │                   │                     │    │
          ▼                   ▼                   ▼                     │    │
     ┌─────────┐        ┌──────────┐        ┌──────────┐                │    │
     │PROC_FP64│        │PROC_FP32 │        │PROC_FP16 │                │    │
     └────┬────┘        │   _LO    │        │   _0     │                │    │
          │             └────┬─────┘        └────┬─────┘                │    │
          ▼                  │                   │                      │    │
     ┌─────────┐             ▼                   ▼                      │    │
     │WAIT_FP64│        ┌──────────┐        ┌──────────┐                │    │
     └────┬────┘        │WAIT_FP32 │        │WAIT_FP16 │                │    │
          │             │   _LO    │        │   _0     │                │    │
          │             └────┬─────┘        └────┬─────┘                │    │
          │                  │                   │                      │    │
          │                  ▼                   ▼                      │    │
          │             ┌──────────┐        ┌──────────┐                │    │
          │             │PROC_FP32 │        │PROC_FP16 │                │    │
          │             │   _HI    │        │   _1     │                │    │
          │             └────┬─────┘        └────┬─────┘                │    │
          │                  │                   │                      │    │
          │                  ▼                   ▼                      │    │
          │             ┌──────────┐        ┌──────────┐                │    │
          │             │WAIT_FP32 │        │WAIT_FP16 │                │    │
          │             │   _HI    │        │   _1     │                │    │
          │             └────┬─────┘        └────┬─────┘                │    │
          │                  │                   │                      │    │
          │                  │                   ▼                      │    │
          │                  │              ┌──────────┐                │    │
          │                  │              │PROC_FP16 │                │    │
          │                  │              │   _2     │                │    │
          │                  │              └────┬─────┘                │    │
          │                  │                   │                      │    │
          │                  │                   ▼                      │    │
          │                  │              ┌──────────┐                │    │
          │                  │              │WAIT_FP16 │                │    │
          │                  │              │   _2     │                │    │
          │                  │              └────┬─────┘                │    │
          │                  │                   │                      │    │
          │                  │                   ▼                      │    │
          │                  │              ┌──────────┐                │    │
          │                  │              │PROC_FP16 │                │    │
          │                  │              │   _3     │                │    │
          │                  │              └────┬─────┘                │    │
          │                  │                   │                      │    │
          │                  │                   ▼                      │    │
          │                  │              ┌──────────┐                │    │
          │                  │              │WAIT_FP16 │                │    │
          │                  │              │   _3     │────────────────┘    │
          │                  │              └──────────┘                     │
          │                  │                                               │
          └──────────────────┴───────────────────────────────────────────────┘
```

## Operaciones Soportadas

| Operación | Código | Descripción |
|-----------|--------|-------------|
| ADD | 2'b00 | Suma de punto flotante |
| SUB | 2'b01 | Resta de punto flotante |
| MUL | 2'b10 | Multiplicación de punto flotante |
| DIV | 2'b11 | División de punto flotante |

## Precisiones Soportadas

| Precisión | Código | Bits | Exponente | Mantisa | Operaciones SIMD |
|-----------|--------|------|-----------|---------|------------------|
| FP16 | 2'b00 | 16 | 5 | 10 | 4 paralelas |
| FP32 | 2'b01 | 32 | 8 | 23 | 2 paralelas |
| FP64 | 2'b10 | 64 | 11 | 52 | 1 |

## Latencia por Precisión

| Precisión | Ciclos de Reloj | Descripción |
|-----------|-----------------|-------------|
| FP64 | 2 | PROC_FP64 → WAIT_FP64 |
| FP32 | 4 | 2 slots × (PROC + WAIT) |
| FP16 | 8 | 4 slots × (PROC + WAIT) |

## Empaquetado SIMD

### FP32 (2 operaciones en 64 bits)
```
┌────────────────────────────────────────────────────────────────┐
│                        64-bit word                             │
├────────────────────────────┬───────────────────────────────────┤
│      [63:32] - FP32 Hi     │       [31:0] - FP32 Lo            │
│      (Slot 1)              │       (Slot 0)                    │
└────────────────────────────┴───────────────────────────────────┘
```

### FP16 (4 operaciones en 64 bits)
```
┌─────────────────────────────────────────────────────────────────────────────┐
│                              64-bit word                                    │
├─────────────────┬─────────────────┬─────────────────┬───────────────────────┤
│ [63:48] FP16    │ [47:32] FP16    │ [31:16] FP16    │ [15:0] FP16           │
│ (Slot 3)        │ (Slot 2)        │ (Slot 1)        │ (Slot 0)              │
└─────────────────┴─────────────────┴─────────────────┴───────────────────────┘
```

## Interfaz de Señales

### Entradas

| Señal | Ancho | Descripción |
|-------|-------|-------------|
| `clk` | 1 | Reloj del sistema |
| `rst_n` | 1 | Reset activo bajo |
| `valid_in` | 1 | Indica operandos válidos |
| `precision` | 2 | Selección de precisión (FP16/FP32/FP64) |
| `op` | 2 | Operación a realizar (ADD/SUB/MUL/DIV) |
| `operand_a` | 64 | Operando A (empaquetado SIMD) |
| `operand_b` | 64 | Operando B (empaquetado SIMD) |

### Salidas

| Señal | Ancho | Descripción |
|-------|-------|-------------|
| `valid_out` | 1 | Indica resultado válido |
| `precision_out` | 2 | Precisión del resultado |
| `result` | 64 | Resultado (empaquetado SIMD) |
| `exceptions` | 4 | Flags de excepción |

### Excepciones

| Flag | Descripción |
|------|-------------|
| `invalid` | Operación inválida (NaN, 0/0, ∞-∞) |
| `div_zero` | División por cero |
| `overflow` | Resultado excede rango representable |
| `underflow` | Resultado demasiado pequeño |

## Módulos

### fpu_pkg.sv
Definiciones de tipos, constantes y estructuras:
- `precision_e`: Enumeración de precisiones
- `operation_e`: Enumeración de operaciones
- `fp_internal_t`: Estructura interna para representación FP64
- `fp_exceptions_t`: Estructura de excepciones
- Constantes IEEE-754 (bias, anchos de exponente/mantisa)

### fp_unpack.sv
Convierte formato IEEE-754 a representación interna FP64:
- Extrae signo, exponente y fracción
- Reajusta exponente al bias de FP64
- Justifica mantisa a la izquierda con bit implícito

### fpu_core.sv
Unidad de ejecución aritmética en formato FP64:
- **ADD/SUB**: Alineación de mantisas, suma/resta, normalización
- **MUL**: Multiplicación 54×54 bits, normalización
- **DIV**: División 107÷54 bits, normalización

### fp_pack.sv
Convierte resultado interno a formato IEEE-754:
- Redondeo (round-to-nearest-even)
- Ajuste de exponente al bias de precisión destino
- Detección de overflow/underflow

### fpu_top.sv
Módulo principal con FSM de secuenciamiento:
- Control de flujo SIMD time-multiplexed
- Multiplexado de slots de operandos
- Acumulación de resultados parciales

## Comparación con Otras Arquitecturas

| Característica | D1 (SIMD Paralelo) | D2 (Unified) | **D3 (TM-SIMD)** |
|---------------|-------------------|--------------|------------------|
| Cores FPU | 7 | 1 | **1** |
| Área relativa | Alta | Baja | **Baja** |
| FP64 latencia | 1 ciclo | 1 ciclo | **2 ciclos** |
| FP32 SIMD | ✅ 1 ciclo | ❌ | **✅ 4 ciclos** |
| FP16 SIMD | ✅ 1 ciclo | ❌ | **✅ 8 ciclos** |
| Throughput FP64 | 1 op/ciclo | 1 op/ciclo | **0.5 op/ciclo** |
| Throughput FP32 | 2 ops/ciclo | 1 op/ciclo | **0.5 ops/ciclo** |
| Throughput FP16 | 4 ops/ciclo | 1 op/ciclo | **0.5 ops/ciclo** |
| Complejidad | Alta | Media | **Media** |

## Ventajas del Diseño

1. **Área mínima**: Un solo core FP64 reutilizado para todas las precisiones
2. **SIMD completo**: Soporta operaciones vectoriales en FP16 y FP32
3. **Simplicidad**: FSM clara para control de secuenciamiento
4. **Verificabilidad**: Más fácil de verificar que arquitecturas paralelas
5. **Flexibilidad**: Fácil agregar más precisiones o operaciones

## Limitaciones

1. **Latencia**: Mayor latencia para operaciones SIMD vs arquitectura paralela
2. **Throughput**: Menor throughput pico que D1
3. **No pipeline**: Las operaciones no se pueden encolar

## Simulación

Architecture: Single FP64 core, sequential SIMD processing  FP64: 1 cycle, FP32 (2 operations packed): 2 cycles, FP16 (4 operations packed): 4 cycles
```
[TEST 01] FP64 ADD:  A =   1.000000,                                 B = 2.000000                                  PASS: Result =   3.000000
[TEST 02] FP64 SUB:  A =   3.000000,                                 B = 1.000000                                  PASS: Result =   2.000000
[TEST 03] FP64 MUL:  A =   2.000000,                                 B = 3.000000                                  PASS: Result =   6.000000
[TEST 04] FP64 DIV:  A =   8.000000,                                 B = 2.000000                                  PASS: Result =   4.000000
[TEST 05] FP32 ADD:  A = { 3.000000, 1.000000},                      B = {4.000000, 2.000000}                      PASS: Result = { 7.000000, 3.000000}
[TEST 06] FP32 SUB:  A = { 5.000000, 4.000000},                      B = {3.000000, 1.000000}                      PASS: Result = { 2.000000, 3.000000}
[TEST 07] FP32 MUL:  A = { 3.000000, 2.000000},                      B = {4.000000, 3.000000}                      PASS: Result = {12.000000, 6.000000}
[TEST 08] FP32 DIV:  A = {10.000000, 8.000000},                      B = {2.000000, 4.000000}                      PASS: Result = { 5.000000, 2.000000}
[TEST 09] FP16 ADD:  A = { 4.000000, 3.000000, 2.000000, 1.000000},  B = {5.000000, 4.000000, 3.000000, 2.000000}  PASS: Result = { 9.000000, 7.000000, 5.000000, 3.000000}
[TEST 10] FP16 SUB:  A = { 8.000000, 6.000000, 4.000000, 3.000000},  B = {4.000000, 3.000000, 2.000000, 1.000000}  PASS: Result = { 4.000000, 3.000000, 2.000000, 2.000000}
[TEST 11] FP16 MUL:  A = { 4.000000, 3.000000, 2.000000, 1.000000},  B = {2.000000, 3.000000, 4.000000, 5.000000}  PASS: Result = { 8.000000, 9.000000, 8.000000, 5.000000}
[TEST 12] FP16 DIV:  A = { 8.000000, 6.000000, 4.000000, 2.000000},  B = {2.000000, 3.000000, 2.000000, 1.000000}  PASS: Result = { 4.000000, 2.000000, 2.000000, 2.000000}
```

### Compilación con Icarus Verilog
```bash
iverilog -g2012 -o sim/sim_fpu \
  rtl/fpu_pkg.sv \
  rtl/fp_unpack.sv \
  rtl/fp_pack.sv \
  rtl/fpu_core.sv \
  rtl/fpu_top.sv \
  testbench/fpu_tb.sv
```

### Ejecución
```bash
vvp sim_fpu
```

### Resultados Esperados
```
============================================================
  D3: Time-Multiplexed SIMD FPU Testbench
============================================================
  Test Summary: 12/12 tests passed
  *** ALL TESTS PASSED! ***
============================================================
```

## Integración con AXI

Para integrar con el bus AXI Lite, usar `fpu_axi_wrapper.sv` con el siguiente mapa de registros:

| Offset | Registro | R/W | Descripción |
|--------|----------|-----|-------------|
| 0x00 | OPERAND_A_LO | W | Operando A [31:0] |
| 0x04 | OPERAND_A_HI | W | Operando A [63:32] |
| 0x08 | OPERAND_B_LO | W | Operando B [31:0] |
| 0x0C | OPERAND_B_HI | W | Operando B [63:32] |
| 0x10 | CONTROL | W | {start, op[1:0], precision[1:0]} |
| 0x14 | RESULT_LO | R | Resultado [31:0] |
| 0x18 | RESULT_HI | R | Resultado [63:32] |
| 0x1C | STATUS | R | {exceptions[3:0], valid} |

## Plataforma Objetivo

- **FPGA**: AMD/Xilinx Kria KV260
- **Interfaz**: AXI Lite
- **Dirección base**: 0xA0000000

## Autores

Proyecto Final - FPGAs

## Licencia

Uso académico
