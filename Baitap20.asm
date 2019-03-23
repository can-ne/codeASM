.model small
.stack 50
.data
         so db 50, 0 , 50 dup($)
         tong dw 0 
         muoi db 10
         kq db 10,13,'Tong cac chu so: $'
.code
    main proc
        mov ax,@data
        mov ds,ax
        
        lea dx,so
        mov ah,0Ah
        int 21h
        
        lea si, so +2
        mov cl, [so + 1]
        
        Lap:
            mov ax,tong
            xor bx,bx
            mov bl, [si]
            sub bl,30h
            add ax,bx
            mov tong,ax 
            inc si
            loop Lap
        
        lea dx,kq
        mov ah,9
        int 21h
        
        mov ax,tong
        xor cx,cx
        Lappush:
            xor dx,dx
            div muoi
            add ah,30h
            mov dl,ah
            push dx
            inc cx
            xor ah,ah
            cmp ax,0
            jne lappush
        Hienthi:
            pop dx
            mov ah,2
            int 21h
            loop Hienthi
        mov ah,4ch
        int 21h
        main endp
    end main
