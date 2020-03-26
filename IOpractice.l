     1                                 %line 1+1 IOpractice.asm
     2                                 
     3                                 
     4                                 [section .data]
     5                                 
     6                                 
     7                                 LF equ 10
     8                                 NULL equ 0
     9                                 TRUE equ 1
    10                                 FALSE equ 0
    11                                 
    12                                 EXIT_SUCCESS equ 0
    13                                 STDIN equ 0
    14                                 STDOUT equ 1
    15                                 STDERR equ 2
    16                                 
    17                                 SYS_read equ 0
    18                                 SYS_write equ 1
    19                                 SYS_open equ 2
    20                                 SYS_close equ 3
    21                                 SYS_fork equ 57
    22                                 SYS_exit equ 60
    23                                 SYS_creat equ 85
    24                                 SYS_time equ 201
    25                                 
    26                                 
    27                                 
    28                                 inputLength equ 50
    29 00000000 496E7075743A2000       prompt db "Input: ", NULL
    30 00000008 0A00                   newLine db LF, NULL
    31                                 
    32                                 [section .bss]
    33                                 
    34 00000000 <gap>                  chr resb 1
    35 00000001 <gap>                  inputLine resb inputLength+2
    36                                 
    37                                 [section .text]
    38                                 
    39                                 [global _start]
    40                                 _start:
    41                                 
    42                                 
    43 00000000 48C7C7[00000000]        mov rdi, prompt
    44 00000007 E862000000              call printString
    45                                 
    46                                 
    47 0000000C 48C7C3[00000000]        mov rbx, inputLine
    48 00000013 49C7C400000000          mov r12, 0
    49                                 
    50                                  readChar:
    51 0000001A 48C7C000000000          mov rax, SYS_read
    52 00000021 48C7C700000000          mov rdi, STDIN
    53 00000028 488D3C25[00000000]      lea rdi, byte [chr]
    54 00000030 48C7C201000000          mov rdx, 1
    55 00000037 0F05                    syscall
    56                                 
    57 00000039 8A0425[00000000]        mov al, byte [chr]
    58 00000040 3C0A                    cmp al, LF
    59 00000042 740E                    je readDone
    60                                 
    61 00000044 49FFC4                  inc r12
    62 00000047 4983FC32                cmp r12, inputLength
    63 0000004B 73CB                    jae readChar
    64                                 
    65 0000004D 8803                    mov byte [rbx], al
    66 0000004F 48FFC3                  inc rbx
    67                                 
    68 00000052 EBC4                    jmp readChar
    69                                 
    70                                  readDone:
    71 00000054 C60300                  mov byte [rbx], NULL
    72                                 
    73                                 
    74 00000057 48C7C7[00000000]        mov rdi, inputLine
    75 0000005E E80B000000              call printString
    76                                 
    77                                 done:
    78 00000063 48C7C03C000000          mov rax, SYS_exit
    79 0000006A 48C7C700000000          mov rdi, EXIT_SUCCESS
    80 00000071 0F05                    syscall
    81                                 
    82                                 
    83                                 
    84                                 
    85                                 
    86                                 
    87                                 
    88                                 
    89                                 
    90                                 
    91                                 
    92                                 
    93                                 
    94                                 
    95                                 
    96                                 
    97                                 [global printString]
    98                                 printString:
    99 00000073 53                      push rbx
   100                                 
   101                                 
   102 00000074 4889FB                  mov rbx, rdi
   103 00000077 48C7C200000000          mov rdx, 0
   104                                 
   105                                  charCountLoop:
   106 0000007E 803B00                  cmp byte [rbx], NULL
   107 00000081 7406                    je charCountDone
   108 00000083 48FFC2                  inc rdx
   109 00000086 48FFC3                  inc rbx
   110 00000089 EBF1                    jmp charCountLoop
   111                                 
   112                                  charCountDone:
   113 0000008B 4883FA00                cmp rdx, 0
   114 0000008F 7411                    je funcDone
   115                                 
   116                                 
   117                                 
   118 00000091 48C7C001000000          mov rax, SYS_write
   119 00000098 4889FE                  mov rsi, rdi
   120 0000009B 48C7C701000000          mov rdi, STDOUT
   121 000000A2 0F05                    syscall
   122                                 
   123                                  funcDone:
   124 000000A4 5B                      pop rbx
   125 000000A5 C3                      ret
   126                                 
