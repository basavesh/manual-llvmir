target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@total_wcount = dso_local global i64 0, align 8
@rox201d = private unnamed_addr constant [9 x i8] c"%6lu %s\0A\00", align 1
@wcount = dso_local global i64 0, align 8
@ro0x2026 = private unnamed_addr constant [25 x i8] c"usage: wc FILE [FILE...]\00", align 1
@rox203f = private unnamed_addr constant [6 x i8] c"total\00", align 1


; the below assumptions doesn't hold if the frame pointer is omitted.
; assumptions about the stack layout and the variables
; <stack arguments>    | ($rbp + 8) + ?
; <return address>     | $rbp + 8
; <saved base pointer> | $rbp points here
; <local variables>    | ($rbp - 8) - ?

; The number of basic blocks created by the LLVM compiler and the 
; FoxDec are different, as it creates a new basic block after a call
; for relocation / symbolization
; Let me go through it again and see if I can fix.


; some globals from the wc.nasm, like external functions called and setting the
; default addressing mode as RIP relative.

; extern _ITM_deregisterTMCloneTable    ; not planning to lift this
; extern _ITM_registerTMCloneTable      ; not planning to lift this
; extern __ctype_b_loc                  ; not planning to lift this
; extern __cxa_finalize                 ; not planning to lift this
; extern __gmon_start__                 ; not planning to lift this
; extern __libc_start_main              ; not planning to lift this
; extern exit                           ; get standard signature, assuming libc function
; extern fclose                         ; get standard signature, assuming libc function
; extern feof                           ; get standard signature, assuming libc function
; extern fopen                          ; get standard signature, assuming libc function
; extern getc                           ; get standard signature, assuming libc function
; extern printf                         ; get standard signature, assuming libc function


; global _start                         ; should I lift this? at LLVM-IR level, I don't really need this.


; default rel



; below is some kind of macro-ish stuff, ignoring for now. Let's circle back if I really need.
; %define RELA_.rodata_0x2000(offset) (L_.rodata_0x2000 + offset)
; %define RELA_.init_array_0x3de8(offset) (L_.init_array_0x3de8 + offset)
; %define RELA_.fini_array_0x3df0(offset) (L_.fini_array_0x3df0 + offset)
; %define RELA_.data_0x4048(offset) (L_.data_0x4048 + offset)
; %define RELA_.bss_0x4058(offset) (L_.bss_0x4058 + offset)

; %define __GNU_EH_FRAME_HDR RELA_.rodata_0x2000(0x48)
; %define _end RELA_.bss_0x4058(0x18)


; ; ----------------
; ; Function: report
; ; ----------------
; ; Entry 1240; block 0; address 1240
; report:
; assuming I know the function signature, also, based on the calling convention
define dso_local void @report(ptr %0, i64 %1) {     ; dilemma of i64/ptr
;   PUSH RBP
;   MOV RBP, RSP
;   SUB RSP, 0x10                   ; 16 bytes, can only know how how these are later
;   [RBP - 0x8]
    %3 = alloca ptr, align 8

;   [RBP - 0x10]
    %4 = alloca i64, align 8

;   MOV qword [RBP - 0x8], RDI      ; so word and 8 bytes access
    store ptr %0, ptr %3, align 8    

;   MOV qword [RBP - 0x10], RSI     ; another 8 bytes access
    store i64 %1, ptr %4, align 8

;   MOV RSI, qword [RBP - 0x10]
    %5 = load i64, ptr %4, align 8  ; It is only possible if I know the signature, 
                                    ; otherwise I won't know if it is i64 or ptr

;   MOV RDX, qword [RBP - 0x8]
    %6 = load ptr, ptr %3, align 8

;   LEA RDI, [RELA_.rodata_0x2000(0x1d)]    ; 0x201d --> L_.rodata_0x2000 + 0x1d
;   MOV AL, 0x0
;   CALL printf wrt ..plt
    %7 = call i32 (ptr, ...) @printf(ptr @rox201d, i64 %5, ptr %6)

; ; Entry 1240; block 1; address 1266
; L1240_1:
;   ADD RSP, 0x10
;   POP RBP
;   RET
    ret void
}

declare i32 @printf(ptr, ...)



; Again, assuming I know the function signature
; ; -----------------
; ; Function: getword
; ; -----------------
; ; Entry 1270; block 0; address 1270
; getword:
define dso_local i32 @getword(ptr %0) {
;   PUSH RBP
;   MOV RBP, RSP
;   SUB RSP, 0x20       ; at this point, no idea how this 32 bytes are divided

;   [RBP - 0x4]  size might be 4 bytes
    %2 = alloca i32, align 4

;   [RBP - 0x10] size might be 8 bytes
    %3 = alloca ptr, align 8            ; at this very moment, not sure if it is i64 or ptr

;   [RBP - 0x14] size might be 4 bytes
    %4 = alloca i32, align 4

;   [RBP - 0x18] size might be 4 bytes
    %5 = alloca i32, align 4
    
;   MOV qword [RBP - 0x10], RDI
    store ptr %0, ptr %3, align 8       ; now i know that %3 is a ptr due to the constraint

;   MOV dword [RBP - 0x18], 0x0
    store i32 0, ptr %5, align 4

;   MOV RDI, qword [RBP - 0x10]
    %6 = load ptr, ptr %3, align 8

;   CALL feof wrt ..plt
    %7 = call i32 @feof(ptr %6)


; ; Entry 1270; block 1; address 128c
; L1270_1:
;   CMP EAX, 0x0
;   JE L1270_3    ; 0x12a1 --> L1270_3
    %8 = icmp ne i32 %7, 0                  ; in LLVM-IR for some reason I always see comparision with ne
    br i1 %8, label %9, label %10

; ; Entry 1270; block 2; address 1295
; L1270_2:
9:
;   MOV dword [RBP - 0x4], 0x0
    store i32 0, ptr %2, align 4

;   JMP L1270_18    ; 0x1338 --> L1270_18
    br label %42                            ; not sure where exactly I'm jumping
                                            ; need to see if I can have SSA labels with non-numeric values


; ; Entry 1270; block 3; address 12a1
; L1270_3:
10:
;   JMP L1270_10    ; 0x12a6 --> L1270_10
    br label %11

; ; Entry 1270; block 10; address 12a6
; L1270_10:
11:
;   MOV RDI, qword [RBP - 0x10]
    %12 = load ptr, ptr %3, align 8
;   CALL getc wrt ..plt
    %13 = call i32 @getc(ptr %12)

; ; Entry 1270; block 4; address 12af
; L1270_4:
;   MOV dword [RBP - 0x14], EAX
    store i32 %13, ptr %4, align 4

;   CMP EAX, 0xffffffff                         ; ok this is confusing, I don't know if I should convert it to -1 or keep it as it is
;   JE L1270_6    ; 0x12eb --> L1270_6
    %14 = icmp ne i32 %13, -1
    br i1 %14, label %15, label %24

; ; Entry 1270; block 5; address 12bb
; L1270_5:
15:
;   MOV EAX, dword [RBP - 0x14]
    %16 = load i32, ptr %4, align 4

;   MOVZX EDI, AL
    %17 = trunc i32 %16 to i8                   ; this is little weird.. need to come back to it later

;   CALL isword    ; 0x1350 --> isword
    %18 = call i32 @isword (i8 zeroext %17)     ; I may not be able to replicate it as it is 

; ; Entry 1270; block 7; address 12c6
; L1270_7:
;   CMP EAX, 0x0
;   JE L1270_9    ; 0x12e6 --> L1270_9
    %19 = icmp ne i32 %18, 0
    br i1 %19, label %20, label %23

; ; Entry 1270; block 8; address 12cf
; L1270_8:
20:
;   MOV RAX, qword [RELA_.bss_0x4058(0x10)]    ; 0x4068 --> L_.bss_0x4058 + 0x10
    %21 = load i64, ptr @wcount

;   ADD RAX, 0x1
    %22 = add i64 %21, 1

;   MOV qword [RELA_.bss_0x4058(0x10)], RAX    ; 0x4068 --> L_.bss_0x4058 + 0x10
    store i64 %22, ptr @wcount, align 8

;   JMP L1270_6    ; 0x12eb --> L1270_6
    br label %24

; ; Entry 1270; block 9; address 12e6
; L1270_9:
23:
;   JMP L1270_10    ; 0x12a6 --> L1270_10
    br label %11

; ; Entry 1270; block 6; address 12eb
; L1270_6:
24:
;   JMP L1270_17    ; 0x12f0 --> L1270_17
    br label %25

; ; Entry 1270; block 17; address 12f0
; L1270_17:
25:
;   CMP dword [RBP - 0x14], 0xffffffff
;   JE L1270_12    ; 0x1329 --> L1270_12
    %26 = load i32, ptr %4, align 4
    %27 = icmp ne i32 %26, -1
    br i1 %27, label %28, label %38

; ; Entry 1270; block 11; address 12fa
; L1270_11:
28:
;   MOV EAX, dword [RBP - 0x14]
    %29 = load i32, ptr %4, align 4

;   MOVZX EDI, AL
    %30 = trunc i32 %29 to i8

;   CALL isword    ; 0x1350 --> isword
    %31 = call i32 @isword(i8 zeroext %30)


; ; Entry 1270; block 13; address 1305
; L1270_13:
;   CMP EAX, 0x0
;   JNE L1270_15    ; 0x1313 --> L1270_15
    %32 = icmp ne i32 %31, 0
    br i1 %32, label %34, label %33


; ; Entry 1270; block 14; address 130e
; L1270_14:
33:
;   JMP L1270_12    ; 0x1329 --> L1270_12
    br label %38

34:
    br label %35

; ; Entry 1270; block 15; address 1313
; L1270_15:
35:
;   MOV RDI, qword [RBP - 0x10]
    %36 = load ptr, ptr %3, align 8
;   CALL getc wrt ..plt
    %37 = call i32 @getc(ptr %36)

; ; Entry 1270; block 16; address 1321
; L1270_16:
;   MOV dword [RBP - 0x14], EAX
    store i32 %37, ptr %4, align 4

;   JMP L1270_17    ; 0x12f0 --> L1270_17
    br label %25

; ; Entry 1270; block 12; address 1329
; L1270_12:
38:
;   CMP dword [RBP - 0x14], 0xffffffff
;   SETNE AL
    %39 = load i32, ptr %4, align 4
    %40 = icmp ne i32 %39, -1


;   AND AL, 0x1
;   MOVZX EAX, AL
    %41 = zext i1 %40 to i32            ; kind of difficult to get this LLVM-IR

;   MOV dword [RBP - 0x4], EAX
    store i32 %41, ptr %2, align 4
    br label %42

; ; Entry 1270; block 18; address 1338
; L1270_18:
42:
;   MOV EAX, dword [RBP - 0x4]
    %43 = load i32, ptr %2, align 4

;   ADD RSP, 0x20
;   POP RBP
;   RET
    ret i32 %43
}

; ; ----------------
; ; Function: isword
; ; ----------------
; ; Entry 1350; block 0; address 1350
; isword:
; static int isword (unsigned char c)       ; If I know this signature, I can recover a lot, Else, I may not be
define i32 @isword(i8 %0) {
;   PUSH RBP
;   MOV RBP, RSP
;   SUB RSP, 0x10           ; not sure why it is allocating 16 bytes on the stack

;   [RBP - 0x1] and byte access, so let's allocate 1 byte for this,
    ; however I don't see any other local variables and 
    ; not sure why stack space is 16 bytes at this moment
    %2 = alloca i8, align 1

;   MOV AL, DIL             ; move  a byte 
;   MOV byte [RBP - 0x1], AL
;   combining the above two instruction
    store i8 %0, ptr %2, align 1

;   CALL __ctype_b_loc wrt ..plt
    %3 = call ptr @__ctype_b_loc()

; ; Entry 1350; block 1; address 1363
; L1350_1:
;   MOV RAX, qword [RAX]
    %4 = load ptr, ptr %3, align 8  ; no idea what this type of rax would be.
                                    ; it is either i64 or ptr

;   MOVZX ECX, byte [RBP - 0x1]
    %5 = load i8, ptr %2, align 1
    %6 = zext i8 %5 to i32

;   MOVSXD RCX, ECX
    %7 = sext i32 %6 to i64

;   MOVZX EAX, word [RAX + RCX * 2]         ; need to understand more on this addressing mode and how to recover it to LLVM-IR level
;   how is this RCX * 2 is being handled at this moment?
;   the above needs to be split enough to easily translated into 
    %8 = getelementptr inbounds i16, ptr %4, i64 %7 
    %9 = load i16, ptr %8, align 2
    %10 = zext i16 %9 to i32


;   AND EAX, 0x400
    %11 = and i32 %10, 1024


;   ADD RSP, 0x10
;   POP RBP
;   RET
    ret i32 %11
}



define dso_local i32 @main(i32 %0, ptr %1) {
; ; --------------
; ; Function: main
; ; --------------
; ; Entry 1380; block 0; address 1380
; main:
;   PUSH RBP
;   MOV RBP, RSP
;   SUB RSP, 0x20                       ; 32 bytes

;   [RBP - 0x4]
    %3 = alloca i32, align 4

;   [RBP - 0x8]
    %4 = alloca i32, align 4

;   [RBP - 0x10]
    %5 = alloca ptr, align 8            ; i64 or ptr??

;   [RBP - 0x14]
    %6 = alloca i32, align 4

;   The initial idea is to just create spaces for all the stack variables,
;   merge them later if they turn out to be arrays/structs

;   MOV dword [RBP - 0x4], 0x0
    store i32 0, ptr %3, align 4

;   MOV dword [RBP - 0x8], EDI
    store ptr %1, ptr %4, align 4

;   MOV qword [RBP - 0x10], RSI
    store ptr %1, ptr %5, align 8

;   CMP dword [RBP - 0x8], 0x2
;   JGE L1380_2    ; 0x13ba --> L1380_2
    %7 = load i32, ptr %4, align 4
    %8 = icmp slt i32 %7, 2
    br  i1 %8, label %9, label %11

; ; Entry 1380; block 1; address 13a0
; L1380_1:
9:
;   LEA RDI, [RELA_.rodata_0x2000(0x26)]    ; 0x2026 --> L_.rodata_0x2000 + 0x26
;   MOV AL, 0x0
;   CALL printf wrt ..plt
    %10 = call i32 (ptr, ...) @printf(ptr @ro0x2026)

; ; Entry 1380; block 3; address 13ae
; L1380_3:
;   MOV dword [RBP - 0x4], 0xffffffff
    store i32 -1, ptr %3, align 4

;   JMP L1380_10    ; 0x1410 --> L1380_10
    br label %31

; ; Entry 1380; block 2; address 13ba
; L1380_2:
11:
;   MOV dword [RBP - 0x14], 0x1
    store i32 1, ptr %6, align 4
    br label %12

; ; Entry 1380; block 7; address 13c1
; L1380_7:
12:
;   MOV EAX, dword [RBP - 0x14]
    %13 = load i32, ptr %6, align 4

;   CMP EAX, dword [RBP - 0x8]
;   JGE L1380_5    ; 0x13ec --> L1380_5
    %14 = load i32, ptr %4, align 4
    %15 = icmp slt i32 %13, %14
    br i1 %15, label %16, label %25

; ; Entry 1380; block 4; address 13cd
; L1380_4:
16:
;   MOV RAX, qword [RBP - 0x10]
    %17 = load ptr, ptr %5, align 8

;   MOVSXD RCX, dword [RBP - 0x14]
    %18 = load i32, ptr %6, align 4
    %19 = sext i32 %18 to i64

;   MOV RDI, qword [RAX + RCX * 8]
;   CALL counter    ; 0x1190 --> counter
    %20 = getelementptr inbounds ptr, ptr %17, i64 %19
    %21 = load ptr, ptr %20, align 8
    call void @counter(ptr %21)
    br label %22

; ; Entry 1380; block 6; address 13de
; L1380_6:
22:
;   MOV EAX, dword [RBP - 0x14]
    %23 = load i32, ptr %6, align 4

;   ADD EAX, 0x1
    %24 = add i32 %23, 1

;   MOV dword [RBP - 0x14], EAX
    store i32 %24, ptr %6, align 4

;   JMP L1380_7    ; 0x13c1 --> L1380_7
    br label %12

; ; Entry 1380; block 5; address 13ec
; L1380_5:
25:
;   CMP dword [RBP - 0x8], 0x2
;   JLE L1380_9    ; 0x1409 --> L1380_9
    %26 = load i32, ptr %4, align 4
    %27 = icmp sgt i32 %26, 2
    br i1 %27, label %28, label %30 

; ; Entry 1380; block 8; address 13f6
; L1380_8:
28:
;   MOV RSI, qword [RELA_.bss_0x4058(0x8)]    ; 0x4060 --> L_.bss_0x4058 + 0x8
    %29 = load i64, ptr @total_wcount, align 8

;   LEA RDI, [RELA_.rodata_0x2000(0x3f)]    ; 0x203f --> L_.rodata_0x2000 + 0x3f
;   CALL report    ; 0x1240 --> report
    call void @report(ptr @rox203f, i64 %29)
    br label %30

; ; Entry 1380; block 9; address 1409
; L1380_9:
30:
;   MOV dword [RBP - 0x4], 0x0
    store i32 0, ptr %3, align 4
    br label %31

; ; Entry 1380; block 10; address 1410
; L1380_10:
31:
;   MOV EAX, dword [RBP - 0x4]
    %32 = load i32, ptr %3, align 4

;   ADD RSP, 0x20
;   POP RBP
;   RET
    ret i32 %32
}

declare void @counter(ptr)

declare ptr @__ctype_b_loc()

declare i32 @feof(ptr)

declare i32 @getc(ptr)