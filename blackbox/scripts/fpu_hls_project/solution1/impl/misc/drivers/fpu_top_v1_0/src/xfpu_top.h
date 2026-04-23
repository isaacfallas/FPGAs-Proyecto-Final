// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2024.1 (64-bit)
// Tool Version Limit: 2024.05
// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
// 
// ==============================================================
#ifndef XFPU_TOP_H
#define XFPU_TOP_H

#ifdef __cplusplus
extern "C" {
#endif

/***************************** Include Files *********************************/
#ifndef __linux__
#include "xil_types.h"
#include "xil_assert.h"
#include "xstatus.h"
#include "xil_io.h"
#else
#include <stdint.h>
#include <assert.h>
#include <dirent.h>
#include <fcntl.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/mman.h>
#include <unistd.h>
#include <stddef.h>
#endif
#include "xfpu_top_hw.h"

/**************************** Type Definitions ******************************/
#ifdef __linux__
typedef uint8_t u8;
typedef uint16_t u16;
typedef uint32_t u32;
typedef uint64_t u64;
#else
typedef struct {
#ifdef SDT
    char *Name;
#else
    u16 DeviceId;
#endif
    u64 Control_BaseAddress;
} XFpu_top_Config;
#endif

typedef struct {
    u64 Control_BaseAddress;
    u32 IsReady;
} XFpu_top;

typedef u32 word_type;

/***************** Macros (Inline Functions) Definitions *********************/
#ifndef __linux__
#define XFpu_top_WriteReg(BaseAddress, RegOffset, Data) \
    Xil_Out32((BaseAddress) + (RegOffset), (u32)(Data))
#define XFpu_top_ReadReg(BaseAddress, RegOffset) \
    Xil_In32((BaseAddress) + (RegOffset))
#else
#define XFpu_top_WriteReg(BaseAddress, RegOffset, Data) \
    *(volatile u32*)((BaseAddress) + (RegOffset)) = (u32)(Data)
#define XFpu_top_ReadReg(BaseAddress, RegOffset) \
    *(volatile u32*)((BaseAddress) + (RegOffset))

#define Xil_AssertVoid(expr)    assert(expr)
#define Xil_AssertNonvoid(expr) assert(expr)

#define XST_SUCCESS             0
#define XST_DEVICE_NOT_FOUND    2
#define XST_OPEN_DEVICE_FAILED  3
#define XIL_COMPONENT_IS_READY  1
#endif

/************************** Function Prototypes *****************************/
#ifndef __linux__
#ifdef SDT
int XFpu_top_Initialize(XFpu_top *InstancePtr, UINTPTR BaseAddress);
XFpu_top_Config* XFpu_top_LookupConfig(UINTPTR BaseAddress);
#else
int XFpu_top_Initialize(XFpu_top *InstancePtr, u16 DeviceId);
XFpu_top_Config* XFpu_top_LookupConfig(u16 DeviceId);
#endif
int XFpu_top_CfgInitialize(XFpu_top *InstancePtr, XFpu_top_Config *ConfigPtr);
#else
int XFpu_top_Initialize(XFpu_top *InstancePtr, const char* InstanceName);
int XFpu_top_Release(XFpu_top *InstancePtr);
#endif


void XFpu_top_Set_rst_n(XFpu_top *InstancePtr, u32 Data);
u32 XFpu_top_Get_rst_n(XFpu_top *InstancePtr);
void XFpu_top_Set_ce_r(XFpu_top *InstancePtr, u32 Data);
u32 XFpu_top_Get_ce_r(XFpu_top *InstancePtr);
void XFpu_top_Set_valid_in(XFpu_top *InstancePtr, u32 Data);
u32 XFpu_top_Get_valid_in(XFpu_top *InstancePtr);
void XFpu_top_Set_precision(XFpu_top *InstancePtr, u32 Data);
u32 XFpu_top_Get_precision(XFpu_top *InstancePtr);
void XFpu_top_Set_op(XFpu_top *InstancePtr, u32 Data);
u32 XFpu_top_Get_op(XFpu_top *InstancePtr);
void XFpu_top_Set_operand_a(XFpu_top *InstancePtr, u64 Data);
u64 XFpu_top_Get_operand_a(XFpu_top *InstancePtr);
void XFpu_top_Set_operand_b(XFpu_top *InstancePtr, u64 Data);
u64 XFpu_top_Get_operand_b(XFpu_top *InstancePtr);
void XFpu_top_Set_valid_out(XFpu_top *InstancePtr, u32 Data);
u32 XFpu_top_Get_valid_out(XFpu_top *InstancePtr);
void XFpu_top_Set_precision_out(XFpu_top *InstancePtr, u32 Data);
u32 XFpu_top_Get_precision_out(XFpu_top *InstancePtr);
void XFpu_top_Set_result(XFpu_top *InstancePtr, u64 Data);
u64 XFpu_top_Get_result(XFpu_top *InstancePtr);
void XFpu_top_Set_exceptions(XFpu_top *InstancePtr, u32 Data);
u32 XFpu_top_Get_exceptions(XFpu_top *InstancePtr);

#ifdef __cplusplus
}
#endif

#endif
