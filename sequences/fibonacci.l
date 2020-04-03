     1                                 %line 1+1 fibonacci.asm
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
    26 00000000 0F000000                n dd 15
    27 00000004 00000000<rept>          fibList times 15 dd 0
    28                                 
    29                                 [section .text]
    30                                 [global _start]
    31                                 _start:
    32                                 
    33 00000000 48C7C1[00000000]        mov rcx, n
    34 00000007 48C7C602000000          mov rsi, 2
    35 0000000E B800000000              mov eax, 0
    36 00000013 41B900000000            mov r9d, 0
    37 00000019 41BA01000000            mov r10d, 1
    38                                 
    39 0000001F 44890C25[00000000]      mov dword [fibList+(0*4)], r9d
    40 00000027 44891425[04000000]      mov dword [fibList+(1*4)], r10d
    41                                 
    42                                  fibLoop:
    43 0000002F 4489C8                  mov eax, r9d
    44 00000032 4401D0                  add eax, r10d
    45 00000035 4589D1                  mov r9d, r10d
    46 00000038 4189C2                  mov r10d, eax
    47 0000003B 8904B5[00000000]        mov dword [fibList+(rsi*4)], eax
    48 00000042 48FFC6                  inc rsi
    49 00000045 E2E6                    loop fibLoop
    50                                 
    51                                 
    52                                 done:
    53 00000047 48C7C03C000000          mov rax, SYS_exit
    54 0000004E 48C7C700000000          mov rdi, EXIT_SUCCESS
    55 00000055 0F05                    syscall
    56                                 
