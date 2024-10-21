extern _ITM_deregisterTMCloneTable
extern _ITM_registerTMCloneTable
extern __ctype_b_loc
extern __cxa_finalize
extern __gmon_start__
extern __libc_start_main
extern __stack_chk_fail
extern exit
extern fclose
extern feof
extern fopen
extern fputc
extern getc
extern perror
extern printf
extern stderr
extern vfprintf


global _start


default rel


%define RELA_.rodata_0x2000(offset) (L_.rodata_0x2000 + offset)
%define RELA_.init_array_0x3d68(offset) (L_.init_array_0x3d68 + offset)
%define RELA_.fini_array_0x3d70(offset) (L_.fini_array_0x3d70 + offset)
%define RELA_.data_0x4000(offset) (L_.data_0x4000 + offset)
%define RELA_.bss_0x4020(offset) (L_.bss_0x4020 + offset)

%define __GNU_EH_FRAME_HDR RELA_.rodata_0x2000(0x50)
%define __TMC_END__ RELA_.data_0x4000(0x10)
%define _end RELA_.bss_0x4020(0x40)


; ---------------------
; Function: L1000__init
; ---------------------
; Entry 1000; block 0; address 1000
L1000__init:
  SUB RSP, 0x8
  MOV qword [Ltemp_storage_foxdec], RBX ; inserted
  LEA RBX, [__gmon_start__ wrt ..plt]
  MOV RAX, RBX
  MOV RBX, qword [Ltemp_storage_foxdec] ; inserted
  TEST RAX, RAX
  JE L1000_2    ; 0x1016 --> L1000_2

; Entry 1000; block 1; address 1014
L1000_1:
  ; Resolved indirection: RAX --> __gmon_start__
  CALL __gmon_start__ wrt ..plt

; Entry 1000; block 2; address 1016
L1000_2:
  ADD RSP, 0x8
  RET




; -----------------
; Function: L10e0_0
; -----------------
; Entry 10e0; block 0; address 10e0
L10e0_0:
  BND JMP __cxa_finalize wrt ..plt




; -----------------
; Function: L10f0_0
; -----------------
; Entry 10f0; block 0; address 10f0
L10f0_0:
  BND JMP fclose wrt ..plt




; -----------------
; Function: L1110_0
; -----------------
; Entry 1110; block 0; address 1110
L1110_0:
  BND JMP printf wrt ..plt




; -----------------
; Function: L1120_0
; -----------------
; Entry 1120; block 0; address 1120
L1120_0:
  BND JMP fputc wrt ..plt




; -----------------
; Function: L1130_0
; -----------------
; Entry 1130; block 0; address 1130
L1130_0:
  BND JMP feof wrt ..plt




; -----------------
; Function: L1140_0
; -----------------
; Entry 1140; block 0; address 1140
L1140_0:
  BND JMP fopen wrt ..plt




; -----------------
; Function: L1150_0
; -----------------
; Entry 1150; block 0; address 1150
L1150_0:
  BND JMP perror wrt ..plt




; -----------------
; Function: L1160_0
; -----------------
; Entry 1160; block 0; address 1160
L1160_0:
  BND JMP vfprintf wrt ..plt




; -----------------
; Function: L1170_0
; -----------------
; Entry 1170; block 0; address 1170
L1170_0:
  NOP
FOXDEC_TERMINATING_L1170_0:
  BND JMP exit wrt ..plt




; -----------------
; Function: L1180_0
; -----------------
; Entry 1180; block 0; address 1180
L1180_0:
  BND JMP getc wrt ..plt




; -----------------
; Function: L1190_0
; -----------------
; Entry 1190; block 0; address 1190
L1190_0:
  BND JMP __ctype_b_loc wrt ..plt




; ----------------
; Function: _start
; ----------------
; Entry 11a0; block 0; address 11a0
_start:
  XOR EBP, EBP
  MOV R9, RDX
  POP RSI
  MOV RDX, RSP
  AND RSP, 0xfffffffffffffff0
  PUSH RAX
  PUSH RSP
  LEA R8, [L17f0___libc_csu_fini]    ; 0x17f0 --> L17f0___libc_csu_fini
  LEA RCX, [L1780___libc_csu_init]    ; 0x1780 --> L1780___libc_csu_init
  LEA RDI, [L16f0_main]    ; 0x16f0 --> L16f0_main
  CALL __libc_start_main wrt ..plt

; Entry 11a0; block 1; address 11ce
L11a0_1:
  HLT




; ------------------------------------
; Function: L11d0_deregister_tm_clones
; ------------------------------------
; Entry 11d0; block 0; address 11d0
L11d0_deregister_tm_clones:
  LEA RDI, [__TMC_END__]    ; 0x4010 --> __TMC_END__
  LEA RAX, [__TMC_END__]    ; 0x4010 --> __TMC_END__
  CMP RAX, RDI
  JE L11d0_2    ; 0x11f8 --> L11d0_2

; Entry 11d0; block 1; address 11e3
L11d0_1:
  MOV qword [Ltemp_storage_foxdec], RBX ; inserted
  LEA RBX, [_ITM_deregisterTMCloneTable wrt ..plt]
  MOV RAX, RBX
  MOV RBX, qword [Ltemp_storage_foxdec] ; inserted
  TEST RAX, RAX
  JE L11d0_2    ; 0x11f8 --> L11d0_2

; Entry 11d0; block 3; address 11ef
L11d0_3:
  ; Resolved indirection: RAX --> _ITM_deregisterTMCloneTable
  JMP _ITM_deregisterTMCloneTable wrt ..plt

; Entry 11d0; block 2; address 11f8
L11d0_2:
  RET




; -------------------------------------
; Function: L1240___do_global_dtors_aux
; -------------------------------------
; Entry 1240; block 0; address 1240
L1240___do_global_dtors_aux:
  CMP byte [RELA_.bss_0x4020(0x8)], 0x0    ; 0x4028 --> L_.bss_0x4020 + 0x8
  JNE L1240_2    ; 0x1278 --> L1240_2

; Entry 1240; block 1; address 124d
L1240_1:
  PUSH RBP
  MOV qword [Ltemp_storage_foxdec], RAX ; inserted
  LEA RAX, [__cxa_finalize wrt ..plt]
  CMP RAX, 0x0
  MOV RAX, qword [Ltemp_storage_foxdec] ; inserted
  MOV RBP, RSP
  JE L1240_4    ; 0x1267 --> L1240_4

; Entry 1240; block 3; address 125b
L1240_3:
  MOV RDI, qword [L0___dso_handle]    ; 0x4008 --> L0___dso_handle
  CALL __cxa_finalize wrt ..plt

; Entry 1240; block 4; address 1267
L1240_4:
  CALL L11d0_deregister_tm_clones    ; 0x11d0 --> L11d0_deregister_tm_clones

; Entry 1240; block 5; address 126c
L1240_5:
  MOV byte [RELA_.bss_0x4020(0x8)], 0x1    ; 0x4028 --> L_.bss_0x4020 + 0x8
  POP RBP
  RET

; Entry 1240; block 2; address 1278
L1240_2:
  RET




; ---------------------------
; Function: L1280_frame_dummy
; ---------------------------
; Entry 1280; block 1; address 1224
L1280_1:
  MOV qword [Ltemp_storage_foxdec], RBX ; inserted
  LEA RBX, [_ITM_registerTMCloneTable wrt ..plt]
  MOV RAX, RBX
  MOV RBX, qword [Ltemp_storage_foxdec] ; inserted
  TEST RAX, RAX
  JE L1280_2    ; 0x1238 --> L1280_2

; Entry 1280; block 3; address 1230
L1280_3:
  ; Resolved indirection: RAX --> _ITM_registerTMCloneTable
  JMP _ITM_registerTMCloneTable wrt ..plt

; Entry 1280; block 2; address 1238
L1280_2:
  RET

; Entry 1280; block 0; address 1280
L1280_frame_dummy:
  LEA RDI, [__TMC_END__]    ; 0x4010 --> __TMC_END__
  LEA RSI, [__TMC_END__]    ; 0x4010 --> __TMC_END__
  SUB RSI, RDI
  MOV RAX, RSI
  SHR RSI, 0x3f
  SAR RAX, 0x3
  ADD RSI, RAX
  SAR RSI, 0x1
  JE L1280_2    ; 0x1238 --> L1280_2
  JMP L1280_1 ; jump is inserted




; ---------------------------
; Function: L1289_error_print
; ---------------------------
; Entry 1289; block 0; address 1289
L1289_error_print:
  PUSH RBP
  MOV RBP, RSP
  SUB RSP, 0x20
  MOV dword [RBP - 0x4], EDI
  MOV qword [RBP - 0x10], RSI
  MOV qword [RBP - 0x18], RDX
  MOV RAX, qword [stderr]
  MOV RDX, qword [RBP - 0x18]
  MOV RCX, qword [RBP - 0x10]
  MOV RSI, RCX
  MOV RDI, RAX
  CALL vfprintf wrt ..plt

; Entry 1289; block 1; address 12ba
L1289_1:
  CMP dword [RBP - 0x4], 0x0
  JE L1289_3    ; 0x12ce --> L1289_3

; Entry 1289; block 2; address 12c0
L1289_2:
  LEA RDI, [RELA_.rodata_0x2000(0x4)]    ; 0x2004 --> L_.rodata_0x2000 + 0x4
  CALL perror wrt ..plt

; Entry 1289; block 4; address 12cc
L1289_4:
  JMP L1289_5    ; 0x12e2 --> L1289_5

; Entry 1289; block 3; address 12ce
L1289_3:
  MOV RAX, qword [stderr]
  MOV RSI, RAX
  MOV EDI, 0xa
  CALL fputc wrt ..plt

; Entry 1289; block 5; address 12e2
L1289_5:
  MOV EDI, 0x1
  NOP
FOXDEC_TERMINATING_L1289_5:
  CALL exit wrt ..plt




; --------------------
; Function: L12ec_errf
; --------------------
; Entry 12ec; block 0; address 12ec
L12ec_errf:
  PUSH RBP
  MOV RBP, RSP
  SUB RSP, 0xe0
  MOV qword [RBP - 0xd8], RDI
  MOV qword [RBP - 0xa8], RSI
  MOV qword [RBP - 0xa0], RDX
  MOV qword [RBP - 0x98], RCX
  MOV qword [RBP - 0x90], R8
  MOV qword [RBP - 0x88], R9
  TEST AL, AL
  JE L12ec_2    ; 0x1349 --> L12ec_2

; Entry 12ec; block 1; address 1329
L12ec_1:
  MOVAPS oword [RBP - 0x80], XMM0
  MOVAPS oword [RBP - 0x70], XMM1
  MOVAPS oword [RBP - 0x60], XMM2
  MOVAPS oword [RBP - 0x50], XMM3
  MOVAPS oword [RBP - 0x40], XMM4
  MOVAPS oword [RBP - 0x30], XMM5
  MOVAPS oword [RBP - 0x20], XMM6
  MOVAPS oword [RBP - 0x10], XMM7

; Entry 12ec; block 2; address 1349
L12ec_2:
  MOV RAX, qword [FS:0x28]
  MOV qword [RBP - 0xb8], RAX
  XOR EAX, EAX
  MOV dword [RBP - 0xd0], 0x8
  MOV dword [RBP - 0xcc], 0x30
  LEA RAX, [RBP + 0x10]
  MOV qword [RBP - 0xc8], RAX
  LEA RAX, [RBP - 0xb0]
  MOV qword [RBP - 0xc0], RAX
  LEA RDX, [RBP - 0xd0]
  MOV RAX, qword [RBP - 0xd8]
  MOV RSI, RAX
  MOV EDI, 0x0
  NOP
FOXDEC_TERMINATING_L12ec_2:
  CALL L1289_error_print    ; 0x1289 --> L1289_error_print
L12ec_2_HLT:
  HLT ; should never be reached    ; 0x13a3 --> L12ec_2_HLT




; ---------------------
; Function: L13bd_perrf
; ---------------------
; Entry 13bd; block 0; address 13bd
L13bd_perrf:
  PUSH RBP
  MOV RBP, RSP
  SUB RSP, 0xe0
  MOV qword [RBP - 0xd8], RDI
  MOV qword [RBP - 0xa8], RSI
  MOV qword [RBP - 0xa0], RDX
  MOV qword [RBP - 0x98], RCX
  MOV qword [RBP - 0x90], R8
  MOV qword [RBP - 0x88], R9
  TEST AL, AL
  JE L13bd_2    ; 0x141a --> L13bd_2

; Entry 13bd; block 1; address 13fa
L13bd_1:
  MOVAPS oword [RBP - 0x80], XMM0
  MOVAPS oword [RBP - 0x70], XMM1
  MOVAPS oword [RBP - 0x60], XMM2
  MOVAPS oword [RBP - 0x50], XMM3
  MOVAPS oword [RBP - 0x40], XMM4
  MOVAPS oword [RBP - 0x30], XMM5
  MOVAPS oword [RBP - 0x20], XMM6
  MOVAPS oword [RBP - 0x10], XMM7

; Entry 13bd; block 2; address 141a
L13bd_2:
  MOV RAX, qword [FS:0x28]
  MOV qword [RBP - 0xb8], RAX
  XOR EAX, EAX
  MOV dword [RBP - 0xd0], 0x8
  MOV dword [RBP - 0xcc], 0x30
  LEA RAX, [RBP + 0x10]
  MOV qword [RBP - 0xc8], RAX
  LEA RAX, [RBP - 0xb0]
  MOV qword [RBP - 0xc0], RAX
  LEA RDX, [RBP - 0xd0]
  MOV RAX, qword [RBP - 0xd8]
  MOV RSI, RAX
  MOV EDI, 0x1
  NOP
FOXDEC_TERMINATING_L13bd_2:
  CALL L1289_error_print    ; 0x1289 --> L1289_error_print
L13bd_2_HLT:
  HLT ; should never be reached    ; 0x1474 --> L13bd_2_HLT




; ----------------------
; Function: L148e_report
; ----------------------
; Entry 148e; block 0; address 148e
L148e_report:
  PUSH RBP
  MOV RBP, RSP
  SUB RSP, 0x20
  MOV qword [RBP - 0x8], RDI
  MOV qword [RBP - 0x10], RSI
  MOV qword [RBP - 0x18], RDX
  MOV qword [RBP - 0x20], RCX
  MOV RSI, qword [RBP - 0x8]
  MOV RCX, qword [RBP - 0x10]
  MOV RDX, qword [RBP - 0x18]
  MOV RAX, qword [RBP - 0x20]
  MOV R8, RSI
  MOV RSI, RAX
  LEA RDI, [RELA_.rodata_0x2000(0x6)]    ; 0x2006 --> L_.rodata_0x2000 + 0x6
  MOV EAX, 0x0
  CALL printf wrt ..plt

; Entry 148e; block 1; address 14d1
L148e_1:
  LEAVE
  RET




; ----------------------
; Function: L14d4_isword
; ----------------------
; Entry 14d4; block 0; address 14d4
L14d4_isword:
  PUSH RBP
  MOV RBP, RSP
  SUB RSP, 0x10
  MOV EAX, EDI
  MOV byte [RBP - 0x4], AL
  CALL __ctype_b_loc wrt ..plt

; Entry 14d4; block 1; address 14ea
L14d4_1:
  MOV RAX, qword [RAX]
  MOVZX EDX, byte [RBP - 0x4]
  ADD RDX, RDX
  ADD RAX, RDX
  MOVZX EAX, word [RAX]
  MOVZX EAX, AX
  AND EAX, 0x400
  LEAVE
  RET




; -----------------------
; Function: L1504_getword
; -----------------------
; Entry 1504; block 0; address 1504
L1504_getword:
  PUSH RBP
  MOV RBP, RSP
  SUB RSP, 0x20
  MOV qword [RBP - 0x18], RDI
  MOV dword [RBP - 0x4], 0x0
  MOV RAX, qword [RBP - 0x18]
  MOV RDI, RAX
  CALL feof wrt ..plt

; Entry 1504; block 1; address 1527
L1504_1:
  TEST EAX, EAX
  JE L1504_3    ; 0x1584 --> L1504_3

; Entry 1504; block 2; address 152b
L1504_2:
  MOV EAX, 0x0
  JMP L1504_21    ; 0x15f8 --> L1504_21

; Entry 1504; block 9; address 1535
L1504_9:
  MOV EAX, dword [RBP - 0x8]
  MOVZX EAX, AL
  MOV EDI, EAX
  CALL L14d4_isword    ; 0x14d4 --> L14d4_isword

; Entry 1504; block 5; address 1542
L1504_5:
  TEST EAX, EAX
  JE L1504_7    ; 0x155a --> L1504_7

; Entry 1504; block 6; address 1546
L1504_6:
  MOV RAX, qword [RELA_.bss_0x4020(0x28)]    ; 0x4048 --> L_.bss_0x4020 + 0x28
  ADD RAX, 0x1
  MOV qword [RELA_.bss_0x4020(0x28)], RAX    ; 0x4048 --> L_.bss_0x4020 + 0x28
  JMP L1504_10    ; 0x1599 --> L1504_10

; Entry 1504; block 7; address 155a
L1504_7:
  MOV RAX, qword [RELA_.bss_0x4020(0x30)]    ; 0x4050 --> L_.bss_0x4020 + 0x30
  ADD RAX, 0x1
  MOV qword [RELA_.bss_0x4020(0x30)], RAX    ; 0x4050 --> L_.bss_0x4020 + 0x30
  CMP dword [RBP - 0x8], 0xa
  JNE L1504_3    ; 0x1584 --> L1504_3

; Entry 1504; block 8; address 1572
L1504_8:
  MOV RAX, qword [RELA_.bss_0x4020(0x38)]    ; 0x4058 --> L_.bss_0x4020 + 0x38
  ADD RAX, 0x1
  MOV qword [RELA_.bss_0x4020(0x38)], RAX    ; 0x4058 --> L_.bss_0x4020 + 0x38

; Entry 1504; block 3; address 1584
L1504_3:
  MOV RAX, qword [RBP - 0x18]
  MOV RDI, RAX
  CALL getc wrt ..plt

; Entry 1504; block 4; address 1590
L1504_4:
  MOV dword [RBP - 0x8], EAX
  CMP dword [RBP - 0x8], 0xffffffff
  JNE L1504_9    ; 0x1535 --> L1504_9

; Entry 1504; block 10; address 1599
L1504_10:
  JMP L1504_17    ; 0x15e5 --> L1504_17

; Entry 1504; block 18; address 159b
L1504_18:
  MOV RAX, qword [RELA_.bss_0x4020(0x30)]    ; 0x4050 --> L_.bss_0x4020 + 0x30
  ADD RAX, 0x1
  MOV qword [RELA_.bss_0x4020(0x30)], RAX    ; 0x4050 --> L_.bss_0x4020 + 0x30
  CMP dword [RBP - 0x8], 0xa
  JNE L1504_12    ; 0x15c5 --> L1504_12

; Entry 1504; block 11; address 15b3
L1504_11:
  MOV RAX, qword [RELA_.bss_0x4020(0x38)]    ; 0x4058 --> L_.bss_0x4020 + 0x38
  ADD RAX, 0x1
  MOV qword [RELA_.bss_0x4020(0x38)], RAX    ; 0x4058 --> L_.bss_0x4020 + 0x38

; Entry 1504; block 12; address 15c5
L1504_12:
  MOV EAX, dword [RBP - 0x8]
  MOVZX EAX, AL
  MOV EDI, EAX
  CALL L14d4_isword    ; 0x14d4 --> L14d4_isword

; Entry 1504; block 13; address 15d2
L1504_13:
  TEST EAX, EAX
  JE L1504_15    ; 0x15ed --> L1504_15

; Entry 1504; block 14; address 15d6
L1504_14:
  MOV RAX, qword [RBP - 0x18]
  MOV RDI, RAX
  CALL getc wrt ..plt

; Entry 1504; block 16; address 15e2
L1504_16:
  MOV dword [RBP - 0x8], EAX

; Entry 1504; block 17; address 15e5
L1504_17:
  CMP dword [RBP - 0x8], 0xffffffff
  JNE L1504_18    ; 0x159b --> L1504_18

; Entry 1504; block 19; address 15eb
L1504_19:
  JMP L1504_20    ; 0x15ee --> L1504_20

; Entry 1504; block 15; address 15ed
L1504_15:
  NOP ; NOP inserted

; Entry 1504; block 20; address 15ee
L1504_20:
  CMP dword [RBP - 0x8], 0xffffffff
  SETNE AL
  MOVZX EAX, AL

; Entry 1504; block 21; address 15f8
L1504_21:
  LEAVE
  RET




; -----------------------
; Function: L15fa_counter
; -----------------------
; Entry 15fa; block 0; address 15fa
L15fa_counter:
  PUSH RBP
  MOV RBP, RSP
  SUB RSP, 0x20
  MOV qword [RBP - 0x18], RDI
  MOV RAX, qword [RBP - 0x18]
  LEA RSI, [RELA_.rodata_0x2000(0x19)]    ; 0x2019 --> L_.rodata_0x2000 + 0x19
  MOV RDI, RAX
  CALL fopen wrt ..plt

; Entry 15fa; block 1; address 161d
L15fa_1:
  MOV qword [RBP - 0x8], RAX
  CMP qword [RBP - 0x8], 0x0
  JNE L15fa_3    ; 0x1640 --> L15fa_3

; Entry 15fa; block 2; address 1628
L15fa_2:
  MOV RAX, qword [RBP - 0x18]
  MOV RSI, RAX
  LEA RDI, [RELA_.rodata_0x2000(0x1b)]    ; 0x201b --> L_.rodata_0x2000 + 0x1b
  MOV EAX, 0x0
  NOP
FOXDEC_TERMINATING_L15fa_2:
  CALL L13bd_perrf    ; 0x13bd --> L13bd_perrf

; Entry 15fa; block 3; address 1640
L15fa_3:
  MOV qword [RELA_.bss_0x4020(0x38)], 0x0    ; 0x4058 --> L_.bss_0x4020 + 0x38
  MOV RAX, qword [RELA_.bss_0x4020(0x38)]    ; 0x4058 --> L_.bss_0x4020 + 0x38
  MOV qword [RELA_.bss_0x4020(0x28)], RAX    ; 0x4048 --> L_.bss_0x4020 + 0x28
  MOV RAX, qword [RELA_.bss_0x4020(0x28)]    ; 0x4048 --> L_.bss_0x4020 + 0x28
  MOV qword [RELA_.bss_0x4020(0x30)], RAX    ; 0x4050 --> L_.bss_0x4020 + 0x30

; Entry 15fa; block 5; address 1668
L15fa_5:
  MOV RAX, qword [RBP - 0x8]
  MOV RDI, RAX
  CALL L1504_getword    ; 0x1504 --> L1504_getword

; Entry 15fa; block 4; address 1674
L15fa_4:
  TEST EAX, EAX
  JNE L15fa_5    ; 0x1668 --> L15fa_5

; Entry 15fa; block 6; address 1678
L15fa_6:
  MOV RAX, qword [RBP - 0x8]
  MOV RDI, RAX
  CALL fclose wrt ..plt

; Entry 15fa; block 7; address 1684
L15fa_7:
  MOV RCX, qword [RELA_.bss_0x4020(0x38)]    ; 0x4058 --> L_.bss_0x4020 + 0x38
  MOV RDX, qword [RELA_.bss_0x4020(0x28)]    ; 0x4048 --> L_.bss_0x4020 + 0x28
  MOV RSI, qword [RELA_.bss_0x4020(0x30)]    ; 0x4050 --> L_.bss_0x4020 + 0x30
  MOV RAX, qword [RBP - 0x18]
  MOV RDI, RAX
  CALL L148e_report    ; 0x148e --> L148e_report

; Entry 15fa; block 8; address 16a5
L15fa_8:
  MOV RDX, qword [RELA_.bss_0x4020(0x10)]    ; 0x4030 --> L_.bss_0x4020 + 0x10
  MOV RAX, qword [RELA_.bss_0x4020(0x30)]    ; 0x4050 --> L_.bss_0x4020 + 0x30
  ADD RAX, RDX
  MOV qword [RELA_.bss_0x4020(0x10)], RAX    ; 0x4030 --> L_.bss_0x4020 + 0x10
  MOV RDX, qword [RELA_.bss_0x4020(0x18)]    ; 0x4038 --> L_.bss_0x4020 + 0x18
  MOV RAX, qword [RELA_.bss_0x4020(0x28)]    ; 0x4048 --> L_.bss_0x4020 + 0x28
  ADD RAX, RDX
  MOV qword [RELA_.bss_0x4020(0x18)], RAX    ; 0x4038 --> L_.bss_0x4020 + 0x18
  MOV RDX, qword [RELA_.bss_0x4020(0x20)]    ; 0x4040 --> L_.bss_0x4020 + 0x20
  MOV RAX, qword [RELA_.bss_0x4020(0x38)]    ; 0x4058 --> L_.bss_0x4020 + 0x38
  ADD RAX, RDX
  MOV qword [RELA_.bss_0x4020(0x20)], RAX    ; 0x4040 --> L_.bss_0x4020 + 0x20
  LEAVE
  RET




; --------------------
; Function: L16f0_main
; --------------------
; Entry 16f0; block 0; address 16f0
L16f0_main:
  PUSH RBP
  MOV RBP, RSP
  SUB RSP, 0x20
  MOV dword [RBP - 0x14], EDI
  MOV qword [RBP - 0x20], RSI
  CMP dword [RBP - 0x14], 0x1
  JG L16f0_2    ; 0x171a --> L16f0_2

; Entry 16f0; block 1; address 1709
L16f0_1:
  LEA RDI, [RELA_.rodata_0x2000(0x31)]    ; 0x2031 --> L_.rodata_0x2000 + 0x31
  MOV EAX, 0x0
  NOP
FOXDEC_TERMINATING_L16f0_1:
  CALL L12ec_errf    ; 0x12ec --> L12ec_errf

; Entry 16f0; block 2; address 171a
L16f0_2:
  MOV dword [RBP - 0x4], 0x1
  JMP L16f0_4    ; 0x1746 --> L16f0_4

; Entry 16f0; block 5; address 1723
L16f0_5:
  MOV EAX, dword [RBP - 0x4]
  CDQE
  LEA RDX, [RAX * 8]
  MOV RAX, qword [RBP - 0x20]
  ADD RAX, RDX
  MOV RAX, qword [RAX]
  MOV RDI, RAX
  CALL L15fa_counter    ; 0x15fa --> L15fa_counter

; Entry 16f0; block 3; address 1742
L16f0_3:
  ADD dword [RBP - 0x4], 0x1

; Entry 16f0; block 4; address 1746
L16f0_4:
  MOV EAX, dword [RBP - 0x4]
  CMP EAX, dword [RBP - 0x14]
  JL L16f0_5    ; 0x1723 --> L16f0_5

; Entry 16f0; block 6; address 174e
L16f0_6:
  CMP dword [RBP - 0x14], 0x2
  JLE L16f0_8    ; 0x1778 --> L16f0_8

; Entry 16f0; block 7; address 1754
L16f0_7:
  MOV RCX, qword [RELA_.bss_0x4020(0x20)]    ; 0x4040 --> L_.bss_0x4020 + 0x20
  MOV RDX, qword [RELA_.bss_0x4020(0x18)]    ; 0x4038 --> L_.bss_0x4020 + 0x18
  MOV RAX, qword [RELA_.bss_0x4020(0x10)]    ; 0x4030 --> L_.bss_0x4020 + 0x10
  MOV RSI, RAX
  LEA RDI, [RELA_.rodata_0x2000(0x4a)]    ; 0x204a --> L_.rodata_0x2000 + 0x4a
  CALL L148e_report    ; 0x148e --> L148e_report

; Entry 16f0; block 8; address 1778
L16f0_8:
  MOV EAX, 0x0
  LEAVE
  RET




; -------------------------------
; Function: L1780___libc_csu_init
; -------------------------------
; Entry 1780; block 0; address 1780
L1780___libc_csu_init:
  PUSH R15
  LEA R15, [L0___init_array_start]    ; 0x3d68 --> L0___init_array_start
  PUSH R14
  MOV R14, RDX
  PUSH R13
  MOV R13, RSI
  PUSH R12
  MOV R12D, EDI
  PUSH RBP
  LEA RBP, [L0___init_array_end]    ; 0x3d70 --> L0___init_array_end
  PUSH RBX
  SUB RBP, R15
  SUB RSP, 0x8
  CALL L1000__init    ; 0x1000 --> L1000__init

; Entry 1780; block 1; address 17b1
L1780_1:
  SAR RBP, 0x3
  JE L1780_3    ; 0x17d6 --> L1780_3

; Entry 1780; block 2; address 17b7
L1780_2:
  XOR EBX, EBX

; Entry 1780; block 5; address 17c0
L1780_5:
  MOV RDX, R14
  MOV RSI, R13
  MOV EDI, R12D
  CALL qword [R15 + RBX * 8]
  ; Unresolved indirection

; Entry 1780; block 4; address 17cd
L1780_4:
  ADD RBX, 0x1
  CMP RBP, RBX
  JNE L1780_5    ; 0x17c0 --> L1780_5

; Entry 1780; block 3; address 17d6
L1780_3:
  ADD RSP, 0x8
  POP RBX
  POP RBP
  POP R12
  POP R13
  POP R14
  POP R15
  RET




; -------------------------------
; Function: L17f0___libc_csu_fini
; -------------------------------
; Entry 17f0; block 0; address 17f0
L17f0___libc_csu_fini:
  RET




section .rodata align=4
L_.rodata_0x2000:
db 01h
db 00h
db 02h
db 00h
db ` `, 0
db `%6lu %6lu %6lu %s\n`, 0
db `r`, 0
db `cannot open file \`%s'`, 0
db `usage: wc FILE [FILE...]`, 0
db `total`, 0
L_.rodata_END:


section .init_array align=8
L0___init_array_start:
L_.init_array_0x3d68:
dq L1280_frame_dummy    ; 0x1280 --> L1280_frame_dummy
L_.init_array_END:


section .fini_array align=8
L0___init_array_end:
L_.fini_array_0x3d70:
dq L1240___do_global_dtors_aux    ; 0x1240 --> L1240___do_global_dtors_aux
L_.fini_array_END:





section .data align=8
L_.data_0x4000:
db 00h
db 00h
db 00h
db 00h
db 00h
db 00h
db 00h
db 00h
L0___dso_handle:
dq L0___dso_handle    ; 0x4008 --> L0___dso_handle
L_.data_END:





section .bss align=32
L_.bss_0x4020:
resb 64
L_.bss_END:














section .bss
Ltemp_storage_foxdec:
resb 8


; TEMP_OBJECTs are memory locations inserted by FoxDec not present in the original binary
; EXT_OBJECTs are external objects such as stderr and stdout
; The remainder is a mapping from original addresses to internal labels
%ifdef COMMENT
TEMP_OBJECT Ltemp_storage_foxdec
EXT_OBJECT stderr
0x1000: L1000__init
0x1014: L1000_1
0x1016: L1000_2
0x10e0: L10e0_0
0x10f0: L10f0_0
0x1110: L1110_0
0x1120: L1120_0
0x1130: L1130_0
0x1140: L1140_0
0x1150: L1150_0
0x1160: L1160_0
0x1170: L1170_0
0x1180: L1180_0
0x1190: L1190_0
0x11a0: _start
0x11ce: L11a0_1
0x11d0: L11d0_deregister_tm_clones
0x11e3: L11d0_1
0x11f8: L11d0_2
0x11ef: L11d0_3
0x1240: L1240___do_global_dtors_aux
0x124d: L1240_1
0x1278: L1240_2
0x125b: L1240_3
0x1267: L1240_4
0x126c: L1240_5
0x1280: L1280_frame_dummy
0x1224: L1280_1
0x1238: L1280_2
0x1230: L1280_3
0x1289: L1289_error_print
0x12ba: L1289_1
0x12c0: L1289_2
0x12ce: L1289_3
0x12cc: L1289_4
0x12e2: L1289_5
0x12ec: L12ec_errf
0x1329: L12ec_1
0x1349: L12ec_2
0x13bd: L13bd_perrf
0x13fa: L13bd_1
0x141a: L13bd_2
0x148e: L148e_report
0x14d1: L148e_1
0x14d4: L14d4_isword
0x14ea: L14d4_1
0x1504: L1504_getword
0x1527: L1504_1
0x152b: L1504_2
0x1584: L1504_3
0x1590: L1504_4
0x1542: L1504_5
0x1546: L1504_6
0x155a: L1504_7
0x1572: L1504_8
0x1535: L1504_9
0x1599: L1504_10
0x15b3: L1504_11
0x15c5: L1504_12
0x15d2: L1504_13
0x15d6: L1504_14
0x15ed: L1504_15
0x15e2: L1504_16
0x15e5: L1504_17
0x159b: L1504_18
0x15eb: L1504_19
0x15ee: L1504_20
0x15f8: L1504_21
0x15fa: L15fa_counter
0x161d: L15fa_1
0x1628: L15fa_2
0x1640: L15fa_3
0x1674: L15fa_4
0x1668: L15fa_5
0x1678: L15fa_6
0x1684: L15fa_7
0x16a5: L15fa_8
0x16f0: L16f0_main
0x1709: L16f0_1
0x171a: L16f0_2
0x1742: L16f0_3
0x1746: L16f0_4
0x1723: L16f0_5
0x174e: L16f0_6
0x1754: L16f0_7
0x1778: L16f0_8
0x1780: L1780___libc_csu_init
0x17b1: L1780_1
0x17b7: L1780_2
0x17d6: L1780_3
0x17cd: L1780_4
0x17c0: L1780_5
0x17f0: L17f0___libc_csu_fini
0x4010: L_.data_0x4000 + 0x10
0x4028: L_.bss_0x4020 + 0x8
0x4008: L0___dso_handle
0x2004: L_.rodata_0x2000 + 0x4
0x13a3: L12ec_2_HLT
0x1474: L13bd_2_HLT
0x2006: L_.rodata_0x2000 + 0x6
0x4048: L_.bss_0x4020 + 0x28
0x4050: L_.bss_0x4020 + 0x30
0x4058: L_.bss_0x4020 + 0x38
0x2019: L_.rodata_0x2000 + 0x19
0x201b: L_.rodata_0x2000 + 0x1b
0x4030: L_.bss_0x4020 + 0x10
0x4038: L_.bss_0x4020 + 0x18
0x4040: L_.bss_0x4020 + 0x20
0x2031: L_.rodata_0x2000 + 0x31
0x204a: L_.rodata_0x2000 + 0x4a
0x3d68: L0___init_array_start
0x3d70: L0___init_array_end
%endif
