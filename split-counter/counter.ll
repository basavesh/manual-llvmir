; ModuleID = 'counter.c'
source_filename = "counter.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [2 x i8] c"r\00", align 1
@.str.1 = private unnamed_addr constant [23 x i8] c"cannot open file `%s'\0A\00", align 1
@wcount = external global i64, align 8
@total_wcount = external global i64, align 8

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @counter(ptr noundef %0) #0 {
  %2 = alloca ptr, align 8
  %3 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %4 = load ptr, ptr %2, align 8
  %5 = call noalias ptr @fopen(ptr noundef %4, ptr noundef @.str)
  store ptr %5, ptr %3, align 8
  %6 = load ptr, ptr %3, align 8
  %7 = icmp ne ptr %6, null
  br i1 %7, label %11, label %8

8:                                                ; preds = %1
  %9 = load ptr, ptr %2, align 8
  %10 = call i32 (ptr, ...) @printf(ptr noundef @.str.1, ptr noundef %9)
  br label %25

11:                                               ; preds = %1
  store i64 0, ptr @wcount, align 8
  br label %12

12:                                               ; preds = %16, %11
  %13 = load ptr, ptr %3, align 8
  %14 = call i32 @getword(ptr noundef %13)
  %15 = icmp ne i32 %14, 0
  br i1 %15, label %16, label %17

16:                                               ; preds = %12
  br label %12, !llvm.loop !6

17:                                               ; preds = %12
  %18 = load ptr, ptr %3, align 8
  %19 = call i32 @fclose(ptr noundef %18)
  %20 = load ptr, ptr %2, align 8
  %21 = load i64, ptr @wcount, align 8
  call void @report(ptr noundef %20, i64 noundef %21)
  %22 = load i64, ptr @wcount, align 8
  %23 = load i64, ptr @total_wcount, align 8
  %24 = add i64 %23, %22
  store i64 %24, ptr @total_wcount, align 8
  br label %25

25:                                               ; preds = %17, %8
  ret void
}

declare noalias ptr @fopen(ptr noundef, ptr noundef) #1

declare i32 @printf(ptr noundef, ...) #1

declare i32 @getword(ptr noundef) #1

declare i32 @fclose(ptr noundef) #1

declare void @report(ptr noundef, i64 noundef) #1

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }

!llvm.module.flags = !{!0, !1, !2, !3, !4}
!llvm.ident = !{!5}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 8, !"PIC Level", i32 2}
!2 = !{i32 7, !"PIE Level", i32 2}
!3 = !{i32 7, !"uwtable", i32 2}
!4 = !{i32 7, !"frame-pointer", i32 2}
!5 = !{!"Ubuntu clang version 18.1.8 (++20240731025011+3b5b5c1ec4a3-1~exp1~20240731145104.143)"}
!6 = distinct !{!6, !7}
!7 = !{!"llvm.loop.mustprogress"}
