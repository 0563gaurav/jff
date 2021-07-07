;
; A simple boot sector that prints a message to the screen using BIOS routiens
;
	mov ah,0x0e ; int 10/ah=0eh--> scrolling teletype BIOS routien
	mov al,'H'
	int 0x10

	mov ah,0x0e
	mov al,'E'
	int 0x10

	mov ah,0x0e
	mov al,'L'
	int 0x10
	
	mov ah,0x0e
	mov al,'L'
	int 0x10

	mov ah,0xe
	mov al,'O'
	int 0x10
	
	jmp $ ; jump to the current address
;
;padding and magic BIOS number
;
	
	times 510-($-$$) db 0 ; pad the boot sector out with zeroes
	dw 0xaa55 ; last two bytes from the magic number 
		  ;so BIOS knows we are  a boot sector 
	
