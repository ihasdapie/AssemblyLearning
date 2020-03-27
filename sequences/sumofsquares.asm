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
	nsq dd 0
	sum dd 0


section .text
global _start
_start:
	; sum([x^2 for x in range(n)])
	mov ecx, 1 ;counter
	mov ebx, dword [n] ;ebx for n iter
	
	sumLoop:
		mov eax, ecx ;nth number
		mul eax ;square nth number
		mov [nsq], eax
		mov [nsq+4], edx ;store n**2 in nsq
		
		; add nsq to sum, store in sum
		mov r8d, dword [nsq]
		add r8d, dword [sum]
		mov dword [sum], r8d  
		
		inc ecx ;increment ecx
		cmp ecx,  ebx
		je sumLoopDone
		
	sumLoopDone:
		mov rax, SYS_exit
		mov rdi, EXIT_SUCCESS
		syscall
