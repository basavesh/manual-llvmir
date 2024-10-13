; ModuleID = 'wc.c'
source_filename = "wc.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@total_wcount = dso_local global i64 0, align 8
@.str = private unnamed_addr constant [9 x i8] c"%6lu %s\0A\00", align 1
@wcount = dso_local global i64 0, align 8
@.str.1 = private unnamed_addr constant [25 x i8] c"usage: wc FILE [FILE...]\00", align 1
@.str.2 = private unnamed_addr constant [6 x i8] c"total\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @report(ptr noundef %0, i64 noundef %1) #0 {
  %3 = alloca ptr, align 8
  %4 = alloca i64, align 8
  store ptr %0, ptr %3, align 8
  store i64 %1, ptr %4, align 8
  %5 = load i64, ptr %4, align 8
  %6 = load ptr, ptr %3, align 8
  %7 = call i32 (ptr, ...) @printf(ptr noundef @.str, i64 noundef %5, ptr noundef %6)
  ret void
}

declare i32 @printf(ptr noundef, ...) #1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @getword(ptr noundef %0) #0 {
  %2 = alloca i32, align 4
  %3 = alloca ptr, align 8
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  store ptr %0, ptr %3, align 8
  store i32 0, ptr %5, align 4
  %6 = load ptr, ptr %3, align 8
  %7 = call i32 @feof(ptr noundef %6) #4
  %8 = icmp ne i32 %7, 0
  br i1 %8, label %9, label %10

9:                                                ; preds = %1
  store i32 0, ptr %2, align 4
  br label %42

10:                                               ; preds = %1
  br label %11

11:                                               ; preds = %23, %10
  %12 = load ptr, ptr %3, align 8
  %13 = call i32 @getc(ptr noundef %12)
  store i32 %13, ptr %4, align 4
  %14 = icmp ne i32 %13, -1
  br i1 %14, label %15, label %24

15:                                               ; preds = %11
  %16 = load i32, ptr %4, align 4
  %17 = trunc i32 %16 to i8
  %18 = call i32 @isword(i8 noundef zeroext %17)
  %19 = icmp ne i32 %18, 0
  br i1 %19, label %20, label %23

20:                                               ; preds = %15
  %21 = load i64, ptr @wcount, align 8
  %22 = add i64 %21, 1
  store i64 %22, ptr @wcount, align 8
  br label %24

23:                                               ; preds = %15
  br label %11, !llvm.loop !6

24:                                               ; preds = %20, %11
  br label %25

25:                                               ; preds = %35, %24
  %26 = load i32, ptr %4, align 4
  %27 = icmp ne i32 %26, -1
  br i1 %27, label %28, label %38

28:                                               ; preds = %25
  %29 = load i32, ptr %4, align 4
  %30 = trunc i32 %29 to i8
  %31 = call i32 @isword(i8 noundef zeroext %30)
  %32 = icmp ne i32 %31, 0
  br i1 %32, label %34, label %33

33:                                               ; preds = %28
  br label %38

34:                                               ; preds = %28
  br label %35

35:                                               ; preds = %34
  %36 = load ptr, ptr %3, align 8
  %37 = call i32 @getc(ptr noundef %36)
  store i32 %37, ptr %4, align 4
  br label %25, !llvm.loop !8

38:                                               ; preds = %33, %25
  %39 = load i32, ptr %4, align 4
  %40 = icmp ne i32 %39, -1
  %41 = zext i1 %40 to i32
  store i32 %41, ptr %2, align 4
  br label %42

42:                                               ; preds = %38, %9
  %43 = load i32, ptr %2, align 4
  ret i32 %43
}

; Function Attrs: nounwind
declare i32 @feof(ptr noundef) #2

declare i32 @getc(ptr noundef) #1

; Function Attrs: noinline nounwind optnone uwtable
define internal i32 @isword(i8 noundef zeroext %0) #0 {
  %2 = alloca i8, align 1
  store i8 %0, ptr %2, align 1
  %3 = call ptr @__ctype_b_loc() #5
  %4 = load ptr, ptr %3, align 8
  %5 = load i8, ptr %2, align 1
  %6 = zext i8 %5 to i32
  %7 = sext i32 %6 to i64
  %8 = getelementptr inbounds i16, ptr %4, i64 %7
  %9 = load i16, ptr %8, align 2
  %10 = zext i16 %9 to i32
  %11 = and i32 %10, 1024
  ret i32 %11
}

; Function Attrs: noinline nounwind optnone uwtable
define dso_local i32 @main(i32 noundef %0, ptr noundef %1) #0 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca ptr, align 8
  %6 = alloca i32, align 4
  store i32 0, ptr %3, align 4
  store i32 %0, ptr %4, align 4
  store ptr %1, ptr %5, align 8
  %7 = load i32, ptr %4, align 4
  %8 = icmp slt i32 %7, 2
  br i1 %8, label %9, label %11

9:                                                ; preds = %2
  %10 = call i32 (ptr, ...) @printf(ptr noundef @.str.1)
  store i32 -1, ptr %3, align 4
  br label %31

11:                                               ; preds = %2
  store i32 1, ptr %6, align 4
  br label %12

12:                                               ; preds = %22, %11
  %13 = load i32, ptr %6, align 4
  %14 = load i32, ptr %4, align 4
  %15 = icmp slt i32 %13, %14
  br i1 %15, label %16, label %25

16:                                               ; preds = %12
  %17 = load ptr, ptr %5, align 8
  %18 = load i32, ptr %6, align 4
  %19 = sext i32 %18 to i64
  %20 = getelementptr inbounds ptr, ptr %17, i64 %19
  %21 = load ptr, ptr %20, align 8
  call void @counter(ptr noundef %21)
  br label %22

22:                                               ; preds = %16
  %23 = load i32, ptr %6, align 4
  %24 = add nsw i32 %23, 1
  store i32 %24, ptr %6, align 4
  br label %12, !llvm.loop !9

25:                                               ; preds = %12
  %26 = load i32, ptr %4, align 4
  %27 = icmp sgt i32 %26, 2
  br i1 %27, label %28, label %30

28:                                               ; preds = %25
  %29 = load i64, ptr @total_wcount, align 8
  call void @report(ptr noundef @.str.2, i64 noundef %29)
  br label %30

30:                                               ; preds = %28, %25
  store i32 0, ptr %3, align 4
  br label %31

31:                                               ; preds = %30, %9
  %32 = load i32, ptr %3, align 4
  ret i32 %32
}

declare void @counter(ptr noundef) #1

; Function Attrs: nounwind willreturn memory(none)
declare ptr @__ctype_b_loc() #3

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind willreturn memory(none) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind }
attributes #5 = { nounwind willreturn memory(none) }

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
!8 = distinct !{!8, !7}
!9 = distinct !{!9, !7}
