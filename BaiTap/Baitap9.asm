;nhap vao hai chuoi so roi tinh tong
.model small
.stack 50
.data
    so db 10,0, 10 dup($)
    muoi db 10 
    xuong db 10,13,'Ket Qua: $'
    B1 Dw 0 
    b2 dw 0
    tb1 db 10,13, 'Nhap vao so dau: $'
    tb2 db 10,13, 'Nhap vao so thu 2: $'
.code
    main proc
        mov ax,@data
        mov ds,ax
        ;nhap xau
         lea dx,tb1 
        mov ah,9
        int 21h  
        xor cx,cx
        lea dx,so
        mov ah,0Ah
        int 21h
        call xulichuoi
        mov b1,dx
        ;xuong hang  
        mov ah,9
        lea dx,tb2
        int 21h
        
        
        mov ah,0Ah
        lea dx,so
        int 21h
          
        mov ah,9
        lea dx,xuong
        int 21h
        
        call xulichuoi
        mov b2,dx  
        
        ;cong b1 va b2 vao dx
        mov dx,b2
        add dx,b1
        
        mov ax,dx
        xor cx,cx
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
            
        mov ah,4Ch
        int 21h
        
    main endp 
    
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