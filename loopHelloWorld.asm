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

; some strings

hworld db "Hello World", LF, NULL
newLine db LF, NULL ; 10 = line finish, (newline), 0 = null 

numIter db 10 ;number of times to display hworld


section .text
global _start
_start:
	
	push r8
	mov r8, 0
	printLoop:	
		cmp r8, numIter
		je done
		inc r8
		
		mov rdi, hworld
		call printString
		mov rdi, newLine
		call printString
		jmp printLoop
done:
	pop r8
	mov rax, SYS_exit
	mov rdi, EXIT_SUCCESS
	syscall


; generic printstring function

;address of message is in rdi 
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
		








