; Assuming that if rax/eax/ax is not set before the return,
; it is probably a void function
; copying the target datalayout and triple from the wc.ll compiler generated file
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"


; Assumptions
; RBP - 0x18 is stack location of 8 bytes
; RBP - 0x8 is a stack variable
; need to figure out about the stack allocation part

declare ptr @fopen(ptr noundef, ptr noundef)

define dso_local void @L15fa_counter(ptr %0) {

    ; PUSH RBP
    ; MOV RBP, RSP
    ; SUB RSP, 0x20
    ; setting up the stack frame

    ; MOV qword [RBP - 0x18], RDI
    ; assuming that the $rdi is the first argument
    ; let's create a stack variable of 8 bytes, at this moment
    ; I don't know if it is i64 or ptr
    %2 = alloca ptr, align 8 ; %2 = RBP - 0x18
    store ptr %0, ptr %2, align 8

    ; MOV RAX, qword [RBP - 0x18]
    ; %3 = load i64, i64 %2, align 8 ; update the types like back propagating
    %3 = load ptr, ptr 

    ; LEA RSI, [RELA_.rodata_0x2000(0x19)] --> 2nd argument
    ; MOV RDI, RAX --> 1st argument
    ; CALL fopen wrt ..plt
    ; at this moment, based on the syscall/ libc function signature,
    ; I know that there are two arguments to the fopen which are both const pointers
    ; though I don't know what is @ro1
    %4 = call @fopen(ptr %3, ptr @ro1)

    ; not sure If I should create a label here 
    ; it is not really used from the LLVM IR perspective

    ; MOV qword [RBP - 0x8], RAX
    ; For now I'm going to allocate stuff,
    ; but we can decide later
    %5 = alloca ptr, align 8 ; at some places I won't know if it is a pointer or just i64
    store ptr %4, ptr %5, align 8

    ; CMP qword [RBP - 0x8], 0x0
    ; JNE L15a_3
    %6 = load ptr, ptr %5, align 8
    %7 = icmp ne ptr %6, null
    br i1 %7, label %10, label %8 

8:  ; equivalent to L15fa_2 of original NASM
    ; MOV RAX, qword [RBP - 0x18]
    ; MOV RSI, RAX
    ; LEA RDI, [RELA_.rodata_0x2000(0x1b)]    ; 0x201b --> L_.rodata_0x2000 + 0x1b
    ; MOV EAX, 0x0
    ; NOP
    ;FOXDEC_TERMINATING_L15fa_2:
    ; CALL L13bd_perrf    ; 0x13bd --> L13bd_perrf
    ; all the above is just to error out, due to fopen return being null
    %9 = load ptr, ptr %2, align 8
    call void @perrf (ptr @ro2, ptr %9)
    br label %10 

10: ; equivalent to L15fa_3
    ; MOV qword [RELA_.bss_0x4020(0x38)], 0x0    ; 0x4058 --> L_.bss_0x4020 + 0x38
    ; MOV RAX, qword [RELA_.bss_0x4020(0x38)]    ; 0x4058 --> L_.bss_0x4020 + 0x38
    ; MOV qword [RELA_.bss_0x4020(0x28)], RAX    ; 0x4048 --> L_.bss_0x4020 + 0x28
    ; MOV RAX, qword [RELA_.bss_0x4020(0x28)]    ; 0x4048 --> L_.bss_0x4020 + 0x28
    ; MOV qword [RELA_.bss_0x4020(0x30)], RAX    ; 0x4050 --> L_.bss_0x4020 + 0x30
    ; BASH: this is very weird and unoptimized; 
    ; why didn't they just mov zer0 to all these three globals???
    ; below is optimized version after referring to ground truth. 
    ; but we can also write as it is shown in the assembly file.
    store i64 0, ptr @gdx38, align 8  ; @0x38
    store i64 0, ptr @gdx28, align 8  ; @0x28
    store i64 0, ptr @gdx30, align 8  ; @0x30
    br lable %11 

11: ; equivalent to L15fa_5;
    ; MOV RAX, qword [RBP - 0x8]
    ; MOV RDI, RAX
    ; CALL L1504_getword    ; 0x1504 --> L1504_getword
    %12 = load ptr, ptr %5, align 8
    %13 = call i32 @getword(ptr %12)

    ; ignoring the L15fa_4 as it is not really used later
    ;L15fa_4:
    ; TEST EAX, EAX
    ; JNE L15fa_5    ; 0x1668 --> L15fa_5
    %14 = icmp ne i32 %13, 0 ; mimicing test 
    br i1 %14, label %11, label %15 

15: ; equivalent to L15fa_6
    ; this is kind of deviating from the reference IR

    ; MOV RAX, qword [RBP - 0x8]
    %16 = load ptr, ptr %5, align 8

    ; MOV RDI, RAX
    ; CALL fclose wrt ..plt 
    %17 = call i32 @fclose(ptr %16)

    ;L15fa_7
    ; MOV RCX, qword [RELA_.bss_0x4020(0x38)]    ; 0x4058 --> L_.bss_0x4020 + 0x38
    ; MOV RDX, qword [RELA_.bss_0x4020(0x28)]    ; 0x4048 --> L_.bss_0x4020 + 0x28
    ; MOV RSI, qword [RELA_.bss_0x4020(0x30)]    ; 0x4050 --> L_.bss_0x4020 + 0x30
    ; MOV RAX, qword [RBP - 0x18]
    ; MOV RDI, RAX
    ; CALL L148e_report    ; 0x148e --> L148e_report
    %18 = load i64, ptr @gdx38, align 8
    %19 = load i64, ptr @gdx28, align 8
    %20 = load i64, ptr @gdx30, align 8
    %21 = load ptr, ptr %2, align 8
    call void @report(ptr %21, i64 %20, i64 %19, i64 %18)
    ; looks like char, word and lines to report

    ;L15fa_8
    ; MOV RDX, qword [RELA_.bss_0x4020(0x10)]
    %22 = load i64, ptr @gdx10, align 8
    ; MOV RAX, qword [RELA_.bss_0x4020(0x30)]    ; 0x4050 --> L_.bss_0x4020 + 0x30
    %23 = load i64, ptr @gdx30, align 8
    ; ADD RAX, RDX
    %24 = add i64 %23, %22 
    ; MOV qword [RELA_.bss_0x4020(0x10)], RAX    ; 0x4030 --> L_.bss_0x4020 + 0x10
    store i64 %24, ptr @gdx10, align 8

    ; MOV RDX, qword [RELA_.bss_0x4020(0x18)]    ; 0x4038 --> L_.bss_0x4020 + 0x18
    %25 = load i64, ptr @gdx18, align 8
    ; MOV RAX, qword [RELA_.bss_0x4020(0x28)]    ; 0x4048 --> L_.bss_0x4020 + 0x28
    %26 = load i64, ptr @gdx28, align 8
    ; ADD RAX, RDX
    %27 = add i64 %26, %25
    ; MOV qword [RELA_.bss_0x4020(0x18)], RAX    ; 0x4038 --> L_.bss_0x4020 + 0x18
    store i64 %27, ptr @gdx18, align 8

    ; MOV RDX, qword [RELA_.bss_0x4020(0x20)]    ; 0x4040 --> L_.bss_0x4020 + 0x20
    %28 = load i64, ptr @gdx20, align 8
    ; MOV RAX, qword [RELA_.bss_0x4020(0x38)]    ; 0x4058 --> L_.bss_0x4020 + 0x38
    %29 = load i64, ptr @gdx38, align 8
    ; ADD RAX, RDX
    %30 = add i64 %29, %28, 
    ; MOV qword [RELA_.bss_0x4020(0x20)], RAX    ; 0x4040 --> L_.bss_0x4020 + 0x20
    store i64 %30, ptr @gdx20, align 8
    
    ret void
}