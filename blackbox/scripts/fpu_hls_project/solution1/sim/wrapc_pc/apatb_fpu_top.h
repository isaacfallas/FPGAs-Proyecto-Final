// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2024.1 (64-bit)
// Tool Version Limit: 2024.05
// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
// 
// ==============================================================

extern "C" void AESL_WRAP_fpu_top (
char clk,
char rst_n,
char ce_r,
char valid_in,
char precision,
char op,
long long operand_a,
long long operand_b,
volatile void* valid_out,
volatile void* precision_out,
volatile void* result,
volatile void* exceptions);
