
section .data

; standard constants
LF equ 10
NULL equ 0
TRUE equ 1
FALSE equ 0

EXIT_SUCCESS equ 0
STDIN equ 0 ;standard input
STDOUT equ 1 ; standard output
STDERR equ 2 ; standard error

SYS_read equ 0
SYS_write equ 1
SYS_open equ 2
SYS_close equ 3
SYS_fork equ 57
SYS_exit equ 60
SYS_creat equ 85
SYS_time equ 201




section .text

global printString
printString:
	push rbx

; count characters in string
	mov rbx, rdi
	mov rdx, 0
	
	charCountLoop:
		cmp byte [rbx], NULL ; compare chars along string until NULL 
		je charCountDone ; if string[x] == NULL, jump to end
		inc rdx ; increment count
		inc rbx ; advance pointer
		jmp charCountLoop ; jump back to start of loop
		
	charCountDone:
		cmp rdx, 0 ; if 
		je funcDone
		
		; use os to output string
		
		mov rax, SYS_write
		mov rsi, rdi ; address of chars to write
		mov rdi, STDOUT
		syscall
		
	funcDone:
		pop rbx
		ret
		
global printInt
printInt:
