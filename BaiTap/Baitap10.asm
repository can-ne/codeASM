.model small
.stack 50           
.data
    so db 10,0,10 dup($)
    muoi db 10
    xuong db 10,13,'$'
    b1 dw 0
    b2 dw 0
.code
    main proc
        mov ax,@data
        mov ds,ax
        
        mov ah,0Ah
        lea dx,so
        int 21h
        mov ah,9
        lea dx,xuong
        int 21h
        lea si,so + 2
        mov cl,[so+1]
        Lap:
            mov ax,b1
            xor bx,bx
            mov bl,[si]
            sub bl,30h
            mul muoi
            add ax,bx
            mov b1,ax
            inc si
            loop Lap
        
        mov ah,0Ah
        lea dx,so
        int 21h
        
        lea si,so + 2
        mov cl,[so+1]
        Lap2:
            mov ax,b2
            xor bx,bx
            mov bl,[si]
            sub bl,30h
            mul muoi
            add ax,bx
            mov b2,ax
            inc si
            loop Lap2
        mov dx,b1
        mov ax,b2
        xor cx,cx
        chia:
            sub dx,ax
            inc cx
            cmp dx,ax
            jae chia 
            
        
        xor cx,cx
        xor dx,dx 
        
        mov cx,b2
        Nhan:
            add dx,b1
            Loop Nhan     
        
        mov ah,4Ch
        int 21h
    main endp
    end main