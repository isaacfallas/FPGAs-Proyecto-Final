// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2024.1 (64-bit)
// Tool Version Limit: 2024.05
// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
// 
// ==============================================================
/***************************** Include Files *********************************/
#include "xfpu_top.h"

/************************** Function Implementation *************************/
#ifndef __linux__
int XFpu_top_CfgInitialize(XFpu_top *InstancePtr, XFpu_top_Config *ConfigPtr) {
    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(ConfigPtr != NULL);

    InstancePtr->Control_BaseAddress = ConfigPtr->Control_BaseAddress;
    InstancePtr->IsReady = XIL_COMPONENT_IS_READY;

    return XST_SUCCESS;
}
#endif

void XFpu_top_Set_rst_n(XFpu_top *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XFpu_top_WriteReg(InstancePtr->Control_BaseAddress, XFPU_TOP_CONTROL_ADDR_RST_N_DATA, Data);
}

u32 XFpu_top_Get_rst_n(XFpu_top *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XFpu_top_ReadReg(InstancePtr->Control_BaseAddress, XFPU_TOP_CONTROL_ADDR_RST_N_DATA);
    return Data;
}

void XFpu_top_Set_ce_r(XFpu_top *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XFpu_top_WriteReg(InstancePtr->Control_BaseAddress, XFPU_TOP_CONTROL_ADDR_CE_R_DATA, Data);
}

u32 XFpu_top_Get_ce_r(XFpu_top *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XFpu_top_ReadReg(InstancePtr->Control_BaseAddress, XFPU_TOP_CONTROL_ADDR_CE_R_DATA);
    return Data;
}

void XFpu_top_Set_valid_in(XFpu_top *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XFpu_top_WriteReg(InstancePtr->Control_BaseAddress, XFPU_TOP_CONTROL_ADDR_VALID_IN_DATA, Data);
}

u32 XFpu_top_Get_valid_in(XFpu_top *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XFpu_top_ReadReg(InstancePtr->Control_BaseAddress, XFPU_TOP_CONTROL_ADDR_VALID_IN_DATA);
    return Data;
}

void XFpu_top_Set_precision(XFpu_top *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XFpu_top_WriteReg(InstancePtr->Control_BaseAddress, XFPU_TOP_CONTROL_ADDR_PRECISION_DATA, Data);
}

u32 XFpu_top_Get_precision(XFpu_top *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XFpu_top_ReadReg(InstancePtr->Control_BaseAddress, XFPU_TOP_CONTROL_ADDR_PRECISION_DATA);
    return Data;
}

void XFpu_top_Set_op(XFpu_top *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XFpu_top_WriteReg(InstancePtr->Control_BaseAddress, XFPU_TOP_CONTROL_ADDR_OP_DATA, Data);
}

u32 XFpu_top_Get_op(XFpu_top *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XFpu_top_ReadReg(InstancePtr->Control_BaseAddress, XFPU_TOP_CONTROL_ADDR_OP_DATA);
    return Data;
}

void XFpu_top_Set_operand_a(XFpu_top *InstancePtr, u64 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XFpu_top_WriteReg(InstancePtr->Control_BaseAddress, XFPU_TOP_CONTROL_ADDR_OPERAND_A_DATA, (u32)(Data));
    XFpu_top_WriteReg(InstancePtr->Control_BaseAddress, XFPU_TOP_CONTROL_ADDR_OPERAND_A_DATA + 4, (u32)(Data >> 32));
}

u64 XFpu_top_Get_operand_a(XFpu_top *InstancePtr) {
    u64 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XFpu_top_ReadReg(InstancePtr->Control_BaseAddress, XFPU_TOP_CONTROL_ADDR_OPERAND_A_DATA);
    Data += (u64)XFpu_top_ReadReg(InstancePtr->Control_BaseAddress, XFPU_TOP_CONTROL_ADDR_OPERAND_A_DATA + 4) << 32;
    return Data;
}

void XFpu_top_Set_operand_b(XFpu_top *InstancePtr, u64 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XFpu_top_WriteReg(InstancePtr->Control_BaseAddress, XFPU_TOP_CONTROL_ADDR_OPERAND_B_DATA, (u32)(Data));
    XFpu_top_WriteReg(InstancePtr->Control_BaseAddress, XFPU_TOP_CONTROL_ADDR_OPERAND_B_DATA + 4, (u32)(Data >> 32));
}

u64 XFpu_top_Get_operand_b(XFpu_top *InstancePtr) {
    u64 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XFpu_top_ReadReg(InstancePtr->Control_BaseAddress, XFPU_TOP_CONTROL_ADDR_OPERAND_B_DATA);
    Data += (u64)XFpu_top_ReadReg(InstancePtr->Control_BaseAddress, XFPU_TOP_CONTROL_ADDR_OPERAND_B_DATA + 4) << 32;
    return Data;
}

void XFpu_top_Set_valid_out(XFpu_top *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XFpu_top_WriteReg(InstancePtr->Control_BaseAddress, XFPU_TOP_CONTROL_ADDR_VALID_OUT_DATA, Data);
}

u32 XFpu_top_Get_valid_out(XFpu_top *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XFpu_top_ReadReg(InstancePtr->Control_BaseAddress, XFPU_TOP_CONTROL_ADDR_VALID_OUT_DATA);
    return Data;
}

void XFpu_top_Set_precision_out(XFpu_top *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XFpu_top_WriteReg(InstancePtr->Control_BaseAddress, XFPU_TOP_CONTROL_ADDR_PRECISION_OUT_DATA, Data);
}

u32 XFpu_top_Get_precision_out(XFpu_top *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XFpu_top_ReadReg(InstancePtr->Control_BaseAddress, XFPU_TOP_CONTROL_ADDR_PRECISION_OUT_DATA);
    return Data;
}

void XFpu_top_Set_result(XFpu_top *InstancePtr, u64 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XFpu_top_WriteReg(InstancePtr->Control_BaseAddress, XFPU_TOP_CONTROL_ADDR_RESULT_DATA, (u32)(Data));
    XFpu_top_WriteReg(InstancePtr->Control_BaseAddress, XFPU_TOP_CONTROL_ADDR_RESULT_DATA + 4, (u32)(Data >> 32));
}

u64 XFpu_top_Get_result(XFpu_top *InstancePtr) {
    u64 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XFpu_top_ReadReg(InstancePtr->Control_BaseAddress, XFPU_TOP_CONTROL_ADDR_RESULT_DATA);
    Data += (u64)XFpu_top_ReadReg(InstancePtr->Control_BaseAddress, XFPU_TOP_CONTROL_ADDR_RESULT_DATA + 4) << 32;
    return Data;
}

void XFpu_top_Set_exceptions(XFpu_top *InstancePtr, u32 Data) {
    Xil_AssertVoid(InstancePtr != NULL);
    Xil_AssertVoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    XFpu_top_WriteReg(InstancePtr->Control_BaseAddress, XFPU_TOP_CONTROL_ADDR_EXCEPTIONS_DATA, Data);
}

u32 XFpu_top_Get_exceptions(XFpu_top *InstancePtr) {
    u32 Data;

    Xil_AssertNonvoid(InstancePtr != NULL);
    Xil_AssertNonvoid(InstancePtr->IsReady == XIL_COMPONENT_IS_READY);

    Data = XFpu_top_ReadReg(InstancePtr->Control_BaseAddress, XFPU_TOP_CONTROL_ADDR_EXCEPTIONS_DATA);
    return Data;
}

