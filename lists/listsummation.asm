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

; my variables
	
	myList dd 1,2,3,4,5,100,920,85
	myListLen dd 8
	sum dd 0

section .text
global _start
_start:

; process:
; for x in range(myListLen):
;		sum = sum + list[x]
; register to store current list value r9d
; register to store index at x rsi (counter)
; register for loop (ecx loop <>)
	
	mov ecx, dword [myListLen]
	mov r9d, 0 ;sum
	mov rsi, 0 ; counter
	
	sumLoop:
		mov r9d, dword [myList+(rsi*4)]; dword is 4 bytes
		add dword [sum], r9d
		inc rsi
		loop sumLoop

done:
	mov rax, SYS_exit
	mov rdi, EXIT_SUCCESS
	syscall


















