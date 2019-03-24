;Nhap vao chuoi ky tu bat ky
;bien tat ca thanh chu thuong roi in ra
;bien tat ca chu cai thanh hoa r in ra
.model small
.stack 50
.data
        mang db 50,0, 50 dup('$') 
        xuong db 10 , 13,'$'
        Gach db ' - $'
        ktu db ?
.code
    main proc
        mov ax,@data
        mov ds,ax
                 
        mov ah,0Ah
        lea dx,mang
        int 21h 
        
        lea dx,xuong
        mov ah,09
        int 21h
        
        lea si,mang+ 2
        mov cl, [mang + 1] 
        Lap1:
            cmp [si],'A'
            Jl Boqua
            cmp [si],'Z'
            JA Boqua
            add [si],32
            
            Boqua: 
            inc si
            loop lap1
        mov ah,09h
        lea dx,[mang +2]
        int 21h 
        
        lea dx,xuong
        mov ah,09
        int 21h 
        
        Lea si,mang + 2
        mov cl,[mang + 1]
        Lap2:
            cmp [si],'a'
            Jl Boqua2
            cmp [si],'z'
            JA Boqua2
            sub [si], 32 
            
            Boqua2:
                inc Si
            loop Lap2
        
        mov ah,09h
        lea dx,[mang +2]
        int 21h
        
        mov ah,4ch
        int 21h          
    main endp
    end main