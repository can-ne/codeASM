.model small
.stack 100
.data
     mang db 20,0, 20 dup(?)  
     xuong db 10,13,'$'
.code
    main proc
        mov ax,@data
        mov ds,ax
        
        mov ah,0ah
        lea dx,mang
        int 21h
        
        lea dx,xuong
        mov ah,9
        int 21h
        
        mov cl,[mang + 1]
        lea si, mang + 2
        Lap:
            push [si]
            inc si 
            loop Lap
        mov cl, [mang + 1]
        Lap2:
            pop dx
            mov ah,2
            int 21h
            Loop Lap2
        mov ah,4ch
        int 21h
    main endp
    end main