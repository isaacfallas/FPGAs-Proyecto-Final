// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2024.1 (64-bit)
// Tool Version Limit: 2024.05
// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
// 
// ==============================================================
#ifndef __linux__

#include "xstatus.h"
#ifdef SDT
#include "xparameters.h"
#endif
#include "xfpu_top.h"

extern XFpu_top_Config XFpu_top_ConfigTable[];

#ifdef SDT
XFpu_top_Config *XFpu_top_LookupConfig(UINTPTR BaseAddress) {
	XFpu_top_Config *ConfigPtr = NULL;

	int Index;

	for (Index = (u32)0x0; XFpu_top_ConfigTable[Index].Name != NULL; Index++) {
		if (!BaseAddress || XFpu_top_ConfigTable[Index].Control_BaseAddress == BaseAddress) {
			ConfigPtr = &XFpu_top_ConfigTable[Index];
			break;
		}
	}

	return ConfigPtr;
}

int XFpu_top_Initialize(XFpu_top *InstancePtr, UINTPTR BaseAddress) {
	XFpu_top_Config *ConfigPtr;

	Xil_AssertNonvoid(InstancePtr != NULL);

	ConfigPtr = XFpu_top_LookupConfig(BaseAddress);
	if (ConfigPtr == NULL) {
		InstancePtr->IsReady = 0;
		return (XST_DEVICE_NOT_FOUND);
	}

	return XFpu_top_CfgInitialize(InstancePtr, ConfigPtr);
}
#else
XFpu_top_Config *XFpu_top_LookupConfig(u16 DeviceId) {
	XFpu_top_Config *ConfigPtr = NULL;

	int Index;

	for (Index = 0; Index < XPAR_XFPU_TOP_NUM_INSTANCES; Index++) {
		if (XFpu_top_ConfigTable[Index].DeviceId == DeviceId) {
			ConfigPtr = &XFpu_top_ConfigTable[Index];
			break;
		}
	}

	return ConfigPtr;
}

int XFpu_top_Initialize(XFpu_top *InstancePtr, u16 DeviceId) {
	XFpu_top_Config *ConfigPtr;

	Xil_AssertNonvoid(InstancePtr != NULL);

	ConfigPtr = XFpu_top_LookupConfig(DeviceId);
	if (ConfigPtr == NULL) {
		InstancePtr->IsReady = 0;
		return (XST_DEVICE_NOT_FOUND);
	}

	return XFpu_top_CfgInitialize(InstancePtr, ConfigPtr);
}
#endif

#endif

