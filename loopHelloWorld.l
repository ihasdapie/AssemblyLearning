     1                                 %line 1+1 loopHelloWorld.asm
     2                                 [section .data]
     3                                 
     4                                 
     5                                 LF equ 10
     6                                 NULL equ 0
     7                                 TRUE equ 1
     8                                 FALSE equ 0
     9                                 
    10                                 EXIT_SUCCESS equ 0
    11                                 STDIN equ 0
    12                                 STDOUT equ 1
    13                                 STDERR equ 2
    14                                 
    15                                 SYS_read equ 0
    16                                 SYS_write equ 1
    17                                 SYS_open equ 2
    18                                 SYS_close equ 3
    19                                 SYS_fork equ 57
    20                                 SYS_exit equ 60
    21                                 SYS_creat equ 85
    22                                 SYS_time equ 201
    23                                 
    24                                 
    25                                 
    26 00000000 48656C6C6F20576F72-    hworld db "Hello World", LF, NULL
    27 00000000 6C640A00           
    28 0000000D 0A00                   newLine db LF, NULL
    29                                 
    30 0000000F 0A                     numIter db 10
    31                                 
    32                                 
    33                                 [section .text]
    34                                 [global _start]
    35                                 _start:
    36                                 
    37 00000000 4150                    push r8
    38 00000002 49C7C000000000          mov r8, 0
    39                                  printLoop:
    40 00000009 4981F8[00000000]        cmp r8, numIter
    41 00000010 741B                    je done
    42 00000012 49FFC0                  inc r8
    43                                 
    44 00000015 48C7C7[00000000]        mov rdi, hworld
    45 0000001C E81B000000              call printString
    46 00000021 48C7C7[00000000]        mov rdi, newLine
    47 00000028 E80F000000              call printString
    48 0000002D EBD8                    jmp printLoop
    49                                 done:
    50 0000002F 4158                    pop r8
    51 00000031 48C7C03C000000          mov rax, SYS_exit
    52 00000038 48C7C700000000          mov rdi, EXIT_SUCCESS
    53 0000003F 0F05                    syscall
    54                                 
    55                                 
    56                                 
    57                                 
    58                                 
    59                                 [global printString]
    60                                 printString:
    61 00000041 53                      push rbx
    62                                 
    63                                 
    64 00000042 4889FB                  mov rbx, rdi
    65 00000045 48C7C200000000          mov rdx, 0
    66                                 
    67                                  charCountLoop:
    68 0000004C 803B00                  cmp byte [rbx], NULL
    69 0000004F 7406                    je charCountDone
    70 00000051 48FFC2                  inc rdx
    71 00000054 48FFC3                  inc rbx
    72 00000057 EBF1                    jmp charCountLoop
    73                                 
    74                                  charCountDone:
    75 00000059 4883FA00                cmp rdx, 0
    76 0000005D 7411                    je funcDone
    77                                 
    78                                 
    79                                 
    80 0000005F 48C7C001000000          mov rax, SYS_write
    81 00000066 4889FE                  mov rsi, rdi
    82 00000069 48C7C701000000          mov rdi, STDOUT
    83 00000070 0F05                    syscall
    84                                 
    85                                  funcDone:
    86 00000072 5B                      pop rbx
    87 00000073 C3                      ret
    88                                 
    89                                 
    90                                 
    91                                 
    92                                 
    93                                 
    94                                 
    95                                 
    96                                 
