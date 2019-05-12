;Nhap vao so va tinh giai thua
.model small
.stack 50
.data
    muoi dw 10
    xuong db 10,13,'$' 
    tb1 db 'Nhap so khong am be hon hoac bang 8: $' 
.code
    main proc
        mov ax,@data
        mov ds,ax   
        
        lea dx, tb1
        mov ah,9
        int 21h
        
        mov ah,01h
        int 21h  
        
        sub al,30h
        xor cx,cx 
        mov cl,al
        
        lea dx,xuong
        mov ah,09
        int 21h
               
        mov ax,1
        mov bx,1
        Giaithua:
            Mul bx 
            inc bx
            cmp bx,cx
            jle giaithua 
        xor cx,cx
        Lappush:
            xor dx,dx
            div muoi
            add dx,30h
            push dx
            inc cx
            cmp ax,0
            jne Lappush
        Hienthi:
            pop dx
            mov ah,2
            int 21h
            Loop HienThi
                
        mov ah,4Ch
        int 21h 
    main endp
end main