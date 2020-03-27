     1                                 %line 1+1 sumofsquares.asm
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
    26 00000000 0A000000                n dd 10
    27 00000004 00000000                nsq dd 0
    28 00000008 00000000                sum dd 0
    29                                 
    30                                 
    31                                 [section .text]
    32                                 [global _start]
    33                                 _start:
    34                                 
    35 00000000 B901000000              mov ecx, 1
    36 00000005 8B1C25[00000000]        mov ebx, dword [n]
    37                                 
    38                                  sumLoop:
    39 0000000C 89C8                    mov eax, ecx
    40 0000000E F7E0                    mul eax
    41 00000010 890425[00000000]        mov [nsq], eax
    42 00000017 891425[04000000]        mov [nsq+4], edx
    43                                 
    44                                 
    45 0000001E 448B0425[00000000]      mov r8d, dword [nsq]
    46 00000026 44030425[00000000]      add r8d, dword [sum]
    47 0000002E 44890425[00000000]      mov dword [sum], r8d
    48                                 
    49 00000036 FFC1                    inc ecx
    50 00000038 39D9                    cmp ecx, ebx
    51 0000003A 74FE                    je sumLoopDone
    52                                 
    53                                  sumLoopDone:
    54 0000003C 48C7C03C000000          mov rax, SYS_exit
    55 00000043 48C7C700000000          mov rdi, EXIT_SUCCESS
    56 0000004A 0F05                    syscall
