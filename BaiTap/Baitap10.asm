;nhap 2 so tu ban phim
; tinh a/b a*b khong su dung DIV va MUL

.model small
.stack 50           
.data
    so db 10,0,10 dup($)
    muoi db 10
    tb1 db 10,13,'A: $'
    tb2 db 10,13,'B: $'
    tb3 db 10,13,'A/B: $'
    tb4 db 10,13,'A*B: $'
    b1 dw 0
    b2 dw 0
.code
    main proc
        mov ax,@data
        mov ds,ax
        
        mov ah,9
        lea dx,tb1
        int 21h
        
        mov ah,0Ah
        lea dx,so
        int 21h
        
        mov ah,9
        lea dx,tb2 
        int 21h
        
        call xulichuoi
        mov b1,dx
        
        mov ah,0Ah
        lea dx,so
        int 21h
        
        call xulichuoi
        mov b2, dx
        
        mov ah,9
        lea dx,tb3
        int 21h
        
        mov dx,b1
        mov ax,b2
        
        xor cx,cx
        chia:
            sub dx,ax
            inc cx
            cmp dx,ax
            jae chia 
        
        mov ax,cx
        xor cx,cx 
        Call Inchuoi   
        
        lea dx,tb4
        mov ah,9
        int 21h
        
        xor cx,cx
        xor dx,dx 
        mov cx,b2
        Nhan:
            add dx,b1
            Loop Nhan     
        mov ax,dx
        xor cx,cx   
        Call inchuoi
        mov ah,4Ch
        int 21h
    main endp 
    
    inchuoi PROC
           Lapchia:
            xor dx,dx
            div muoi
            
            add ah,30h
            mov dl,ah
            push dx
            inc cx
            xor ah,ah
            cmp ax,0
            jne Lapchia
        Hienthi:
            pop dx
            mov ah,2 
            int 21h
            loop Hienthi
            ret
    inchuoi ENDP
    
    xulichuoi PROC
        xor dx,dx
        xor cx,cx
        lea si,so + 2
        mov cl,[so+1]
        Lap:
            mov ax,dx
            xor bx,bx
            mov bl,[si]
            sub bl,30h
            mul muoi
            add ax,bx
            mov dx,ax
            inc si
            loop Lap
            ret
    xulichuoi ENDP
end main