extern _ITM_deregisterTMCloneTable
extern _ITM_registerTMCloneTable
extern __cxa_finalize
extern __gmon_start__
extern __libc_start_main
extern connect
extern exit
extern fputs
extern htons
extern inet_pton
extern memset
extern printf
extern read
extern socket
extern stdout


global _start


default rel


%define RELA_.rodata_0x2000(offset) (L_.rodata_0x2000 + offset)
%define RELA_.init_array_0x3dc8(offset) (L_.init_array_0x3dc8 + offset)
%define RELA_.fini_array_0x3dd0(offset) (L_.fini_array_0x3dd0 + offset)
%define RELA_.data_0x4040(offset) (L_.data_0x4040 + offset)
%define RELA_.bss_0x4050(offset) (L_.bss_0x4050 + offset)

%define __GNU_EH_FRAME_HDR RELA_.rodata_0x2000(0xa4)
%define _end RELA_.bss_0x4050(0x8)


; -----------------
; Function: L1030_0
; -----------------
; Entry 1030; block 0; address 1030
L1030_0:
  JMP htons wrt ..plt




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
  JMP fputs wrt ..plt




; -----------------
; Function: L1060_0
; -----------------
; Entry 1060; block 0; address 1060
L1060_0:
  JMP memset wrt ..plt




; -----------------
; Function: L1070_0
; -----------------
; Entry 1070; block 0; address 1070
L1070_0:
  JMP read wrt ..plt




; -----------------
; Function: L1080_0
; -----------------
; Entry 1080; block 0; address 1080
L1080_0:
  JMP inet_pton wrt ..plt




; -----------------
; Function: L1090_0
; -----------------
; Entry 1090; block 0; address 1090
L1090_0:
  JMP connect wrt ..plt




; -----------------
; Function: L10a0_0
; -----------------
; Entry 10a0; block 0; address 10a0
L10a0_0:
  JMP socket wrt ..plt




; -----------------
; Function: L10b0_0
; -----------------
; Entry 10b0; block 0; address 10b0
L10b0_0:
  JMP __cxa_finalize wrt ..plt




; ----------------
; Function: _start
; ----------------
; Entry 10c0; block 0; address 10c0
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
  LEA RDI, [main]    ; 0x11b0 --> main
  CALL __libc_start_main wrt ..plt

; Entry 10c0; block 1; address 10e5
L10c0_1:
  HLT




; ------------------------------
; Function: deregister_tm_clones
; ------------------------------
; Entry 10f0; block 0; address 10f0
deregister_tm_clones:
  LEA RDI, [RELA_.bss_0x4050(0x0)]    ; 0x4050 --> L_.bss_0x4050
  LEA RAX, [RELA_.bss_0x4050(0x0)]    ; 0x4050 --> L_.bss_0x4050
  CMP RAX, RDI
  JE L10f0_2    ; 0x1118 --> L10f0_2

; Entry 10f0; block 1; address 1103
L10f0_1:
  MOV qword [Ltemp_storage_foxdec], RBX ; inserted
  LEA RBX, [_ITM_deregisterTMCloneTable wrt ..plt]
  MOV RAX, RBX
  MOV RBX, qword [Ltemp_storage_foxdec] ; inserted
  TEST RAX, RAX
  JE L10f0_2    ; 0x1118 --> L10f0_2

; Entry 10f0; block 3; address 110f
L10f0_3:
  ; Resolved indirection: RAX --> _ITM_deregisterTMCloneTable
  JMP _ITM_deregisterTMCloneTable wrt ..plt

; Entry 10f0; block 2; address 1118
L10f0_2:
  RET




; -------------------------------
; Function: __do_global_dtors_aux
; -------------------------------
; Entry 1160; block 0; address 1160
__do_global_dtors_aux:
  CMP byte [RELA_.bss_0x4050(0x0)], 0x0    ; 0x4050 --> L_.bss_0x4050
  JNE L1160_2    ; 0x1198 --> L1160_2

; Entry 1160; block 1; address 116d
L1160_1:
  PUSH RBP
  MOV qword [Ltemp_storage_foxdec], RAX ; inserted
  LEA RAX, [__cxa_finalize wrt ..plt]
  CMP RAX, 0x0
  MOV RAX, qword [Ltemp_storage_foxdec] ; inserted
  MOV RBP, RSP
  JE L1160_4    ; 0x1187 --> L1160_4

; Entry 1160; block 3; address 117b
L1160_3:
  MOV RDI, qword [__dso_handle]    ; 0x4048 --> __dso_handle
  CALL __cxa_finalize wrt ..plt

; Entry 1160; block 4; address 1187
L1160_4:
  CALL deregister_tm_clones    ; 0x10f0 --> deregister_tm_clones

; Entry 1160; block 5; address 118c
L1160_5:
  MOV byte [RELA_.bss_0x4050(0x0)], 0x1    ; 0x4050 --> L_.bss_0x4050
  POP RBP
  RET

; Entry 1160; block 2; address 1198
L1160_2:
  RET




; ---------------------
; Function: frame_dummy
; ---------------------
; Entry 11a0; block 1; address 1144
L11a0_1:
  MOV qword [Ltemp_storage_foxdec], RBX ; inserted
  LEA RBX, [_ITM_registerTMCloneTable wrt ..plt]
  MOV RAX, RBX
  MOV RBX, qword [Ltemp_storage_foxdec] ; inserted
  TEST RAX, RAX
  JE L11a0_2    ; 0x1158 --> L11a0_2

; Entry 11a0; block 3; address 1150
L11a0_3:
  ; Resolved indirection: RAX --> _ITM_registerTMCloneTable
  JMP _ITM_registerTMCloneTable wrt ..plt

; Entry 11a0; block 2; address 1158
L11a0_2:
  RET

; Entry 11a0; block 0; address 11a0
frame_dummy:
  LEA RDI, [RELA_.bss_0x4050(0x0)]    ; 0x4050 --> L_.bss_0x4050
  LEA RSI, [RELA_.bss_0x4050(0x0)]    ; 0x4050 --> L_.bss_0x4050
  SUB RSI, RDI
  MOV RAX, RSI
  SHR RSI, 0x3f
  SAR RAX, 0x3
  ADD RSI, RAX
  SAR RSI, 0x1
  JE L11a0_2    ; 0x1158 --> L11a0_2
  JMP L11a0_1 ; jump is inserted




; --------------
; Function: main
; --------------
; Entry 11b0; block 0; address 11b0
main:
  PUSH RBP
  MOV RBP, RSP
  SUB RSP, 0x430
  MOV dword [RBP - 0x4], 0x0
  MOV dword [RBP - 0x8], EDI
  MOV qword [RBP - 0x10], RSI
  MOV dword [RBP - 0x14], 0x0
  MOV dword [RBP - 0x18], 0x0
  CMP dword [RBP - 0x8], 0x2
  JE L11b0_2    ; 0x1202 --> L11b0_2

; Entry 11b0; block 1; address 11e1
L11b0_1:
  MOV RAX, qword [RBP - 0x10]
  MOV RSI, qword [RAX]
  LEA RDI, [RELA_.rodata_0x2000(0x4)]    ; 0x2004 --> L_.rodata_0x2000 + 0x4
  MOV AL, 0x0
  CALL printf wrt ..plt

; Entry 11b0; block 3; address 11f6
L11b0_3:
  MOV dword [RBP - 0x4], 0x1
  JMP L11b0_9    ; 0x1378 --> L11b0_9

; Entry 11b0; block 2; address 1202
L11b0_2:
  LEA RDI, [RBP - 0x420]
  MOV ESI, 0x30
  MOV EDX, 0x400
  CALL memset wrt ..plt

; Entry 11b0; block 4; address 1218
L11b0_4:
  MOV EDI, 0x2
  MOV ESI, 0x1
  XOR EDX, EDX
  CALL socket wrt ..plt

; Entry 11b0; block 5; address 1229
L11b0_5:
  MOV dword [RBP - 0x14], EAX
  CMP EAX, 0x0
  JGE L11b0_7    ; 0x124f --> L11b0_7

; Entry 11b0; block 6; address 1235
L11b0_6:
  LEA RDI, [RELA_.rodata_0x2000(0x21)]    ; 0x2021 --> L_.rodata_0x2000 + 0x21
  MOV AL, 0x0
  CALL printf wrt ..plt

; Entry 11b0; block 8; address 1243
L11b0_8:
  MOV dword [RBP - 0x4], 0x1
  JMP L11b0_9    ; 0x1378 --> L11b0_9

; Entry 11b0; block 7; address 124f
L11b0_7:
  LEA RDI, [RBP - 0x430]
  MOV ESI, 0x30
  MOV EDX, 0x10
  CALL memset wrt ..plt

; Entry 11b0; block 10; address 1265
L11b0_10:
  MOV word [RBP - 0x430], 0x2
  MOV EDI, 0x1388
  CALL htons wrt ..plt

; Entry 11b0; block 11; address 1278
L11b0_11:
  MOV word [RBP - 0x42e], AX
  MOV RAX, qword [RBP - 0x10]
  MOV RSI, qword [RAX + 0x8]
  LEA RDX, [RBP - 0x430]
  ADD RDX, 0x4
  MOV EDI, 0x2
  CALL inet_pton wrt ..plt

; Entry 11b0; block 12; address 129c
L11b0_12:
  CMP EAX, 0x0
  JG L11b0_14    ; 0x12bf --> L11b0_14

; Entry 11b0; block 13; address 12a5
L11b0_13:
  LEA RDI, [RELA_.rodata_0x2000(0x45)]    ; 0x2045 --> L_.rodata_0x2000 + 0x45
  MOV AL, 0x0
  CALL printf wrt ..plt

; Entry 11b0; block 15; address 12b3
L11b0_15:
  MOV dword [RBP - 0x4], 0x1
  JMP L11b0_9    ; 0x1378 --> L11b0_9

; Entry 11b0; block 14; address 12bf
L11b0_14:
  MOV EDI, dword [RBP - 0x14]
  LEA RSI, [RBP - 0x430]
  MOV EDX, 0x10
  CALL connect wrt ..plt

; Entry 11b0; block 16; address 12d3
L11b0_16:
  CMP EAX, 0x0
  JGE L11b0_18    ; 0x12f6 --> L11b0_18

; Entry 11b0; block 17; address 12dc
L11b0_17:
  LEA RDI, [RELA_.rodata_0x2000(0x60)]    ; 0x2060 --> L_.rodata_0x2000 + 0x60
  MOV AL, 0x0
  CALL printf wrt ..plt

; Entry 11b0; block 19; address 12ea
L11b0_19:
  MOV dword [RBP - 0x4], 0x1
  JMP L11b0_9    ; 0x1378 --> L11b0_9

; Entry 11b0; block 18; address 12f6
L11b0_18:
  JMP L11b0_26    ; 0x12fb --> L11b0_26

; Entry 11b0; block 26; address 12fb
L11b0_26:
  MOV EDI, dword [RBP - 0x14]
  LEA RSI, [RBP - 0x420]
  MOV EDX, 0x3ff
  CALL read wrt ..plt

; Entry 11b0; block 20; address 130f
L11b0_20:
  MOV dword [RBP - 0x18], EAX
  CMP EAX, 0x0
  JLE L11b0_22    ; 0x1359 --> L11b0_22

; Entry 11b0; block 21; address 131b
L11b0_21:
  MOVSXD RAX, dword [RBP - 0x18]
  MOV byte [RBP + RAX - 0x420], 0x0
  LEA RDI, [RBP - 0x420]
  MOV RAX, qword [stdout]
  MOV RSI, qword [RAX]
  CALL fputs wrt ..plt

; Entry 11b0; block 23; address 133d
L11b0_23:
  CMP EAX, 0xffffffff
  JNE L11b0_25    ; 0x1354 --> L11b0_25

; Entry 11b0; block 24; address 1346
L11b0_24:
  LEA RDI, [RELA_.rodata_0x2000(0x7b)]    ; 0x207b --> L_.rodata_0x2000 + 0x7b
  MOV AL, 0x0
  CALL printf wrt ..plt

; Entry 11b0; block 25; address 1354
L11b0_25:
  JMP L11b0_26    ; 0x12fb --> L11b0_26

; Entry 11b0; block 22; address 1359
L11b0_22:
  CMP dword [RBP - 0x18], 0x0
  JGE L11b0_28    ; 0x1371 --> L11b0_28

; Entry 11b0; block 27; address 1363
L11b0_27:
  LEA RDI, [RELA_.rodata_0x2000(0x92)]    ; 0x2092 --> L_.rodata_0x2000 + 0x92
  MOV AL, 0x0
  CALL printf wrt ..plt

; Entry 11b0; block 28; address 1371
L11b0_28:
  MOV dword [RBP - 0x4], 0x0

; Entry 11b0; block 9; address 1378
L11b0_9:
  MOV EAX, dword [RBP - 0x4]
  ADD RSP, 0x430
  POP RBP
  RET




section .rodata align=4
L_.rodata_0x2000:
db 01h
db 00h
db 02h
db 00h
db `\n Usage: %s <ip of server> \n`, 0
db `\n Error : Could not create socket \n`, 0
db `\n inet_pton error occured\n`, 0
db `\n Error : Connect Failed \n`, 0
db `\n Error : Fputs error\n`, 0
db `\n Read error \n`, 0
L_.rodata_END:


section .init_array align=8
L_.init_array_0x3dc8:
L_reloc_0x3dc8_0x11a0:
dq frame_dummy    ; 0x11a0 --> frame_dummy
L_.init_array_END:


section .fini_array align=8
L_.fini_array_0x3dd0:
L_reloc_0x3dd0_0x1160:
dq __do_global_dtors_aux    ; 0x1160 --> __do_global_dtors_aux
L_.fini_array_END:





section .data align=8
L_.data_0x4040:
db 00h
db 00h
db 00h
db 00h
db 00h
db 00h
db 00h
db 00h
__dso_handle:
dq __dso_handle    ; 0x4048 --> __dso_handle
L_.data_END:





section .bss align=1
L_.bss_0x4050:
resb 8
L_.bss_END:











section .bss
Ltemp_storage_foxdec:
resb 8


; TEMP_OBJECTs are memory locations inserted by FoxDec not present in the original binary
; EXT_OBJECTs are external objects such as stderr and stdout
; The remainder is a mapping from original addresses to internal labels
%ifdef COMMENT
TEMP_OBJECT Ltemp_storage_foxdec
EXT_OBJECT stdout
0x1030: L1030_0
0x1040: L1040_0
0x1050: L1050_0
0x1060: L1060_0
0x1070: L1070_0
0x1080: L1080_0
0x1090: L1090_0
0x10a0: L10a0_0
0x10b0: L10b0_0
0x10c0: _start
0x10e5: L10c0_1
0x10f0: deregister_tm_clones
0x1103: L10f0_1
0x1118: L10f0_2
0x110f: L10f0_3
0x1160: __do_global_dtors_aux
0x116d: L1160_1
0x1198: L1160_2
0x117b: L1160_3
0x1187: L1160_4
0x118c: L1160_5
0x11a0: frame_dummy
0x1144: L11a0_1
0x1158: L11a0_2
0x1150: L11a0_3
0x11b0: main
0x11e1: L11b0_1
0x1202: L11b0_2
0x11f6: L11b0_3
0x1218: L11b0_4
0x1229: L11b0_5
0x1235: L11b0_6
0x124f: L11b0_7
0x1243: L11b0_8
0x1378: L11b0_9
0x1265: L11b0_10
0x1278: L11b0_11
0x129c: L11b0_12
0x12a5: L11b0_13
0x12bf: L11b0_14
0x12b3: L11b0_15
0x12d3: L11b0_16
0x12dc: L11b0_17
0x12f6: L11b0_18
0x12ea: L11b0_19
0x130f: L11b0_20
0x131b: L11b0_21
0x1359: L11b0_22
0x133d: L11b0_23
0x1346: L11b0_24
0x1354: L11b0_25
0x12fb: L11b0_26
0x1363: L11b0_27
0x1371: L11b0_28
0x4050: L_.bss_0x4050
0x4048: __dso_handle
0x2004: L_.rodata_0x2000 + 0x4
0x2021: L_.rodata_0x2000 + 0x21
0x2045: L_.rodata_0x2000 + 0x45
0x2060: L_.rodata_0x2000 + 0x60
0x207b: L_.rodata_0x2000 + 0x7b
0x2092: L_.rodata_0x2000 + 0x92
%endif