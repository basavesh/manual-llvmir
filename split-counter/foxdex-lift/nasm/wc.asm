extern _ITM_deregisterTMCloneTable
extern _ITM_registerTMCloneTable
extern __ctype_b_loc
extern __cxa_finalize
extern __gmon_start__
extern __libc_start_main
extern exit
extern fclose
extern feof
extern fopen
extern getc
extern printf


global _start


default rel


%define RELA_.rodata_0x2000(offset) (L_.rodata_0x2000 + offset)
%define RELA_.init_array_0x3de8(offset) (L_.init_array_0x3de8 + offset)
%define RELA_.fini_array_0x3df0(offset) (L_.fini_array_0x3df0 + offset)
%define RELA_.data_0x4048(offset) (L_.data_0x4048 + offset)
%define RELA_.bss_0x4058(offset) (L_.bss_0x4058 + offset)

%define __GNU_EH_FRAME_HDR RELA_.rodata_0x2000(0x48)
%define _end RELA_.bss_0x4058(0x18)


; -----------------
; Function: L1030_0
; -----------------
; Entry 1030; block 0; address 1030
L1030_0:
  JMP fclose wrt ..plt




; -----------------
; Function: L1040_0
; -----------------
; Entry 1040; block 0; address 1040
L1040_0:
  JMP printf wrt ..plt




; -----------------
; Function: L1050_0
; -----------------
; Entry 1050; block 0; address 1050
L1050_0:
  JMP feof wrt ..plt




; -----------------
; Function: L1060_0
; -----------------
; Entry 1060; block 0; address 1060
L1060_0:
  JMP fopen wrt ..plt




; -----------------
; Function: L1070_0
; -----------------
; Entry 1070; block 0; address 1070
L1070_0:
  JMP getc wrt ..plt




; -----------------
; Function: L1080_0
; -----------------
; Entry 1080; block 0; address 1080
L1080_0:
  JMP __ctype_b_loc wrt ..plt




; -----------------
; Function: L1090_0
; -----------------
; Entry 1090; block 0; address 1090
L1090_0:
  JMP __cxa_finalize wrt ..plt




; ----------------
; Function: _start
; ----------------
; Entry 10a0; block 0; address 10a0
_start:
  XOR EBP, EBP
  MOV R9, RDX
  POP RSI
  MOV RDX, RSP
  AND RSP, 0xfffffffffffffff0
  PUSH RAX
  PUSH RSP
  XOR R8D, R8D
  XOR ECX, ECX
  LEA RDI, [main]    ; 0x1380 --> main
  CALL __libc_start_main wrt ..plt

; Entry 10a0; block 1; address 10c5
L10a0_1:
  HLT




; ------------------------------
; Function: deregister_tm_clones
; ------------------------------
; Entry 10d0; block 0; address 10d0
deregister_tm_clones:
  LEA RDI, [RELA_.bss_0x4058(0x0)]    ; 0x4058 --> L_.bss_0x4058
  LEA RAX, [RELA_.bss_0x4058(0x0)]    ; 0x4058 --> L_.bss_0x4058
  CMP RAX, RDI
  JE L10d0_2    ; 0x10f8 --> L10d0_2

; Entry 10d0; block 1; address 10e3
L10d0_1:
  MOV qword [Ltemp_storage_foxdec], RBX ; inserted
  LEA RBX, [_ITM_deregisterTMCloneTable wrt ..plt]
  MOV RAX, RBX
  MOV RBX, qword [Ltemp_storage_foxdec] ; inserted
  TEST RAX, RAX
  JE L10d0_2    ; 0x10f8 --> L10d0_2

; Entry 10d0; block 3; address 10ef
L10d0_3:
  ; Resolved indirection: RAX --> _ITM_deregisterTMCloneTable
  JMP _ITM_deregisterTMCloneTable wrt ..plt

; Entry 10d0; block 2; address 10f8
L10d0_2:
  RET




; -------------------------------
; Function: __do_global_dtors_aux
; -------------------------------
; Entry 1140; block 0; address 1140
__do_global_dtors_aux:
  CMP byte [RELA_.bss_0x4058(0x0)], 0x0    ; 0x4058 --> L_.bss_0x4058
  JNE L1140_2    ; 0x1178 --> L1140_2

; Entry 1140; block 1; address 114d
L1140_1:
  PUSH RBP
  MOV qword [Ltemp_storage_foxdec], RAX ; inserted
  LEA RAX, [__cxa_finalize wrt ..plt]
  CMP RAX, 0x0
  MOV RAX, qword [Ltemp_storage_foxdec] ; inserted
  MOV RBP, RSP
  JE L1140_4    ; 0x1167 --> L1140_4

; Entry 1140; block 3; address 115b
L1140_3:
  MOV RDI, qword [__dso_handle]    ; 0x4050 --> __dso_handle
  CALL __cxa_finalize wrt ..plt

; Entry 1140; block 4; address 1167
L1140_4:
  CALL deregister_tm_clones    ; 0x10d0 --> deregister_tm_clones

; Entry 1140; block 5; address 116c
L1140_5:
  MOV byte [RELA_.bss_0x4058(0x0)], 0x1    ; 0x4058 --> L_.bss_0x4058
  POP RBP
  RET

; Entry 1140; block 2; address 1178
L1140_2:
  RET




; ---------------------
; Function: frame_dummy
; ---------------------
; Entry 1180; block 1; address 1124
L1180_1:
  MOV qword [Ltemp_storage_foxdec], RBX ; inserted
  LEA RBX, [_ITM_registerTMCloneTable wrt ..plt]
  MOV RAX, RBX
  MOV RBX, qword [Ltemp_storage_foxdec] ; inserted
  TEST RAX, RAX
  JE L1180_2    ; 0x1138 --> L1180_2

; Entry 1180; block 3; address 1130
L1180_3:
  ; Resolved indirection: RAX --> _ITM_registerTMCloneTable
  JMP _ITM_registerTMCloneTable wrt ..plt

; Entry 1180; block 2; address 1138
L1180_2:
  RET

; Entry 1180; block 0; address 1180
frame_dummy:
  LEA RDI, [RELA_.bss_0x4058(0x0)]    ; 0x4058 --> L_.bss_0x4058
  LEA RSI, [RELA_.bss_0x4058(0x0)]    ; 0x4058 --> L_.bss_0x4058
  SUB RSI, RDI
  MOV RAX, RSI
  SHR RSI, 0x3f
  SAR RAX, 0x3
  ADD RSI, RAX
  SAR RSI, 0x1
  JE L1180_2    ; 0x1138 --> L1180_2
  JMP L1180_1 ; jump is inserted




; -----------------
; Function: counter
; -----------------
; Entry 1190; block 0; address 1190
counter:
  PUSH RBP
  MOV RBP, RSP
  SUB RSP, 0x10
  MOV qword [RBP - 0x8], RDI
  MOV RDI, qword [RBP - 0x8]
  LEA RSI, [RELA_.rodata_0x2000(0x4)]    ; 0x2004 --> L_.rodata_0x2000 + 0x4
  CALL fopen wrt ..plt

; Entry 1190; block 1; address 11ac
L1190_1:
  MOV qword [RBP - 0x10], RAX
  CMP qword [RBP - 0x10], 0x0
  JNE L1190_3    ; 0x11d2 --> L1190_3

; Entry 1190; block 2; address 11bb
L1190_2:
  MOV RSI, qword [RBP - 0x8]
  LEA RDI, [RELA_.rodata_0x2000(0x6)]    ; 0x2006 --> L_.rodata_0x2000 + 0x6
  MOV AL, 0x0
  CALL printf wrt ..plt

; Entry 1190; block 4; address 11cd
L1190_4:
  JMP L1190_11    ; 0x1231 --> L1190_11

; Entry 1190; block 3; address 11d2
L1190_3:
  LEA RAX, [RELA_.bss_0x4058(0x10)]    ; 0x4068 --> L_.bss_0x4058 + 0x10
  MOV qword [RAX], 0x0

; Entry 1190; block 8; address 11e0
L1190_8:
  MOV RDI, qword [RBP - 0x10]
  CALL getword    ; 0x1270 --> getword

; Entry 1190; block 5; address 11e9
L1190_5:
  CMP EAX, 0x0
  JE L1190_7    ; 0x11f7 --> L1190_7

; Entry 1190; block 6; address 11f2
L1190_6:
  JMP L1190_8    ; 0x11e0 --> L1190_8

; Entry 1190; block 7; address 11f7
L1190_7:
  MOV RDI, qword [RBP - 0x10]
  CALL fclose wrt ..plt

; Entry 1190; block 9; address 1200
L1190_9:
  MOV RDI, qword [RBP - 0x8]
  LEA RAX, [RELA_.bss_0x4058(0x10)]    ; 0x4068 --> L_.bss_0x4058 + 0x10
  MOV RSI, qword [RAX]
  CALL report    ; 0x1240 --> report

; Entry 1190; block 10; address 1213
L1190_10:
  LEA RAX, [RELA_.bss_0x4058(0x10)]    ; 0x4068 --> L_.bss_0x4058 + 0x10
  MOV RCX, qword [RAX]
  LEA RAX, [RELA_.bss_0x4058(0x8)]    ; 0x4060 --> L_.bss_0x4058 + 0x8
  ADD RCX, qword [RAX]
  LEA RAX, [RELA_.bss_0x4058(0x8)]    ; 0x4060 --> L_.bss_0x4058 + 0x8
  MOV qword [RAX], RCX

; Entry 1190; block 11; address 1231
L1190_11:
  ADD RSP, 0x10
  POP RBP
  RET




; ----------------
; Function: report
; ----------------
; Entry 1240; block 0; address 1240
report:
  PUSH RBP
  MOV RBP, RSP
  SUB RSP, 0x10
  MOV qword [RBP - 0x8], RDI
  MOV qword [RBP - 0x10], RSI
  MOV RSI, qword [RBP - 0x10]
  MOV RDX, qword [RBP - 0x8]
  LEA RDI, [RELA_.rodata_0x2000(0x1d)]    ; 0x201d --> L_.rodata_0x2000 + 0x1d
  MOV AL, 0x0
  CALL printf wrt ..plt

; Entry 1240; block 1; address 1266
L1240_1:
  ADD RSP, 0x10
  POP RBP
  RET




; -----------------
; Function: getword
; -----------------
; Entry 1270; block 0; address 1270
getword:
  PUSH RBP
  MOV RBP, RSP
  SUB RSP, 0x20
  MOV qword [RBP - 0x10], RDI
  MOV dword [RBP - 0x18], 0x0
  MOV RDI, qword [RBP - 0x10]
  CALL feof wrt ..plt

; Entry 1270; block 1; address 128c
L1270_1:
  CMP EAX, 0x0
  JE L1270_3    ; 0x12a1 --> L1270_3

; Entry 1270; block 2; address 1295
L1270_2:
  MOV dword [RBP - 0x4], 0x0
  JMP L1270_18    ; 0x1338 --> L1270_18

; Entry 1270; block 3; address 12a1
L1270_3:
  JMP L1270_10    ; 0x12a6 --> L1270_10

; Entry 1270; block 10; address 12a6
L1270_10:
  MOV RDI, qword [RBP - 0x10]
  CALL getc wrt ..plt

; Entry 1270; block 4; address 12af
L1270_4:
  MOV dword [RBP - 0x14], EAX
  CMP EAX, 0xffffffff
  JE L1270_6    ; 0x12eb --> L1270_6

; Entry 1270; block 5; address 12bb
L1270_5:
  MOV EAX, dword [RBP - 0x14]
  MOVZX EDI, AL
  CALL isword    ; 0x1350 --> isword

; Entry 1270; block 7; address 12c6
L1270_7:
  CMP EAX, 0x0
  JE L1270_9    ; 0x12e6 --> L1270_9

; Entry 1270; block 8; address 12cf
L1270_8:
  MOV RAX, qword [RELA_.bss_0x4058(0x10)]    ; 0x4068 --> L_.bss_0x4058 + 0x10
  ADD RAX, 0x1
  MOV qword [RELA_.bss_0x4058(0x10)], RAX    ; 0x4068 --> L_.bss_0x4058 + 0x10
  JMP L1270_6    ; 0x12eb --> L1270_6

; Entry 1270; block 9; address 12e6
L1270_9:
  JMP L1270_10    ; 0x12a6 --> L1270_10

; Entry 1270; block 6; address 12eb
L1270_6:
  JMP L1270_17    ; 0x12f0 --> L1270_17

; Entry 1270; block 17; address 12f0
L1270_17:
  CMP dword [RBP - 0x14], 0xffffffff
  JE L1270_12    ; 0x1329 --> L1270_12

; Entry 1270; block 11; address 12fa
L1270_11:
  MOV EAX, dword [RBP - 0x14]
  MOVZX EDI, AL
  CALL isword    ; 0x1350 --> isword

; Entry 1270; block 13; address 1305
L1270_13:
  CMP EAX, 0x0
  JNE L1270_15    ; 0x1313 --> L1270_15

; Entry 1270; block 14; address 130e
L1270_14:
  JMP L1270_12    ; 0x1329 --> L1270_12

; Entry 1270; block 15; address 1313
L1270_15:
  MOV RDI, qword [RBP - 0x10]
  CALL getc wrt ..plt

; Entry 1270; block 16; address 1321
L1270_16:
  MOV dword [RBP - 0x14], EAX
  JMP L1270_17    ; 0x12f0 --> L1270_17

; Entry 1270; block 12; address 1329
L1270_12:
  CMP dword [RBP - 0x14], 0xffffffff
  SETNE AL
  AND AL, 0x1
  MOVZX EAX, AL
  MOV dword [RBP - 0x4], EAX

; Entry 1270; block 18; address 1338
L1270_18:
  MOV EAX, dword [RBP - 0x4]
  ADD RSP, 0x20
  POP RBP
  RET




; ----------------
; Function: isword
; ----------------
; Entry 1350; block 0; address 1350
isword:
  PUSH RBP
  MOV RBP, RSP
  SUB RSP, 0x10
  MOV AL, DIL
  MOV byte [RBP - 0x1], AL
  CALL __ctype_b_loc wrt ..plt

; Entry 1350; block 1; address 1363
L1350_1:
  MOV RAX, qword [RAX]
  MOVZX ECX, byte [RBP - 0x1]
  MOVSXD RCX, ECX
  MOVZX EAX, word [RAX + RCX * 2]
  AND EAX, 0x400
  ADD RSP, 0x10
  POP RBP
  RET




; --------------
; Function: main
; --------------
; Entry 1380; block 0; address 1380
main:
  PUSH RBP
  MOV RBP, RSP
  SUB RSP, 0x20
  MOV dword [RBP - 0x4], 0x0
  MOV dword [RBP - 0x8], EDI
  MOV qword [RBP - 0x10], RSI
  CMP dword [RBP - 0x8], 0x2
  JGE L1380_2    ; 0x13ba --> L1380_2

; Entry 1380; block 1; address 13a0
L1380_1:
  LEA RDI, [RELA_.rodata_0x2000(0x26)]    ; 0x2026 --> L_.rodata_0x2000 + 0x26
  MOV AL, 0x0
  CALL printf wrt ..plt

; Entry 1380; block 3; address 13ae
L1380_3:
  MOV dword [RBP - 0x4], 0xffffffff
  JMP L1380_10    ; 0x1410 --> L1380_10

; Entry 1380; block 2; address 13ba
L1380_2:
  MOV dword [RBP - 0x14], 0x1

; Entry 1380; block 7; address 13c1
L1380_7:
  MOV EAX, dword [RBP - 0x14]
  CMP EAX, dword [RBP - 0x8]
  JGE L1380_5    ; 0x13ec --> L1380_5

; Entry 1380; block 4; address 13cd
L1380_4:
  MOV RAX, qword [RBP - 0x10]
  MOVSXD RCX, dword [RBP - 0x14]
  MOV RDI, qword [RAX + RCX * 8]
  CALL counter    ; 0x1190 --> counter

; Entry 1380; block 6; address 13de
L1380_6:
  MOV EAX, dword [RBP - 0x14]
  ADD EAX, 0x1
  MOV dword [RBP - 0x14], EAX
  JMP L1380_7    ; 0x13c1 --> L1380_7

; Entry 1380; block 5; address 13ec
L1380_5:
  CMP dword [RBP - 0x8], 0x2
  JLE L1380_9    ; 0x1409 --> L1380_9

; Entry 1380; block 8; address 13f6
L1380_8:
  MOV RSI, qword [RELA_.bss_0x4058(0x8)]    ; 0x4060 --> L_.bss_0x4058 + 0x8
  LEA RDI, [RELA_.rodata_0x2000(0x3f)]    ; 0x203f --> L_.rodata_0x2000 + 0x3f
  CALL report    ; 0x1240 --> report

; Entry 1380; block 9; address 1409
L1380_9:
  MOV dword [RBP - 0x4], 0x0

; Entry 1380; block 10; address 1410
L1380_10:
  MOV EAX, dword [RBP - 0x4]
  ADD RSP, 0x20
  POP RBP
  RET




section .rodata align=4
L_.rodata_0x2000:
db 01h
db 00h
db 02h
db 00h
db `r`, 0
db `cannot open file \`%s'\n`, 0
db `%6lu %s\n`, 0
db `usage: wc FILE [FILE...]`, 0
db `total`, 0
L_.rodata_END:


section .init_array align=8
L_.init_array_0x3de8:
L_reloc_0x3de8_0x1180:
dq frame_dummy    ; 0x1180 --> frame_dummy
L_.init_array_END:


section .fini_array align=8
L_.fini_array_0x3df0:
L_reloc_0x3df0_0x1140:
dq __do_global_dtors_aux    ; 0x1140 --> __do_global_dtors_aux
L_.fini_array_END:





section .data align=8
L_.data_0x4048:
db 00h
db 00h
db 00h
db 00h
db 00h
db 00h
db 00h
db 00h
__dso_handle:
dq __dso_handle    ; 0x4050 --> __dso_handle
L_.data_END:





section .bss align=8
L_.bss_0x4058:
resb 24
L_.bss_END:











section .bss
Ltemp_storage_foxdec:
resb 8


; TEMP_OBJECTs are memory locations inserted by FoxDec not present in the original binary
; EXT_OBJECTs are external objects such as stderr and stdout
; The remainder is a mapping from original addresses to internal labels
%ifdef COMMENT
TEMP_OBJECT Ltemp_storage_foxdec

0x1030: L1030_0
0x1040: L1040_0
0x1050: L1050_0
0x1060: L1060_0
0x1070: L1070_0
0x1080: L1080_0
0x1090: L1090_0
0x10a0: _start
0x10c5: L10a0_1
0x10d0: deregister_tm_clones
0x10e3: L10d0_1
0x10f8: L10d0_2
0x10ef: L10d0_3
0x1140: __do_global_dtors_aux
0x114d: L1140_1
0x1178: L1140_2
0x115b: L1140_3
0x1167: L1140_4
0x116c: L1140_5
0x1180: frame_dummy
0x1124: L1180_1
0x1138: L1180_2
0x1130: L1180_3
0x1190: counter
0x11ac: L1190_1
0x11bb: L1190_2
0x11d2: L1190_3
0x11cd: L1190_4
0x11e9: L1190_5
0x11f2: L1190_6
0x11f7: L1190_7
0x11e0: L1190_8
0x1200: L1190_9
0x1213: L1190_10
0x1231: L1190_11
0x1240: report
0x1266: L1240_1
0x1270: getword
0x128c: L1270_1
0x1295: L1270_2
0x12a1: L1270_3
0x12af: L1270_4
0x12bb: L1270_5
0x12eb: L1270_6
0x12c6: L1270_7
0x12cf: L1270_8
0x12e6: L1270_9
0x12a6: L1270_10
0x12fa: L1270_11
0x1329: L1270_12
0x1305: L1270_13
0x130e: L1270_14
0x1313: L1270_15
0x1321: L1270_16
0x12f0: L1270_17
0x1338: L1270_18
0x1350: isword
0x1363: L1350_1
0x1380: main
0x13a0: L1380_1
0x13ba: L1380_2
0x13ae: L1380_3
0x13cd: L1380_4
0x13ec: L1380_5
0x13de: L1380_6
0x13c1: L1380_7
0x13f6: L1380_8
0x1409: L1380_9
0x1410: L1380_10
0x4058: L_.bss_0x4058
0x4050: __dso_handle
0x2004: L_.rodata_0x2000 + 0x4
0x2006: L_.rodata_0x2000 + 0x6
0x4068: L_.bss_0x4058 + 0x10
0x4060: L_.bss_0x4058 + 0x8
0x201d: L_.rodata_0x2000 + 0x1d
0x2026: L_.rodata_0x2000 + 0x26
0x203f: L_.rodata_0x2000 + 0x3f
%endif