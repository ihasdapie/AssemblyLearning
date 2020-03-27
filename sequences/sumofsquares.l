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
    27 00000004 0000000000000000        sum dq 0
    28                                 
    29                                 [section .text]
    30                                 [global _start]
    31                                 _start:
    32                                 
    33 00000000 49C7C201000000          mov r10, 1
    34 00000007 8B0C25[00000000]        mov ecx, dword [n]
    35                                 
    36                                  sumLoop:
    37 0000000E 4C89D0                  mov rax, r10
    38 00000011 48F7E0                  mul rax
    39 00000014 48010425[00000000]      add qword [sum], rax
    40 0000001C 49FFC2                  inc r10
    41 0000001F E2EB                    loop sumLoop
    42                                 
    43                                 
    44                                  Done:
    45 00000021 48C7C03C000000          mov rax, SYS_exit
    46 00000028 48C7C700000000          mov rdi, EXIT_SUCCESS
    47 0000002F 0F05                    syscall
