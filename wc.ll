; ModuleID = 'wc.c'
source_filename = "wc.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.__va_list_tag = type { i32, i32, ptr, ptr }

@total_ccount = dso_local global i64 0, align 8
@total_wcount = dso_local global i64 0, align 8
@total_lcount = dso_local global i64 0, align 8
@.str = private unnamed_addr constant [19 x i8] c"%6lu %6lu %6lu %s\0A\00", align 1
@wcount = dso_local global i64 0, align 8
@ccount = dso_local global i64 0, align 8
@lcount = dso_local global i64 0, align 8
@.str.1 = private unnamed_addr constant [2 x i8] c"r\00", align 1
@.str.2 = private unnamed_addr constant [22 x i8] c"cannot open file `%s'\00", align 1
@.str.3 = private unnamed_addr constant [25 x i8] c"usage: wc FILE [FILE...]\00", align 1
@.str.4 = private unnamed_addr constant [6 x i8] c"total\00", align 1
@stderr = external global ptr, align 8
@.str.5 = private unnamed_addr constant [2 x i8] c" \00", align 1
@.str.6 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1

; Function Attrs: noinline nounwind optnone uwtable
define dso_local void @report(ptr noundef %0, i64 noundef %1, i64 noundef %2, i64 noundef %3) #0 {
  %5 = alloca ptr, align 8
  %6 = alloca i64, align 8
  %7 = alloca i64, align 8
  %8 = alloca i64, align 8
  store ptr %0, ptr %5, align 8
  store i64 %1, ptr %6, align 8
  store i64 %2, ptr %7, align 8
  store i64 %3, ptr %8, align 8
  %9 = load i64, ptr %8, align 8
  %10 = load i64, ptr %7, align 8
  %11 = load i64, ptr %6, align 8
  %12 = load ptr, ptr %5, align 8
  %13 = call i32 (ptr, ...) @printf(ptr noundef @.str, i64 noundef %9, i64 noundef %10, i64 noundef %11, ptr noundef %12)
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
  %7 = call i32 @feof(ptr noundef %6) #6
  %8 = icmp ne i32 %7, 0
  br i1 %8, label %9, label %10

9:                                                ; preds = %1
  store i32 0, ptr %2, align 4
  br label %58

10:                                               ; preds = %1
  br label %11

11:                                               ; preds = %31, %10
  %12 = load ptr, ptr %3, align 8
  %13 = call i32 @getc(ptr noundef %12)
  store i32 %13, ptr %4, align 4
  %14 = icmp ne i32 %13, -1
  br i1 %14, label %15, label %32

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
  br label %32

23:                                               ; preds = %15
  %24 = load i64, ptr @ccount, align 8
  %25 = add i64 %24, 1
  store i64 %25, ptr @ccount, align 8
  %26 = load i32, ptr %4, align 4
  %27 = icmp eq i32 %26, 10
  br i1 %27, label %28, label %31

28:                                               ; preds = %23
  %29 = load i64, ptr @lcount, align 8
  %30 = add i64 %29, 1
  store i64 %30, ptr @lcount, align 8
  br label %31

31:                                               ; preds = %28, %23
  br label %11, !llvm.loop !6

32:                                               ; preds = %20, %11
  br label %33

33:                                               ; preds = %51, %32
  %34 = load i32, ptr %4, align 4
  %35 = icmp ne i32 %34, -1
  br i1 %35, label %36, label %54

36:                                               ; preds = %33
  %37 = load i64, ptr @ccount, align 8
  %38 = add i64 %37, 1
  store i64 %38, ptr @ccount, align 8
  %39 = load i32, ptr %4, align 4
  %40 = icmp eq i32 %39, 10
  br i1 %40, label %41, label %44

41:                                               ; preds = %36
  %42 = load i64, ptr @lcount, align 8
  %43 = add i64 %42, 1
  store i64 %43, ptr @lcount, align 8
  br label %44

44:                                               ; preds = %41, %36
  %45 = load i32, ptr %4, align 4
  %46 = trunc i32 %45 to i8
  %47 = call i32 @isword(i8 noundef zeroext %46)
  %48 = icmp ne i32 %47, 0
  br i1 %48, label %50, label %49

49:                                               ; preds = %44
  br label %54

50:                                               ; preds = %44
  br label %51

51:                                               ; preds = %50
  %52 = load ptr, ptr %3, align 8
  %53 = call i32 @getc(ptr noundef %52)
  store i32 %53, ptr %4, align 4
  br label %33, !llvm.loop !8

54:                                               ; preds = %49, %33
  %55 = load i32, ptr %4, align 4
  %56 = icmp ne i32 %55, -1
  %57 = zext i1 %56 to i32
  store i32 %57, ptr %2, align 4
  br label %58

58:                                               ; preds = %54, %9
  %59 = load i32, ptr %2, align 4
  ret i32 %59
}

; Function Attrs: nounwind
declare i32 @feof(ptr noundef) #2

declare i32 @getc(ptr noundef) #1

; Function Attrs: noinline nounwind optnone uwtable
define internal i32 @isword(i8 noundef zeroext %0) #0 {
  %2 = alloca i8, align 1
  store i8 %0, ptr %2, align 1
  %3 = call ptr @__ctype_b_loc() #7
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
define dso_local void @counter(ptr noundef %0) #0 {
  %2 = alloca ptr, align 8
  %3 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8
  %4 = load ptr, ptr %2, align 8
  %5 = call ptr @fopen(ptr noundef %4, ptr noundef @.str.1)
  store ptr %5, ptr %3, align 8
  %6 = load ptr, ptr %3, align 8
  %7 = icmp ne ptr %6, null
  br i1 %7, label %10, label %8

8:                                                ; preds = %1
  %9 = load ptr, ptr %2, align 8
  call void (ptr, ...) @perrf(ptr noundef @.str.2, ptr noundef %9)
  br label %10

10:                                               ; preds = %8, %1
  store i64 0, ptr @lcount, align 8
  store i64 0, ptr @wcount, align 8
  store i64 0, ptr @ccount, align 8
  br label %11

11:                                               ; preds = %15, %10
  %12 = load ptr, ptr %3, align 8
  %13 = call i32 @getword(ptr noundef %12)
  %14 = icmp ne i32 %13, 0
  br i1 %14, label %15, label %16

15:                                               ; preds = %11
  br label %11, !llvm.loop !9

16:                                               ; preds = %11
  %17 = load ptr, ptr %3, align 8
  %18 = call i32 @fclose(ptr noundef %17)
  %19 = load ptr, ptr %2, align 8
  %20 = load i64, ptr @ccount, align 8
  %21 = load i64, ptr @wcount, align 8
  %22 = load i64, ptr @lcount, align 8
  call void @report(ptr noundef %19, i64 noundef %20, i64 noundef %21, i64 noundef %22)

  %23 = load i64, ptr @ccount, align 8
  %24 = load i64, ptr @total_ccount, align 8
  %25 = add i64 %24, %23
  store i64 %25, ptr @total_ccount, align 8

  %26 = load i64, ptr @wcount, align 8
  %27 = load i64, ptr @total_wcount, align 8
  %28 = add i64 %27, %26
  store i64 %28, ptr @total_wcount, align 8

  %29 = load i64, ptr @lcount, align 8
  %30 = load i64, ptr @total_lcount, align 8
  %31 = add i64 %30, %29
  store i64 %31, ptr @total_lcount, align 8
  
  ret void
}

declare ptr @fopen(ptr noundef, ptr noundef) #1

; Function Attrs: noinline nounwind optnone uwtable
define internal void @perrf(ptr noundef %0, ...) #0 {
  %2 = alloca ptr, align 8
  %3 = alloca [1 x %struct.__va_list_tag], align 16
  store ptr %0, ptr %2, align 8
  %4 = getelementptr inbounds [1 x %struct.__va_list_tag], ptr %3, i64 0, i64 0
  call void @llvm.va_start(ptr %4)
  %5 = load ptr, ptr %2, align 8
  %6 = getelementptr inbounds [1 x %struct.__va_list_tag], ptr %3, i64 0, i64 0
  call void @error_print(i32 noundef 1, ptr noundef %5, ptr noundef %6)
  %7 = getelementptr inbounds [1 x %struct.__va_list_tag], ptr %3, i64 0, i64 0
  call void @llvm.va_end(ptr %7)
  ret void
}

declare i32 @fclose(ptr noundef) #1

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
  br i1 %8, label %9, label %10

9:                                                ; preds = %2
  call void (ptr, ...) @errf(ptr noundef @.str.3)
  br label %10

10:                                               ; preds = %9, %2
  store i32 1, ptr %6, align 4
  br label %11

11:                                               ; preds = %21, %10
  %12 = load i32, ptr %6, align 4
  %13 = load i32, ptr %4, align 4
  %14 = icmp slt i32 %12, %13
  br i1 %14, label %15, label %24

15:                                               ; preds = %11
  %16 = load ptr, ptr %5, align 8
  %17 = load i32, ptr %6, align 4
  %18 = sext i32 %17 to i64
  %19 = getelementptr inbounds ptr, ptr %16, i64 %18
  %20 = load ptr, ptr %19, align 8
  call void @counter(ptr noundef %20)
  br label %21

21:                                               ; preds = %15
  %22 = load i32, ptr %6, align 4
  %23 = add nsw i32 %22, 1
  store i32 %23, ptr %6, align 4
  br label %11, !llvm.loop !10

24:                                               ; preds = %11
  %25 = load i32, ptr %4, align 4
  %26 = icmp sgt i32 %25, 2
  br i1 %26, label %27, label %31

27:                                               ; preds = %24
  %28 = load i64, ptr @total_ccount, align 8
  %29 = load i64, ptr @total_wcount, align 8
  %30 = load i64, ptr @total_lcount, align 8
  call void @report(ptr noundef @.str.4, i64 noundef %28, i64 noundef %29, i64 noundef %30)
  br label %31

31:                                               ; preds = %27, %24
  ret i32 0
}

; Function Attrs: noinline nounwind optnone uwtable
define internal void @errf(ptr noundef %0, ...) #0 {
  %2 = alloca ptr, align 8
  %3 = alloca [1 x %struct.__va_list_tag], align 16
  store ptr %0, ptr %2, align 8
  %4 = getelementptr inbounds [1 x %struct.__va_list_tag], ptr %3, i64 0, i64 0
  call void @llvm.va_start(ptr %4)
  %5 = load ptr, ptr %2, align 8
  %6 = getelementptr inbounds [1 x %struct.__va_list_tag], ptr %3, i64 0, i64 0
  call void @error_print(i32 noundef 0, ptr noundef %5, ptr noundef %6)
  %7 = getelementptr inbounds [1 x %struct.__va_list_tag], ptr %3, i64 0, i64 0
  call void @llvm.va_end(ptr %7)
  ret void
}

; Function Attrs: nounwind willreturn memory(none)
declare ptr @__ctype_b_loc() #3

; Function Attrs: nocallback nofree nosync nounwind willreturn
declare void @llvm.va_start(ptr) #4

; Function Attrs: noinline nounwind optnone uwtable
define internal void @error_print(i32 noundef %0, ptr noundef %1, ptr noundef %2) #0 {
  %4 = alloca i32, align 4
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  store i32 %0, ptr %4, align 4
  store ptr %1, ptr %5, align 8
  store ptr %2, ptr %6, align 8
  %7 = load ptr, ptr @stderr, align 8
  %8 = load ptr, ptr %5, align 8
  %9 = load ptr, ptr %6, align 8
  %10 = call i32 @vfprintf(ptr noundef %7, ptr noundef %8, ptr noundef %9)
  %11 = load i32, ptr %4, align 4
  %12 = icmp ne i32 %11, 0
  br i1 %12, label %13, label %14

13:                                               ; preds = %3
  call void @perror(ptr noundef @.str.5)
  br label %17

14:                                               ; preds = %3
  %15 = load ptr, ptr @stderr, align 8
  %16 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %15, ptr noundef @.str.6)
  br label %17

17:                                               ; preds = %14, %13
  call void @exit(i32 noundef 1) #8
  unreachable
}

; Function Attrs: nocallback nofree nosync nounwind willreturn
declare void @llvm.va_end(ptr) #4

declare i32 @vfprintf(ptr noundef, ptr noundef, ptr noundef) #1

declare void @perror(ptr noundef) #1

declare i32 @fprintf(ptr noundef, ptr noundef, ...) #1

; Function Attrs: noreturn nounwind
declare void @exit(i32 noundef) #5

attributes #0 = { noinline nounwind optnone uwtable "frame-pointer"="all" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #2 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #3 = { nounwind willreturn memory(none) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nocallback nofree nosync nounwind willreturn }
attributes #5 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cmov,+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nounwind }
attributes #7 = { nounwind willreturn memory(none) }
attributes #8 = { noreturn nounwind }

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
!10 = distinct !{!10, !7}
