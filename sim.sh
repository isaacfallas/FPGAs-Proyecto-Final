#!/bin/bash
# ============================================================================
# Script de simulación para FPU
# ============================================================================
# Uso: ./sim.sh [d1|d2]
#   d1 - Ejecuta testbench del diseño D1 (SIMD)
#   d2 - Ejecuta testbench del diseño D2 (Reusable Blocks)
# ============================================================================

set -e

SIM_DIR="sim"
RTL_DIR="rtl"
TB_DIR="testbench"

mkdir -p $SIM_DIR

DESIGN=${1:-d1}

if [ "$DESIGN" == "d1" ]; then
    echo "=== Compilando D1 (SIMD) ==="
    iverilog -g2012 -o $SIM_DIR/d1_test.vvp \
        $RTL_DIR/D1/fpu_pkg.sv \
        $RTL_DIR/D1/fp16_unit.sv \
        $RTL_DIR/D1/fp32_unit.sv \
        $RTL_DIR/D1/fp64_unit.sv \
        $RTL_DIR/D1/fpu_top.sv \
        $TB_DIR/D1/fpu_tb.sv 2>&1 | grep -v "sorry:" || true
    
    echo ""
    echo "=== Ejecutando D1 ==="
    vvp $SIM_DIR/d1_test.vvp

elif [ "$DESIGN" == "d2" ]; then
    echo "=== Compilando D2 (Reusable Blocks) ==="
    iverilog -g2012 -o $SIM_DIR/d2_test.vvp \
        $RTL_DIR/D2/fpu_pkg.sv \
        $RTL_DIR/D2/fp_unpack.sv \
        $RTL_DIR/D2/fp_pack.sv \
        $RTL_DIR/D2/mantissa_mul.sv \
        $RTL_DIR/D2/fpu_core.sv \
        $RTL_DIR/D2/fpu_top.sv \
        $TB_DIR/D2/fpu_tb.sv 2>&1 | grep -v "sorry:" || true
    
    echo ""
    echo "=== Ejecutando D2 (timeout 10s) ==="
    timeout 10 vvp $SIM_DIR/d2_test.vvp || echo "[TIMEOUT] D2 tiene un bug - se cuelga"

else
    echo "Uso: ./sim.sh [d1|d2]"
    exit 1
fi
