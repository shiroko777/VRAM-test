BITS 16
org 0x7C00

start:
    cli
    xor ax, ax
    mov ds, ax
    mov es, ax
    mov ss, ax
    mov sp, 0x7C00
    sti
    mov ax, 0x13
    int 0x10
    mov ah, 0x42
    mov si, bootrisk
    int 0x13
    jmp $

bootrisk:            
    db 0x10            
    db 0                
    dw (filled - image) / 512 + 1 
    dw 0x0000, 0xA000 
    dq 1            

times 510 - ($ - $$) db 0
dw 0xAA55       

image: incbin "raw.vad"
filled: times 512 - ($ - $$) % 512 db 0
