     1                                 %line 1+1 listsummation.asm
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
    26 00000000 010000000200000003-     myList dd 1,2,3,4,5,100,920,85
    27 00000000 000000040000000500-
    28 00000000 000064000000980300-
    29 00000000 0055000000         
    30 00000020 08000000                myListLen dd 8
    31 00000024 00000000                sum dd 0
    32                                 
    33                                 [section .text]
    34                                 [global _start]
    35                                 _start:
    36                                 
    37                                 
    38                                 
    39                                 
    40                                 
    41                                 
    42                                 
    43                                 
    44 00000000 8B0C25[00000000]        mov ecx, dword [myListLen]
    45 00000007 41B900000000            mov r9d, 0
    46 0000000D 48C7C600000000          mov rsi, 0
    47                                 
    48                                  sumLoop:
    49 00000014 448B0CB5[00000000]      mov r9d, dword [myList+(rsi*4)]
    50 0000001C 44010C25[00000000]      add dword [sum], r9d
    51 00000024 48FFC6                  inc rsi
    52 00000027 E2E9                    loop sumLoop
    53                                 
    54                                 done:
    55 00000029 48C7C03C000000          mov rax, SYS_exit
    56 00000030 48C7C700000000          mov rdi, EXIT_SUCCESS
    57 00000037 0F05                    syscall
    58                                 
    59                                 
    60                                 
    61                                 
    62                                 
    63                                 
    64                                 
    65                                 
    66                                 
    67                                 
    68                                 
    69                                 
    70                                 
    71                                 
    72                                 
    73                                 
    74                                 
    75                                 
