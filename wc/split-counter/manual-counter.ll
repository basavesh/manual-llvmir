; copying the target datalayout and target triple from the original file
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@ro0x2004 = private unnamed_addr constant [2 x i8] c"r\00", align 1
@ro0x2006 = private unnamed_addr constant [23 x i8] c"cannot open file `%s'\0A\00", align 1
@wcount = external global i64, align 8          ; had to rename as it is extern global variable and it should match
@total_wcount = external global i64, align 8    ; same as above comment

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

; Currently, I'm assuming that I know the function signature
define dso_local void @counter(ptr %0) {
; -----------------
; Function: counter
; -----------------
; Entry 1190; block 0; address 1190
; counter:
;   PUSH RBP
;   MOV RBP, RSP

; making some space for the stack
;   SUB RSP, 0x10           ; Not sure why it chose to allocate 16 bytes
                            ; is it an big array thing? We don't really know how the 
                            ; variable are allocated and packed
                            ; at this moment, I just know that local stack size is 16 bytes

%2 = alloca ptr, align 8   ; I don't really know the type at this moment
%3 = alloca ptr, align 8

;   MOV qword [RBP - 0x8], RDI
store ptr %0, ptr %2, align 8 ; In this case I know that %2 is a ptr type
                              ; or something like that
;   MOV RDI, qword [RBP - 0x8]
%4 = load ptr, ptr %2, align 8

;   LEA RSI, [RELA_.rodata_0x2000(0x4)]    ; 0x2004 --> L_.rodata_0x2000 + 0x4
;   So there is some data in the read-only section
;   knowing the functions signature of the fopen, 
;   we can know that there are like 2 arguments to the fopen function.
;   CALL fopen wrt ..plt
%5 = call ptr @fopen(ptr %4, ptr @ro0x2004)


; ; Entry 1190; block 1; address 11ac
; L1190_1:
;   MOV qword [RBP - 0x10], RAX
store ptr %5, ptr %3, align 8

;   CMP qword [RBP - 0x10], 0x0         ; in terms of registers, load and compare regs
;   JNE L1190_3    ; 0x11d2 --> L1190_3
%6 = load ptr, ptr %3, align 8          ; for cmp and jmp, I will need to have two instructions 
                                        ; in context to make a decision on what kind of test I should perform.
%7 = icmp ne ptr %6, null               ; The "ne" comes from the JNE asm instruction
br i1 %7, label %11, label %8


; ; Entry 1190; block 2; address 11bb
; L1190_2:
8:

;   MOV RSI, qword [RBP - 0x8]
%9 = load ptr, ptr %2, align 8

;   LEA RDI, [RELA_.rodata_0x2000(0x6)]    ; 0x2006 --> L_.rodata_0x2000 + 0x6
;   Let's assume that there is a string or string format at @0x2006
;   MOV AL, 0x0       ; I'm not sure why there are moving al to 0. 
                      ; won't printf return a value and overwrite it?
;   CALL printf wrt ..plt ; we know the signature for printf function
%10 = call i32 (ptr, ...) @printf(ptr @ro0x2006, ptr %9)

; ; Entry 1190; block 4; address 11cd
; L1190_4:
;   JMP L1190_11    ; 0x1231 --> L1190_11
br label %25

; ; Entry 1190; block 3; address 11d2
; L1190_3:
11:
;   LEA RAX, [RELA_.bss_0x4058(0x10)]    ; 0x4068 --> L_.bss_0x4058 + 0x10
;   There is som global data at 0x4068
;   MOV qword [RAX], 0x0
store i64 0, ptr @wcount
br label %12


; ; Entry 1190; block 8; address 11e0
; L1190_8:
12:
;   MOV RDI, qword [RBP - 0x10]
  %13 = load ptr, ptr %3, align 8
;   CALL getword    ; 0x1270 --> getword
;   Assuming that we know the signature of the getword function
  %14 = call i32 @getword(ptr %13)


; ; Entry 1190; block 5; address 11e9
; L1190_5:
; The label is created because of previous call instruction
;   CMP EAX, 0x0
;   JE L1190_7    ; 0x11f7 --> L1190_7  
  %15 = icmp ne i32 %14, 0      ; i32 because it is comparing with eax
                                ; LLVM is using ne, though I should technically use the equal to comparison
  br i1 %15, label %16, label %17

; ; Entry 1190; block 6; address 11f2
; L1190_6:
16:
;   JMP L1190_8    ; 0x11e0 --> L1190_8
  br label %12

; ; Entry 1190; block 7; address 11f7
; L1190_7:
17:
;   MOV RDI, qword [RBP - 0x10]
  %18 = load ptr, ptr %3, align 8
;   CALL fclose wrt ..plt
  %19 = call i32 @fclose(ptr %18)

; ; Entry 1190; block 9; address 1200
; L1190_9:
; This label is create as it is afte call instruction
;   MOV RDI, qword [RBP - 0x8]  ; 1st argument
%20 = load ptr, ptr %2, align 8
;   LEA RAX, [RELA_.bss_0x4058(0x10)]    ; 0x4068 --> L_.bss_0x4058 + 0x10 ;
;   MOV RSI, qword [RAX] ; 2nd argument
%21 = load i64, ptr @wcount
;   CALL report    ; 0x1240 --> report
call void @report(ptr %20, i64 %21)

; ; Entry 1190; block 10; address 1213
; L1190_10:
;   LEA RAX, [RELA_.bss_0x4058(0x10)]    ; 0x4068 --> L_.bss_0x4058 + 0x10
;   MOV RCX, qword [RAX]
;   With the reference, I have been able to merge these two, 
;   but I feel these two merges can be easily automated
  %22 = load i64, ptr @wcount, align 8


;   LEA RAX, [RELA_.bss_0x4058(0x8)]    ; 0x4060 --> L_.bss_0x4058 + 0x8
  %23 = load i64, ptr @total_wcount, align 8
;   ADD RCX, qword [RAX]
  %24 = add i64 %23, %22

;   LEA RAX, [RELA_.bss_0x4058(0x8)]    ; 0x4060 --> L_.bss_0x4058 + 0x8
  store i64 %24, ptr @total_wcount
;   MOV qword [RAX], RCX
  br label %25

; ; Entry 1190; block 11; address 1231
; L1190_11:
25:
;   ADD RSP, 0x10
;   POP RBP
;   RET
  ret void
}


declare ptr @fopen(ptr, ptr)

declare i32 @printf(ptr, ...)

declare i32 @getword(ptr)

declare i32 @fclose(ptr)

declare void @report(ptr, i64)