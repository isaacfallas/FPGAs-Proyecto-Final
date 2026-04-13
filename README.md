# Time-Multiplexed SIMD FPU

https://github.com/isaacfallas/FPGAs-Proyecto-Final

## Descripción General

Este proyecto presenta una unidad de punto flotante (FPU) que implementa operaciones SIMD mediante multiplexación temporal. Utiliza un único core de 64 bits para procesar secuencialmente múltiples operaciones de menor precisión.

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

## Simulación

### Compilación y ejecución con Makefile
```bash
make clean && make run
```
Alternativamente, para compilar sin ejecutar:
```bash
make compile
```

```
Architecture: Single FP64 core, sequential SIMD processing  FP64: 1 cycle, FP32 (2 operations packed): 2 cycles, FP16 (4 operations packed): 4 cycles

[TEST 1] FP64 ADD: 1.0 + 2.0 (FP64)  A = 1.000000, B = 2.000000  PASS: Result = 3.000000 (expected 3.000000)

[TEST 2] FP64 SUB: 3.0 - 1.0 (FP64)  A = 3.000000, B = 1.000000  PASS: Result = 2.000000 (expected 2.000000)

[TEST 3] FP64 MUL: 2.0 * 3.0 (FP64)  A = 2.000000, B = 3.000000  PASS: Result = 6.000000 (expected 6.000000)

[TEST 4] FP64 DIV: 8.0 / 2.0 (FP64)  A = 8.000000, B = 2.000000  PASS: Result = 4.000000 (expected 4.000000)

[TEST 5] FP32 SIMD ADD (FP32 SIMD)  A = {3.000000, 1.000000}, B = {4.000000, 2.000000}  PASS: Result = {7.000000, 3.000000}

[TEST 6] FP32 SIMD SUB (FP32 SIMD)  A = {5.000000, 4.000000}, B = {3.000000, 1.000000}  PASS: Result = {2.000000, 3.000000}

[TEST 7] FP32 SIMD MUL (FP32 SIMD)  A = {3.000000, 2.000000}, B = {4.000000, 3.000000}  PASS: Result = {12.000000, 6.000000}

[TEST 8] FP32 SIMD DIV (FP32 SIMD)  A = {10.000000, 8.000000}, B = {2.000000, 4.000000}  PASS: Result = {5.000000, 2.000000}

[TEST 9] FP16 SIMD ADD (FP16 SIMD)  A = {4.000000, 3.000000, 2.000000, 1.000000}  B = {5.000000, 4.000000, 3.000000, 2.000000}  PASS: Result = {9.000000, 7.000000, 5.000000, 3.000000}

[TEST 10] FP16 SIMD SUB (FP16 SIMD)  A = {8.000000, 6.000000, 4.000000, 3.000000}  B = {4.000000, 3.000000, 2.000000, 1.000000}  PASS: Result = {4.000000, 3.000000, 2.000000, 2.000000}

[TEST 11] FP16 SIMD MUL (FP16 SIMD)  A = {4.000000, 3.000000, 2.000000, 1.000000}  B = {2.000000, 3.000000, 4.000000, 5.000000}  PASS: Result = {8.000000, 9.000000, 8.000000, 5.000000}

[TEST 12] FP16 SIMD DIV (FP16 SIMD)  A = {8.000000, 6.000000, 4.000000, 2.000000}  B = {2.000000, 3.000000, 2.000000, 1.000000}  PASS: Result = {4.000000, 2.000000, 2.000000, 2.000000}
```

### Resultados Esperados
```
============================================================
  Time-Multiplexed SIMD FPU Testbench
============================================================
  Test Summary: 12/12 tests passed
  *** ALL TESTS PASSED! ***
============================================================
```

El waveform se guarda en `sim/fpu_tb.vcd`

## Componentes y herramientas utilizadas

### HDL
- **SystemVerilog**: Desarrollo de módulos de la FPU
- **Verilog**: Wrapper de la FPU para Vivado

### Herramientas de Diseño y Simulación
- **Icarus Verilog**: Compilador HDL de código abierto (`iverilog`)

- **Vivado Design Suite**
  - Síntesis RTL
  - Place & Route en la plataforma objetivo
  - Generación de bitstream

- **Vitis HLS**: Para blackboxing

### Plataforma Objetivo
- **FPGA**: AMD/Xilinx Kria KV260

-------

### MP-6166 Diseño Avanzado con FPGAs
### Maestría en Ingeniería Electrónica
### Instituto Tecnológico de Costa Rica
### Profesor Ph. D. León Vega, Luis Gerardo

### Estudiantes

Aguero Villagra, Leonardo Enrique

Cruz Soto, Federico Alonso

Fallas Mejía, Jorge Isaac

Gutiérrez Quesada, Allan Mauricio