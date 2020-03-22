
%include "asm_io.inc"

segment .data ; only init'd data should be defined here

in_show1 db "Number to add: ", 0
in_show2 db "Another number to add: ", 0
out_show1 db "Number 1: ", 0
out_show2 db "Number 2: ", 0
out_show3 db "Sum: ", 0

segment .bss ; "block started by symbol"

input_1 resd 1
input_2 resd 1

segment .text ; code segmnet
	global _asm_main ;labels have default internal scope (only code in same module can use same label
	; global gives label external scope (as per norm)
_asm_main:  ;note underscores ( C Calling Convention) 
	enter 0,0
	pusha
	
	mov eax, in_show1
	call print_string
	
	call read_int
	mov [input_1], eax
	
	mov eax, in_show2
	call print_string
	
	call read_int
	mov [input_2], eax
	
	;add values
	mov eax, [input_1]
	add eax, [input_2]
	mov ebx, eax
	
	dump_regs 1
	dump_mem 2, out_show2, 1
	
	;print output
	mov eax, out_show1
	call print_string
	
	mov eax, [input_1]
	call print_int
	call print_nl
	
	mov eax, out_show2
	call print_string
	
	mov eax, [input_2]
	call print_int
	call print_nl
	
	mov eax, out_show3
	call print_string
	
	mov eax, ebx
	call print_int
	call print_nl
	
	popa
	mov eax, 0
	leave
	ret
	
