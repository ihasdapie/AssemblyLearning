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

