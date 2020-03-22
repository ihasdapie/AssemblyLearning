%include asm_io.inc

segment .data

segment .bss

segment .text
	global _asm_main
_asm_main:
	enter 0,0
	pusha
	
	
	
	;code put here
	
	popa
	mov eax, 0
	leave
	ret
	
