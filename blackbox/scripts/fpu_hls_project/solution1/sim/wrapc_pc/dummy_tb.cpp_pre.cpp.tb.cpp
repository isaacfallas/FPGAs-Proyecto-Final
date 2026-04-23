// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2024.1 (64-bit)
// Tool Version Limit: 2024.05
// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
// 
// ==============================================================
# 1 "C:/Users/umbre/Downloads/FPGAs-Proyecto-Final/blackbox/tb/dummy_tb.cpp"
# 1 "<built-in>" 1
# 1 "<built-in>" 3
# 420 "<built-in>" 3
# 1 "<command line>" 1
# 1 "<built-in>" 2
# 1 "C:/Users/umbre/Downloads/FPGAs-Proyecto-Final/blackbox/tb/dummy_tb.cpp" 2




#ifndef HLS_FASTSIM
#ifdef __cplusplus
extern "C"
#endif
void apatb_fpu_top_sw(bool, bool, int, int, unsigned long long, unsigned long long, bool &, unsigned long long &, int &);
#endif
# 4 "C:/Users/umbre/Downloads/FPGAs-Proyecto-Final/blackbox/tb/dummy_tb.cpp"
void fpu_top(bool rst_n, bool valid_in, int precision, int op,
             unsigned long long a, unsigned long long b,
             bool& valid_out, unsigned long long& result, int& ex);


#ifndef HLS_FASTSIM
# 8 "C:/Users/umbre/Downloads/FPGAs-Proyecto-Final/blackbox/tb/dummy_tb.cpp"
int main() {

    bool valid_out = 0;
    unsigned long long result = 0;
    int ex = 0;


    
#ifndef HLS_FASTSIM
#define fpu_top apatb_fpu_top_sw
#endif
# 15 "C:/Users/umbre/Downloads/FPGAs-Proyecto-Final/blackbox/tb/dummy_tb.cpp"
fpu_top(1, 0, 0, 0, 0, 0, valid_out, result, ex);
#undef fpu_top
# 15 "C:/Users/umbre/Downloads/FPGAs-Proyecto-Final/blackbox/tb/dummy_tb.cpp"


    return 0;
}
#endif
# 18 "C:/Users/umbre/Downloads/FPGAs-Proyecto-Final/blackbox/tb/dummy_tb.cpp"

