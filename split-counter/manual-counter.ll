



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
