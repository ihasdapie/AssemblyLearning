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
	
	myList dd 1,4,2,3
	myListLen dd 4

;~ for x in range(n):
	;~ for y in range(n):
		;~ if l[x] > l[y]
			;~ swap x, y

section .text
global _start
_start:
	
	mov r11, -1 ;outside loop
	mov r12, -1 ;inside loop
	mov eax, 0 ; for comparisons (outside loop)
	
	bubbleOutLoop:
		inc r11
		cmp r11, [myListLen]
		jge outDone
	
		bubbleInLoop:
			inc r12
			cmp r12, [myListLen]
			jge inDone
			
			mov eax, [myList+(r11*4)]
			mov ebx, [myList+(r12*4)]
			
			cmp eax, ebx
			jle swap
			jmp bubbleInLoop
			
			swap: ;swap myList[r11], myList[r12]
				mov [myList+(r11*4)], ebx
				mov [myList+(r12*4)], eax
				jmp bubbleInLoop
				
		inDone:
			mov r12, 0
			jmp bubbleOutLoop
	
	jmp bubbleOutLoop

	outDone:
		jmp done

done:
	mov rax, SYS_exit
	mov rdi, EXIT_SUCCESS
	syscall







