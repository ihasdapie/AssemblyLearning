section .data
; standard constants
	LF equ 10
	NULL equ 0
	TRUE equ 1
	FALSE equ 0

	EXIT_SUCCESS equ 0
	
	STDIN equ 0
	STDOUT equ 1 
	STDERR equ 2 

	SYS_read equ 0
	SYS_write equ 1
	SYS_open equ 2
	SYS_close equ 3
	SYS_fork equ 57
	SYS_exit equ 60
	SYS_create equ 85
	SYS_time equ 201

; program data

	n dd 15
	fibList times 15 dd 0

section .text
global _start
_start:

	mov rcx, n ; rcx = counter
	mov rsi, 2 ; index
	mov eax, 0 ;current fib
	mov r9d, 0; ind = 0
	mov r10d, 1; ind = 1
	
	mov dword [fibList+(0*4)], r9d
	mov dword [fibList+(1*4)], r10d

	fibLoop:
		mov eax, r9d
		add eax, r10d ;fib = a + b
		mov r9d, r10d
		mov r10d, eax
		mov dword [fibList+(rsi*4)], eax
		inc rsi
		loop fibLoop


done:
	mov rax, SYS_exit
	mov rdi, EXIT_SUCCESS
	syscall

