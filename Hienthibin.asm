.model small
.stack 100
.data
     xuong db 10,13,'$' 
     count db 0 
     muoi db 10
.code 
    Main proc
        mov ax,@data
        mov ds,ax
        
        xor bx,bx
        mov cx,16
        Lap:
        mov ah,1
        int 21h
        sub al,30h
        shl bx,1
        add bl,al 
        add count,al
        Loop Lap  
        
        lea dx,xuong
        mov ah,9
        int 21h
        
        mov cx,16
        Lap1:
             mov dl,30h
             shl bx,1
             adc dl,0
             mov ah,2
             int 21h
             loop Lap1  
        xor ax,ax
        mov al,count
        xor cx,cx
        Lap2:
            xor dx,dx
            
            div muoi
            add ah,30h
            mov dl,ah
            push dx
            inc cx
            xor ah,ah
            cmp ax,0
            jne lap2
         hienthi:
            pop dx
            mov ah,2
            int 21h
            loop hienthi 
        mov ah,4ch
        int 21h
    main endp
end main