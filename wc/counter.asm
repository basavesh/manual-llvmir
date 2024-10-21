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
; BASH - why was this label created??
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
