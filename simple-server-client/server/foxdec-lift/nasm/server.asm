extern _ITM_deregisterTMCloneTable
extern _ITM_registerTMCloneTable
extern __cxa_finalize
extern __gmon_start__
extern __libc_start_main
extern accept
extern bind
extern close
extern ctime
extern exit
extern htonl
extern htons
extern listen
extern memset
extern sleep
extern snprintf
extern socket
extern strlen
extern time
extern write


global _start


default rel


%define RELA_.rodata_0x2000(offset) (L_.rodata_0x2000 + offset)
%define RELA_.init_array_0x3dd0(offset) (L_.init_array_0x3dd0 + offset)
%define RELA_.fini_array_0x3dd8(offset) (L_.fini_array_0x3dd8 + offset)
%define RELA_.data_0x4070(offset) (L_.data_0x4070 + offset)
%define RELA_.bss_0x4080(offset) (L_.bss_0x4080 + offset)

%define __GNU_EH_FRAME_HDR RELA_.rodata_0x2000(0xc)
%define _end RELA_.bss_0x4080(0x8)


; -----------------
; Function: L1030_0
; -----------------
; Entry 1030; block 0; address 1030
L1030_0:
  JMP write wrt ..plt




; -----------------
; Function: L1040_0
; -----------------
; Entry 1040; block 0; address 1040
L1040_0:
  JMP ctime wrt ..plt




; -----------------
; Function: L1050_0
; -----------------
; Entry 1050; block 0; address 1050
L1050_0:
  JMP strlen wrt ..plt




; -----------------
; Function: L1060_0
; -----------------
; Entry 1060; block 0; address 1060
L1060_0:
  JMP htons wrt ..plt




; -----------------
; Function: L1070_0
; -----------------
; Entry 1070; block 0; address 1070
L1070_0:
  JMP snprintf wrt ..plt




; -----------------
; Function: L1080_0
; -----------------
; Entry 1080; block 0; address 1080
L1080_0:
  JMP htonl wrt ..plt




; -----------------
; Function: L1090_0
; -----------------
; Entry 1090; block 0; address 1090
L1090_0:
  JMP memset wrt ..plt




; -----------------
; Function: L10a0_0
; -----------------
; Entry 10a0; block 0; address 10a0
L10a0_0:
  JMP close wrt ..plt




; -----------------
; Function: L10b0_0
; -----------------
; Entry 10b0; block 0; address 10b0
L10b0_0:
  JMP time wrt ..plt




; -----------------
; Function: L10c0_0
; -----------------
; Entry 10c0; block 0; address 10c0
L10c0_0:
  JMP listen wrt ..plt




; -----------------
; Function: L10d0_0
; -----------------
; Entry 10d0; block 0; address 10d0
L10d0_0:
  JMP bind wrt ..plt




; -----------------
; Function: L10e0_0
; -----------------
; Entry 10e0; block 0; address 10e0
L10e0_0:
  JMP accept wrt ..plt




; -----------------
; Function: L10f0_0
; -----------------
; Entry 10f0; block 0; address 10f0
L10f0_0:
  JMP sleep wrt ..plt




; -----------------
; Function: L1100_0
; -----------------
; Entry 1100; block 0; address 1100
L1100_0:
  JMP socket wrt ..plt




; -----------------
; Function: L1110_0
; -----------------
; Entry 1110; block 0; address 1110
L1110_0:
  JMP __cxa_finalize wrt ..plt




; ----------------
; Function: _start
; ----------------
; Entry 1120; block 0; address 1120
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
  LEA RDI, [main]    ; 0x1210 --> main
  CALL __libc_start_main wrt ..plt

; Entry 1120; block 1; address 1145
L1120_1:
  HLT




; ------------------------------
; Function: deregister_tm_clones
; ------------------------------
; Entry 1150; block 0; address 1150
deregister_tm_clones:
  LEA RDI, [RELA_.bss_0x4080(0x0)]    ; 0x4080 --> L_.bss_0x4080
  LEA RAX, [RELA_.bss_0x4080(0x0)]    ; 0x4080 --> L_.bss_0x4080
  CMP RAX, RDI
  JE L1150_2    ; 0x1178 --> L1150_2

; Entry 1150; block 1; address 1163
L1150_1:
  MOV qword [Ltemp_storage_foxdec], RBX ; inserted
  LEA RBX, [_ITM_deregisterTMCloneTable wrt ..plt]
  MOV RAX, RBX
  MOV RBX, qword [Ltemp_storage_foxdec] ; inserted
  TEST RAX, RAX
  JE L1150_2    ; 0x1178 --> L1150_2

; Entry 1150; block 3; address 116f
L1150_3:
  ; Resolved indirection: RAX --> _ITM_deregisterTMCloneTable
  JMP _ITM_deregisterTMCloneTable wrt ..plt

; Entry 1150; block 2; address 1178
L1150_2:
  RET




; -------------------------------
; Function: __do_global_dtors_aux
; -------------------------------
; Entry 11c0; block 0; address 11c0
__do_global_dtors_aux:
  CMP byte [RELA_.bss_0x4080(0x0)], 0x0    ; 0x4080 --> L_.bss_0x4080
  JNE L11c0_2    ; 0x11f8 --> L11c0_2

; Entry 11c0; block 1; address 11cd
L11c0_1:
  PUSH RBP
  MOV qword [Ltemp_storage_foxdec], RAX ; inserted
  LEA RAX, [__cxa_finalize wrt ..plt]
  CMP RAX, 0x0
  MOV RAX, qword [Ltemp_storage_foxdec] ; inserted
  MOV RBP, RSP
  JE L11c0_4    ; 0x11e7 --> L11c0_4

; Entry 11c0; block 3; address 11db
L11c0_3:
  MOV RDI, qword [__dso_handle]    ; 0x4078 --> __dso_handle
  CALL __cxa_finalize wrt ..plt

; Entry 11c0; block 4; address 11e7
L11c0_4:
  CALL deregister_tm_clones    ; 0x1150 --> deregister_tm_clones

; Entry 11c0; block 5; address 11ec
L11c0_5:
  MOV byte [RELA_.bss_0x4080(0x0)], 0x1    ; 0x4080 --> L_.bss_0x4080
  POP RBP
  RET

; Entry 11c0; block 2; address 11f8
L11c0_2:
  RET




; ---------------------
; Function: frame_dummy
; ---------------------
; Entry 1200; block 1; address 11a4
L1200_1:
  MOV qword [Ltemp_storage_foxdec], RBX ; inserted
  LEA RBX, [_ITM_registerTMCloneTable wrt ..plt]
  MOV RAX, RBX
  MOV RBX, qword [Ltemp_storage_foxdec] ; inserted
  TEST RAX, RAX
  JE L1200_2    ; 0x11b8 --> L1200_2

; Entry 1200; block 3; address 11b0
L1200_3:
  ; Resolved indirection: RAX --> _ITM_registerTMCloneTable
  JMP _ITM_registerTMCloneTable wrt ..plt

; Entry 1200; block 2; address 11b8
L1200_2:
  RET

; Entry 1200; block 0; address 1200
frame_dummy:
  LEA RDI, [RELA_.bss_0x4080(0x0)]    ; 0x4080 --> L_.bss_0x4080
  LEA RSI, [RELA_.bss_0x4080(0x0)]    ; 0x4080 --> L_.bss_0x4080
  SUB RSI, RDI
  MOV RAX, RSI
  SHR RSI, 0x3f
  SAR RAX, 0x3
  ADD RSI, RAX
  SAR RSI, 0x1
  JE L1200_2    ; 0x11b8 --> L1200_2
  JMP L1200_1 ; jump is inserted




; --------------
; Function: main
; --------------
; Entry 1210; block 0; address 1210
main:
  PUSH RBP
  MOV RBP, RSP
  SUB RSP, 0x450
  MOV dword [RBP - 0x4], 0x0
  MOV dword [RBP - 0x8], EDI
  MOV qword [RBP - 0x10], RSI
  MOV dword [RBP - 0x14], 0x0
  MOV dword [RBP - 0x18], 0x0
  MOV EDI, 0x2
  MOV ESI, 0x1
  XOR EDX, EDX
  CALL socket wrt ..plt

; Entry 1210; block 1; address 1248
L1210_1:
  MOV dword [RBP - 0x14], EAX
  LEA RDI, [RBP - 0x28]
  MOV ESI, 0x30
  MOV EDX, 0x10
  CALL memset wrt ..plt

; Entry 1210; block 2; address 125e
L1210_2:
  LEA RDI, [RBP - 0x430]
  MOV ESI, 0x30
  MOV EDX, 0x401
  CALL memset wrt ..plt

; Entry 1210; block 3; address 1274
L1210_3:
  MOV word [RBP - 0x28], 0x2
  XOR EDI, EDI
  CALL htonl wrt ..plt

; Entry 1210; block 4; address 1281
L1210_4:
  MOV dword [RBP - 0x24], EAX
  MOV EDI, 0x1388
  CALL htons wrt ..plt

; Entry 1210; block 5; address 128e
L1210_5:
  MOV word [RBP - 0x26], AX
  MOV EDI, dword [RBP - 0x14]
  LEA RSI, [RBP - 0x28]
  MOV EDX, 0x10
  CALL bind wrt ..plt

; Entry 1210; block 6; address 12a3
L1210_6:
  MOV EDI, dword [RBP - 0x14]
  MOV ESI, 0xa
  CALL listen wrt ..plt

; Entry 1210; block 7; address 12b0
L1210_7:
  MOV EDI, dword [RBP - 0x14]
  XOR EAX, EAX
  MOV EDX, EAX
  MOV RSI, RDX
  CALL accept wrt ..plt

; Entry 1210; block 8; address 12bf
L1210_8:
  MOV dword [RBP - 0x18], EAX
  XOR EAX, EAX
  MOV EDI, EAX
  CALL time wrt ..plt

; Entry 1210; block 9; address 12cb
L1210_9:
  MOV qword [RBP - 0x438], RAX
  LEA RAX, [RBP - 0x430]
  MOV qword [RBP - 0x450], RAX
  LEA RDI, [RBP - 0x438]
  CALL ctime wrt ..plt

; Entry 1210; block 10; address 12ec
L1210_10:
  MOV RDI, qword [RBP - 0x450]
  MOV RCX, RAX
  MOV ESI, 0x401
  LEA RDX, [RELA_.rodata_0x2000(0x4)]    ; 0x2004 --> L_.rodata_0x2000 + 0x4
  MOV AL, 0x0
  CALL snprintf wrt ..plt

; Entry 1210; block 11; address 1309
L1210_11:
  MOV EAX, dword [RBP - 0x18]
  MOV dword [RBP - 0x444], EAX
  LEA RAX, [RBP - 0x430]
  MOV qword [RBP - 0x440], RAX
  LEA RDI, [RBP - 0x430]
  CALL strlen wrt ..plt

; Entry 1210; block 12; address 132c
L1210_12:
  MOV EDI, dword [RBP - 0x444]
  MOV RSI, qword [RBP - 0x440]
  MOV RDX, RAX
  CALL write wrt ..plt

; Entry 1210; block 13; address 1341
L1210_13:
  MOV EDI, dword [RBP - 0x18]
  CALL close wrt ..plt

; Entry 1210; block 14; address 1349
L1210_14:
  MOV EDI, 0x1
  CALL sleep wrt ..plt

; Entry 1210; block 15; address 1353
L1210_15:
  JMP L1210_7    ; 0x12b0 --> L1210_7




section .rodata align=4
L_.rodata_0x2000:
db 01h
db 00h
db 02h
db 00h
db 025h
db 02eh
db 032h
db 034h
db 073h
db 0dh
db `\n`, 0
L_.rodata_END:


section .init_array align=8
L_.init_array_0x3dd0:
L_reloc_0x3dd0_0x1200:
dq frame_dummy    ; 0x1200 --> frame_dummy
L_.init_array_END:


section .fini_array align=8
L_.fini_array_0x3dd8:
L_reloc_0x3dd8_0x11c0:
dq __do_global_dtors_aux    ; 0x11c0 --> __do_global_dtors_aux
L_.fini_array_END:





section .data align=8
L_.data_0x4070:
db 00h
db 00h
db 00h
db 00h
db 00h
db 00h
db 00h
db 00h
__dso_handle:
dq __dso_handle    ; 0x4078 --> __dso_handle
L_.data_END:





section .bss align=1
L_.bss_0x4080:
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

0x1030: L1030_0
0x1040: L1040_0
0x1050: L1050_0
0x1060: L1060_0
0x1070: L1070_0
0x1080: L1080_0
0x1090: L1090_0
0x10a0: L10a0_0
0x10b0: L10b0_0
0x10c0: L10c0_0
0x10d0: L10d0_0
0x10e0: L10e0_0
0x10f0: L10f0_0
0x1100: L1100_0
0x1110: L1110_0
0x1120: _start
0x1145: L1120_1
0x1150: deregister_tm_clones
0x1163: L1150_1
0x1178: L1150_2
0x116f: L1150_3
0x11c0: __do_global_dtors_aux
0x11cd: L11c0_1
0x11f8: L11c0_2
0x11db: L11c0_3
0x11e7: L11c0_4
0x11ec: L11c0_5
0x1200: frame_dummy
0x11a4: L1200_1
0x11b8: L1200_2
0x11b0: L1200_3
0x1210: main
0x1248: L1210_1
0x125e: L1210_2
0x1274: L1210_3
0x1281: L1210_4
0x128e: L1210_5
0x12a3: L1210_6
0x12b0: L1210_7
0x12bf: L1210_8
0x12cb: L1210_9
0x12ec: L1210_10
0x1309: L1210_11
0x132c: L1210_12
0x1341: L1210_13
0x1349: L1210_14
0x1353: L1210_15
0x4080: L_.bss_0x4080
0x4078: __dso_handle
0x2004: L_.rodata_0x2000 + 0x4
%endif