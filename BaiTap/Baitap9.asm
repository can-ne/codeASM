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
        ;xuong hang  
        mov ah,9
        lea dx,tb2
        int 21h
        ;dua ve ky tu dau tien nhap vao
        lea si,so + 2                  
        ;dua so ky tu vao
        mov cl,[so + 1]  
        ;dua so vao b1
        Lap:
            mov Ax,b1
            xor bx,bx
            mov bl,[si]
            sub bl,48
            mul muoi
            add ax,bx
            mov b1,ax          
            inc si
            Loop Lap 
        
        mov ah,0Ah
        lea dx,so
        int 21h
          
        mov ah,9
        lea dx,xuong
        int 21h
        
        lea si,so + 2
        mov cl,[so + 1]
        Lap2:
            mov Ax,b2
            xor bx,bx
            mov bl,[si]
            sub bl,48
            mul muoi
            add ax,bx
            mov b2,ax          
            inc si
            Loop Lap2 
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
    end main