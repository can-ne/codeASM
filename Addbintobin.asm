.model small
.stack 50
.data
    bien1 dw ?
    thongbao1 db 10,13,'So thu nhat : $'
    thongbao2 db 10,13,'So thu hai  : $'
    thongbao db 10,13,'Tong la     : $'
main proc
    mov ax,@data
    mov ds,ax
    mov bx,0
    mov cx,16
    mov ah,09h
    lea dx,thongbao1
    int 21h
Lap1:
    mov ah,01h
    int 21h
    sub al,30h
    shl bx,1
    add bl,al
    loop Lap1
    
    mov bien1,bx
    mov bx,0
    mov cx,16
    
    mov ah,09h
    lea dx,thongbao2
    int 21h 
    
Lap2:
    mov ah,01h
    int 21h
    sub al,30h
    shl bx,1
    add bl,al
    loop Lap2
    
    add bx,bien1
    mov cx,16
    
    mov ah,09h
    lea dx,thongbao
    int 21h
    
    mov dx,30h
    adc dx,0 
    mov ah,02h
    int 21h   
Lap3:
    mov dl,30h
    shl bx,1
    adc dl,0
    mov ah,02h
    int 21h
    loop Lap3
    mov ah,4ch
    int 21h
    main endp
end main
    