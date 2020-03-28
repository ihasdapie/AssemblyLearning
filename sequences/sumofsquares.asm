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

	n dd 10
	sum dq 0

section .text
global _start
_start:
	; sum([x^2 for x in range(n)])
	mov r10, 1 ;counter
	mov ecx, dword [n] ;ebx for n iter
	
	sumLoop:
		mov rax, r10 ;nth number
		mul rax ;square nth number		
		add qword [sum], rax
		inc r10
		loop sumLoop
		
		
done:
	mov rax, SYS_exit
	mov rdi, EXIT_SUCCESS
	syscall
