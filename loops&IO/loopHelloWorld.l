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
    37                                 
    38                                 
    39                                 
    40                                 
    41                                 
    42                                 
    43                                 
    44                                 
    45                                 
    46                                 
    47                                 
    48                                 
    49                                 
    50                                 
    51                                 
    52                                 
    53                                 
    54                                  printLoop:
    55 00000000 488B0C25[00000000]      mov rcx, [numIter]
    56 00000008 48C7C7[00000000]        mov rdi, hworld
    57 0000000F E80D000000              call printString
    58 00000014 E2E8                    loop printLoop
    59                                 
    60                                 done:
    61                                 
    62 00000016 48C7C03C000000          mov rax, SYS_exit
    63 0000001D 48C7C700000000          mov rdi, EXIT_SUCCESS
    64 00000024 0F05                    syscall
    65                                 
    66                                 
    67                                 
    68                                 
    69                                 
    70                                 [global printString]
    71                                 printString:
    72 00000026 53                      push rbx
    73                                 
    74                                 
    75 00000027 4889FB                  mov rbx, rdi
    76 0000002A 48C7C200000000          mov rdx, 0
    77                                 
    78                                  charCountLoop:
    79 00000031 803B00                  cmp byte [rbx], NULL
    80 00000034 7406                    je charCountDone
    81 00000036 48FFC2                  inc rdx
    82 00000039 48FFC3                  inc rbx
    83 0000003C EBF1                    jmp charCountLoop
    84                                 
    85                                  charCountDone:
    86 0000003E 4883FA00                cmp rdx, 0
    87 00000042 7411                    je funcDone
    88                                 
    89                                 
    90                                 
    91 00000044 48C7C001000000          mov rax, SYS_write
    92 0000004B 4889FE                  mov rsi, rdi
    93 0000004E 48C7C701000000          mov rdi, STDOUT
    94 00000055 0F05                    syscall
    95                                 
    96                                  funcDone:
    97 00000057 5B                      pop rbx
    98 00000058 C3                      ret
    99                                 
   100                                 
   101                                 
   102                                 
   103                                 
   104                                 
   105                                 
   106                                 
   107                                 
