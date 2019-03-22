.model small
.stack 100
.data
    b1 dw ?
    b2 dw ?
    tb1 db 'So A 16bit: $'
    tb2 db 10, 13, 'So B 16bit: $'
    tb3 db 10, 13, 'A + B =    $'
    tb4 db 10, 13, 'A - B =     $'
    tb5 db 10, 13, 'A || B =   $'
    tb6 db 10, 13, 'A ^ B =    $'
MAIN PROC
    mov ax, @data
    mov ds,ax
    
    mov bx, 0
    mov cx, 16
    mov ah,9
    lea dx,tb1
    int 21h
    
Lap1:
    mov ah,1
    int 21h
    sub al,30h
    shl bx,1
    add bl,al
    loop Lap1
    mov b1, bx
    
    mov bx,0
    mov cx, 16
    lea dx, tb2
    mov ah,9
    int 21h
     
Lap2:
    mov ah,1
    int 21h
    sub al,30h
    shl bx,1
    add bl, al
    Loop Lap2
    mov b2,bx
    
    mov ah, 09
    lea dx, tb3
    int 21h
    
    mov bx,b2
    add bx,b1
    mov cx,16
    mov dx, 30h
    adc dx,0
    cmp dx,31h
    je boqua
    mov ah,2
    int 21h
    boqua:
Lap3:
    mov dl,30h
    shl bx,1
    adc dl,0
    mov ah,2
    int 21h
    loop Lap3  
    
    mov ah,9
    lea dx,tb4
    int 21h
    
    mov bx,b1
    sub bx,b2
    mov cx,16
Lap4:
    mov dl,30h
    shl bx,1
    adc dl,0
    mov ah,2
    int 21h
    loop Lap4
    
        mov ah,4ch
        int 21h
    main endp
end main