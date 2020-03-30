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
    26 00000000 010000000400000002-     myList dd 1,4,2,3
    27 00000000 00000003000000     
    28 00000010 04000000                myListLen dd 4
    29                                 
    30                                 
    31                                 
    32                                 
    33                                 
    34                                 
    35                                 [section .text]
    36                                 [global _start]
    37                                 _start:
    38                                 
    39 00000000 49C7C3FFFFFFFF          mov r11, -1
    40 00000007 49C7C4FFFFFFFF          mov r12, -1
    41 0000000E B800000000              mov eax, 0
    42                                 
    43                                  bubbleOutLoop:
    44 00000013 49FFC3                  inc r11
    45 00000016 4981FB[00000000]        cmp r11, myListLen
    46 0000001D 7D3D                    jge outDone
    47                                 
    48                                  bubbleInLoop:
    49 0000001F 49FFC4                  inc r12
    50 00000022 4981FC[00000000]        cmp r12, myListLen
    51 00000029 7D26                    jge inDone
    52                                 
    53 0000002B 428B049D[00000000]      mov eax, [myList+(r11*4)]
    54 00000033 428B1CA5[00000000]      mov ebx, [myList+(r12*4)]
    55                                 
    56 0000003B 39D8                    cmp eax, ebx
    57 0000003D 7D10                    jge bubbleInLoopSkipElse
    58                                 
    59                                  bubbleInLoopElse:
    60 0000003F 42891C9D[00000000]      mov [myList+(r11*4)], ebx
    61 00000047 428904A5[00000000]      mov [myList+(r12*4)], eax
    62 0000004F EBCC                    jmp bubbleInLoop
    63                                 
    64                                  bubbleInLoopSkipElse:
    65 00000051 EBCA                    jmp bubbleInLoop
    66                                 
    67                                  inDone:
    68 00000053 49C7C400000000          mov r12, 0
    69 0000005A EBB5                    jmp bubbleOutLoop
    70                                 
    71 0000005C EBB3                    jmp bubbleOutLoop
    72                                 
    73                                  outDone:
    74 0000005E EBFE                    jmp done
    75                                 
    76                                 done:
    77 00000060 48C7C03C000000          mov rax, SYS_exit
    78 00000067 48C7C700000000          mov rdi, EXIT_SUCCESS
    79 0000006E 0F05                    syscall
    80                                 
    81                                 
    82                                 
    83                                 
    84                                 
    85                                 
