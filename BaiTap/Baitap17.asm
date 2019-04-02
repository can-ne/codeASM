.model small
.stack 100
.data
     mang db 20,0, 20 dup(?)  
     tb2 db 10,13,'Chuoi da duoc dao nguoc: $' 
     tb1 db "Nhap 1 chuoi vao: $"
.code
    main proc
        mov ax,@data
        mov ds,ax
        
        mov ah,9
        lea dx, tb1
        int 21h
        
        mov ah,0ah
        lea dx,mang
        int 21h
        
        lea dx, tb2
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