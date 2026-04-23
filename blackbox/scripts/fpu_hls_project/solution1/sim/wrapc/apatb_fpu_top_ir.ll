; ModuleID = 'C:/Users/umbre/Downloads/FPGAs-Proyecto-Final/blackbox/scripts/fpu_hls_project/solution1/.autopilot/db/a.g.ld.5.gdce.bc'
source_filename = "llvm-link"
target datalayout = "e-m:e-i64:64-i128:128-i256:256-i512:512-i1024:1024-i2048:2048-i4096:4096-n8:16:32:64-S128-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024"
target triple = "fpga64-xilinx-none"

%"struct.ap_uint<2>" = type { %"struct.ap_int_base<2, false>" }
%"struct.ap_int_base<2, false>" = type { %"struct.ssdm_int<2, false>" }
%"struct.ssdm_int<2, false>" = type { i2 }
%"struct.ap_uint<64>" = type { %"struct.ap_int_base<64, false>" }
%"struct.ap_int_base<64, false>" = type { %"struct.ssdm_int<64, false>" }
%"struct.ssdm_int<64, false>" = type { i64 }
%"struct.ap_uint<5>" = type { %"struct.ap_int_base<5, false>" }
%"struct.ap_int_base<5, false>" = type { %"struct.ssdm_int<5, false>" }
%"struct.ssdm_int<5, false>" = type { i5 }

; Function Attrs: inaccessiblemem_or_argmemonly noinline willreturn
define void @apatb_fpu_top_ir(i1 zeroext %clk, i1 zeroext %rst_n, i1 zeroext %ce, i1 zeroext %valid_in, %"struct.ap_uint<2>"* nocapture readonly %precision, %"struct.ap_uint<2>"* nocapture readonly %op, %"struct.ap_uint<64>"* nocapture readonly %operand_a, %"struct.ap_uint<64>"* nocapture readonly %operand_b, i1* noalias nocapture nonnull readonly dereferenceable(1) %valid_out, %"struct.ap_uint<2>"* noalias nocapture nonnull readonly dereferenceable(1) %precision_out, %"struct.ap_uint<64>"* noalias nocapture nonnull readonly dereferenceable(8) %result, %"struct.ap_uint<5>"* noalias nocapture nonnull readonly %exceptions) local_unnamed_addr #0 {
entry:
  %valid_out_copy = alloca i1, align 512
  %precision_out_copy = alloca i2, align 512
  %result_copy = alloca i64, align 512
  %exceptions_copy = alloca i5, align 512
  call fastcc void @copy_in(i1* nonnull %valid_out, i1* nonnull align 512 %valid_out_copy, %"struct.ap_uint<2>"* nonnull %precision_out, i2* nonnull align 512 %precision_out_copy, %"struct.ap_uint<64>"* nonnull %result, i64* nonnull align 512 %result_copy, %"struct.ap_uint<5>"* nonnull %exceptions, i5* nonnull align 512 %exceptions_copy)
  call void @apatb_fpu_top_hw(i1 %clk, i1 %rst_n, i1 %ce, i1 %valid_in, %"struct.ap_uint<2>"* %precision, %"struct.ap_uint<2>"* %op, %"struct.ap_uint<64>"* %operand_a, %"struct.ap_uint<64>"* %operand_b, i1* %valid_out_copy, i2* %precision_out_copy, i64* %result_copy, i5* %exceptions_copy)
  call void @copy_back(i1* %valid_out, i1* %valid_out_copy, %"struct.ap_uint<2>"* %precision_out, i2* %precision_out_copy, %"struct.ap_uint<64>"* %result, i64* %result_copy, %"struct.ap_uint<5>"* %exceptions, i5* %exceptions_copy)
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define internal fastcc void @copy_in(i1* noalias readonly "unpacked"="0", i1* noalias align 512 "unpacked"="1", %"struct.ap_uint<2>"* noalias readonly "unpacked"="2", i2* noalias nocapture align 512 "unpacked"="3.0", %"struct.ap_uint<64>"* noalias readonly "unpacked"="4", i64* noalias nocapture align 512 "unpacked"="5.0", %"struct.ap_uint<5>"* noalias readonly "unpacked"="6", i5* noalias nocapture align 512 "unpacked"="7.0") unnamed_addr #1 {
entry:
  call fastcc void @onebyonecpy_hls.p0i1(i1* align 512 %1, i1* %0)
  call fastcc void @"onebyonecpy_hls.p0struct.ap_uint<2>"(i2* align 512 %3, %"struct.ap_uint<2>"* %2)
  call fastcc void @"onebyonecpy_hls.p0struct.ap_uint<64>.11"(i64* align 512 %5, %"struct.ap_uint<64>"* %4)
  call fastcc void @"onebyonecpy_hls.p0struct.ap_uint<5>"(i5* align 512 %7, %"struct.ap_uint<5>"* %6)
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define internal fastcc void @onebyonecpy_hls.p0i1(i1* noalias align 512 %dst, i1* noalias readonly %src) unnamed_addr #2 {
entry:
  %0 = icmp eq i1* %dst, null
  %1 = icmp eq i1* %src, null
  %2 = or i1 %0, %1
  br i1 %2, label %ret, label %copy

copy:                                             ; preds = %entry
  %3 = bitcast i1* %src to i8*
  %4 = load i8, i8* %3
  %5 = trunc i8 %4 to i1
  store i1 %5, i1* %dst, align 512
  br label %ret

ret:                                              ; preds = %copy, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define internal fastcc void @"onebyonecpy_hls.p0struct.ap_uint<2>"(i2* noalias nocapture align 512 "unpacked"="0.0" %dst, %"struct.ap_uint<2>"* noalias readonly "unpacked"="1" %src) unnamed_addr #2 {
entry:
  %0 = icmp eq %"struct.ap_uint<2>"* %src, null
  br i1 %0, label %ret, label %copy

copy:                                             ; preds = %entry
  %src.0.0.03 = getelementptr %"struct.ap_uint<2>", %"struct.ap_uint<2>"* %src, i64 0, i32 0, i32 0, i32 0
  %1 = bitcast i2* %src.0.0.03 to i8*
  %2 = load i8, i8* %1
  %3 = trunc i8 %2 to i2
  store i2 %3, i2* %dst, align 512
  br label %ret

ret:                                              ; preds = %copy, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define internal fastcc void @"onebyonecpy_hls.p0struct.ap_uint<64>"(%"struct.ap_uint<64>"* noalias "unpacked"="0" %dst, i64* noalias nocapture readonly align 512 "unpacked"="1.0" %src) unnamed_addr #2 {
entry:
  %0 = icmp eq %"struct.ap_uint<64>"* %dst, null
  br i1 %0, label %ret, label %copy

copy:                                             ; preds = %entry
  %dst.0.0.04 = getelementptr %"struct.ap_uint<64>", %"struct.ap_uint<64>"* %dst, i64 0, i32 0, i32 0, i32 0
  %1 = load i64, i64* %src, align 512
  store i64 %1, i64* %dst.0.0.04, align 8
  br label %ret

ret:                                              ; preds = %copy, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define internal fastcc void @"onebyonecpy_hls.p0struct.ap_uint<5>"(i5* noalias nocapture align 512 "unpacked"="0.0" %dst, %"struct.ap_uint<5>"* noalias readonly "unpacked"="1" %src) unnamed_addr #2 {
entry:
  %0 = icmp eq %"struct.ap_uint<5>"* %src, null
  br i1 %0, label %ret, label %copy

copy:                                             ; preds = %entry
  %src.0.0.03 = getelementptr %"struct.ap_uint<5>", %"struct.ap_uint<5>"* %src, i64 0, i32 0, i32 0, i32 0
  %1 = bitcast i5* %src.0.0.03 to i8*
  %2 = load i8, i8* %1
  %3 = trunc i8 %2 to i5
  store i5 %3, i5* %dst, align 512
  br label %ret

ret:                                              ; preds = %copy, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define internal fastcc void @copy_out(i1* noalias "unpacked"="0", i1* noalias readonly align 512 "unpacked"="1", %"struct.ap_uint<2>"* noalias "unpacked"="2", i2* noalias nocapture readonly align 512 "unpacked"="3.0", %"struct.ap_uint<64>"* noalias "unpacked"="4", i64* noalias nocapture readonly align 512 "unpacked"="5.0", %"struct.ap_uint<5>"* noalias "unpacked"="6", i5* noalias nocapture readonly align 512 "unpacked"="7.0") unnamed_addr #3 {
entry:
  call fastcc void @onebyonecpy_hls.p0i1(i1* %0, i1* align 512 %1)
  call fastcc void @"onebyonecpy_hls.p0struct.ap_uint<2>.18"(%"struct.ap_uint<2>"* %2, i2* align 512 %3)
  call fastcc void @"onebyonecpy_hls.p0struct.ap_uint<64>"(%"struct.ap_uint<64>"* %4, i64* align 512 %5)
  call fastcc void @"onebyonecpy_hls.p0struct.ap_uint<5>.4"(%"struct.ap_uint<5>"* %6, i5* align 512 %7)
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define internal fastcc void @"onebyonecpy_hls.p0struct.ap_uint<5>.4"(%"struct.ap_uint<5>"* noalias "unpacked"="0" %dst, i5* noalias nocapture readonly align 512 "unpacked"="1.0" %src) unnamed_addr #2 {
entry:
  %0 = icmp eq %"struct.ap_uint<5>"* %dst, null
  br i1 %0, label %ret, label %copy

copy:                                             ; preds = %entry
  %dst.0.0.04 = getelementptr %"struct.ap_uint<5>", %"struct.ap_uint<5>"* %dst, i64 0, i32 0, i32 0, i32 0
  %1 = bitcast i5* %src to i8*
  %2 = load i8, i8* %1
  %3 = trunc i8 %2 to i5
  store i5 %3, i5* %dst.0.0.04, align 1
  br label %ret

ret:                                              ; preds = %copy, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define internal fastcc void @"onebyonecpy_hls.p0struct.ap_uint<64>.11"(i64* noalias nocapture align 512 "unpacked"="0.0" %dst, %"struct.ap_uint<64>"* noalias readonly "unpacked"="1" %src) unnamed_addr #2 {
entry:
  %0 = icmp eq %"struct.ap_uint<64>"* %src, null
  br i1 %0, label %ret, label %copy

copy:                                             ; preds = %entry
  %src.0.0.03 = getelementptr %"struct.ap_uint<64>", %"struct.ap_uint<64>"* %src, i64 0, i32 0, i32 0, i32 0
  %1 = load i64, i64* %src.0.0.03, align 8
  store i64 %1, i64* %dst, align 512
  br label %ret

ret:                                              ; preds = %copy, %entry
  ret void
}

; Function Attrs: argmemonly noinline norecurse willreturn
define internal fastcc void @"onebyonecpy_hls.p0struct.ap_uint<2>.18"(%"struct.ap_uint<2>"* noalias "unpacked"="0" %dst, i2* noalias nocapture readonly align 512 "unpacked"="1.0" %src) unnamed_addr #2 {
entry:
  %0 = icmp eq %"struct.ap_uint<2>"* %dst, null
  br i1 %0, label %ret, label %copy

copy:                                             ; preds = %entry
  %dst.0.0.04 = getelementptr %"struct.ap_uint<2>", %"struct.ap_uint<2>"* %dst, i64 0, i32 0, i32 0, i32 0
  %1 = bitcast i2* %src to i8*
  %2 = load i8, i8* %1
  %3 = trunc i8 %2 to i2
  store i2 %3, i2* %dst.0.0.04, align 1
  br label %ret

ret:                                              ; preds = %copy, %entry
  ret void
}

declare void @apatb_fpu_top_hw(i1, i1, i1, i1, %"struct.ap_uint<2>"*, %"struct.ap_uint<2>"*, %"struct.ap_uint<64>"*, %"struct.ap_uint<64>"*, i1*, i2*, i64*, i5*)

; Function Attrs: argmemonly noinline norecurse willreturn
define internal fastcc void @copy_back(i1* noalias "unpacked"="0", i1* noalias readonly align 512 "unpacked"="1", %"struct.ap_uint<2>"* noalias "unpacked"="2", i2* noalias nocapture readonly align 512 "unpacked"="3.0", %"struct.ap_uint<64>"* noalias "unpacked"="4", i64* noalias nocapture readonly align 512 "unpacked"="5.0", %"struct.ap_uint<5>"* noalias "unpacked"="6", i5* noalias nocapture readonly align 512 "unpacked"="7.0") unnamed_addr #3 {
entry:
  ret void
}

define void @fpu_top_hw_stub_wrapper(i1, i1, i1, i1, %"struct.ap_uint<2>"*, %"struct.ap_uint<2>"*, %"struct.ap_uint<64>"*, %"struct.ap_uint<64>"*, i1*, i2*, i64*, i5*) #4 {
entry:
  %12 = alloca %"struct.ap_uint<2>"
  %13 = alloca %"struct.ap_uint<64>"
  %14 = alloca %"struct.ap_uint<5>"
  call void @copy_out(i1* null, i1* %8, %"struct.ap_uint<2>"* %12, i2* %9, %"struct.ap_uint<64>"* %13, i64* %10, %"struct.ap_uint<5>"* %14, i5* %11)
  call void @fpu_top_hw_stub(i1 %0, i1 %1, i1 %2, i1 %3, %"struct.ap_uint<2>"* %4, %"struct.ap_uint<2>"* %5, %"struct.ap_uint<64>"* %6, %"struct.ap_uint<64>"* %7, i1* %8, %"struct.ap_uint<2>"* %12, %"struct.ap_uint<64>"* %13, %"struct.ap_uint<5>"* %14)
  call void @copy_in(i1* null, i1* %8, %"struct.ap_uint<2>"* %12, i2* %9, %"struct.ap_uint<64>"* %13, i64* %10, %"struct.ap_uint<5>"* %14, i5* %11)
  ret void
}

declare void @fpu_top_hw_stub(i1 zeroext, i1 zeroext, i1 zeroext, i1 zeroext, %"struct.ap_uint<2>"* nocapture readonly, %"struct.ap_uint<2>"* nocapture readonly, %"struct.ap_uint<64>"* nocapture readonly, %"struct.ap_uint<64>"* nocapture readonly, i1* noalias nocapture nonnull readonly, %"struct.ap_uint<2>"* noalias nocapture nonnull readonly, %"struct.ap_uint<64>"* noalias nocapture nonnull readonly, %"struct.ap_uint<5>"* noalias nocapture nonnull readonly)

attributes #0 = { inaccessiblemem_or_argmemonly noinline willreturn "fpga.wrapper.func"="wrapper" }
attributes #1 = { argmemonly noinline norecurse willreturn "fpga.wrapper.func"="copyin" }
attributes #2 = { argmemonly noinline norecurse willreturn "fpga.wrapper.func"="onebyonecpy_hls" }
attributes #3 = { argmemonly noinline norecurse willreturn "fpga.wrapper.func"="copyout" }
attributes #4 = { "fpga.wrapper.func"="stub" }

!llvm.dbg.cu = !{}
!llvm.ident = !{!0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0, !0}
!llvm.module.flags = !{!1, !2, !3}
!blackbox_cfg = !{!4}

!0 = !{!"clang version 7.0.0 "}
!1 = !{i32 2, !"Dwarf Version", i32 4}
!2 = !{i32 2, !"Debug Info Version", i32 3}
!3 = !{i32 1, !"wchar_size", i32 4}
!4 = !{}
