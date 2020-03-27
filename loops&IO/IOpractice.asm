; takes user input and prints it out

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

; other data 

inputLength equ 50
prompt db "Input: ", NULL
newLine db LF, NULL

section .bss

chr resb 1
inputLine resb inputLength+2

section .text

global _start
_start:

	;display prompt
	mov rdi, prompt
	call printString

	; read user input
	mov rbx, inputLine ;rbx = &inLine
	mov r12, 0

	readChar:
		mov rax, SYS_read ; system code for read
		mov rdi, STDIN ;standard input
		lea rdi, byte [chr] ;load address of current chracter to rdi (load effective address)
		mov rdx, 1 ; how many to read
		syscall 
		
		mov al, byte [chr] ; mov current chracter to a1 (note that this loads the value, not addr (lea vs mov)
		cmp al, LF ; if newLine, done
		je readDone
		
		inc r12 ;count ++
		cmp r12, inputLength
		jae readChar
		
		mov byte [rbx], al ; inputLine[i] = chr
		inc rbx ; shift to next byte
		
		jmp readChar
			
	readDone:
		mov byte [rbx], NULL ; null-terminate c-string
		
		
	mov rdi, inputLine
	call printString

done:
	mov rax, SYS_exit
	mov rdi, EXIT_SUCCESS
	syscall


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
		
