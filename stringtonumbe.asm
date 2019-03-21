.model small
.stack 50
.data
    so db 10,0, 10 dup($)
    nhan db 10 
    xuong db 10,13,'$'
    B Dw 0
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
        mov cl,[so + 1]
        Lap:
            mov Ax,b
            xor bx,bx
            mov bl,[si]
            sub bl,48
            mul nhan
            add ax,bx
            mov b,ax          
            inc si
            Loop Lap  
        mov ah,4Ch
        int 21h
        
    main endp
    end main