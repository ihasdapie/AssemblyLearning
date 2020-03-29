     1                                 %line 1+1 bubblesort.asm
     2                                 [section .data]
     3                                 
     4                                  LF equ 10
     5                                  NULL equ 0
     6                                  TRUE equ 1
     7                                  FALSE equ 0
     8                                 
     9                                  EXIT_SUCCESS equ 0
    10                                 
    11                                  STDIN equ 0
    12                                  STDOUT equ 1
    13                                  STDERR equ 2
    14                                 
    15                                  SYS_read equ 0
    16                                  SYS_write equ 1
    17                                  SYS_open equ 2
    18                                  SYS_close equ 3
    19                                  SYS_fork equ 57
    20                                  SYS_exit equ 60
    21                                  SYS_create equ 85
    22                                  SYS_time equ 201
    23                                 
    24                                 
    25                                 
    26 00000000 B60300000600000003-     myList dd 950,6,3,1,5,100,920,3
    27 00000000 000000010000000500-
    28 00000000 000064000000980300-
    29 00000000 0003000000         
    30 00000020 08000000                myListLen dd 8
    31 00000024 00000000                sum dd 0
    32                                 
    33                                 
    34                                 
    35                                 
    36                                 
    37                                 
    38                                 [section .text]
    39                                 [global _start]
    40                                 _start:
    41                                 
    42 00000000 49C7C300000000          mov r11, 0
    43 00000007 49C7C400000000          mov r12, 0
    44 0000000E B800000000              mov eax, 0
    45                                 
    46                                  bubbleOutLoop:
    47 00000013 49FFC3                  inc r11
    48 00000016 4981FB[00000000]        cmp r11, myListLen
    49 0000001D 7D3D                    jge outDone
    50                                 
    51                                  bubbleInLoop:
    52 0000001F 49FFC4                  inc r12
    53 00000022 4981FC[00000000]        cmp r12, myListLen
    54 00000029 7D26                    jge inDone
    55                                 
    56 0000002B 428B049D[00000000]      mov eax, [myList+(r11*4)]
    57 00000033 428B1CA5[00000000]      mov ebx, [myList+(r12*4)]
    58                                 
    59 0000003B 39D8                    cmp eax, ebx
    60 0000003D 7D10                    jge bubbleInLoopSkipElse
    61                                 
    62                                  bubbleInLoopElse:
    63 0000003F 42891C9D[00000000]      mov [myList+(r11*4)], ebx
    64 00000047 428904A5[00000000]      mov [myList+(r12*4)], eax
    65 0000004F EBCC                    jmp bubbleInLoop
    66                                 
    67                                  bubbleInLoopSkipElse:
    68 00000051 EBCA                    jmp bubbleInLoop
    69                                 
    70                                  inDone:
    71 00000053 49C7C400000000          mov r12, 0
    72 0000005A EBB5                    jmp bubbleOutLoop
    73                                 
    74 0000005C EBB3                    jmp bubbleOutLoop
    75                                 
    76                                  outDone:
    77 0000005E EBFE                    jmp done
    78                                 
    79                                 done:
    80 00000060 48C7C03C000000          mov rax, SYS_exit
    81 00000067 48C7C700000000          mov rdi, EXIT_SUCCESS
    82 0000006E 0F05                    syscall
    83                                 
    84                                 
    85                                 
    86                                 
    87                                 
    88                                 
