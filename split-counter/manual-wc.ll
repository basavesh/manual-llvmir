target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"



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
    %14 = icmp new i32 %13, -1
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
    %21 = load i64, ptr @bss0x4068

;   ADD RAX, 0x1
    %22 = add i64 %21, 1

;   MOV qword [RELA_.bss_0x4058(0x10)], RAX    ; 0x4068 --> L_.bss_0x4058 + 0x10
    store i64 %22, ptr @bss0x4068, align 8

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
    37 = call i32 @getc(ptr %36)

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