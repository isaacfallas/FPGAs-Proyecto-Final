#ifndef FPU_STUB_H
#define FPU_STUB_H

#include <ap_int.h>

// Matches precision_e in fpu_pkg
enum Precision {
    PREC_FP16 = 0,
    PREC_FP32 = 1,
    PREC_FP64 = 2
};

// Matches operation_e in fpu_pkg
enum Operation {
    OP_ADD = 0,
    OP_SUB = 1,
    OP_MUL = 2,
    OP_DIV = 3
};

// Typedef for the exception struct (5 bits total)
typedef struct {
    ap_uint<1> invalid;
    ap_uint<1> div_zero;
    ap_uint<1> overflow;
    ap_uint<1> underflow;
    ap_uint<1> inexact;
} Exceptions;

#endif