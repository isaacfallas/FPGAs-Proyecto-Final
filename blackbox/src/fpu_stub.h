#ifndef FPU_STUB_H
#define FPU_STUB_H

#include <ap_int.h>

enum Precision { PREC_FP16 = 0, PREC_FP32 = 1, PREC_FP64 = 2 };
enum Operation { OP_ADD = 0, OP_SUB = 1, OP_MUL = 2, OP_DIV = 3 };

#endif