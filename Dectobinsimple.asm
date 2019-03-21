.model small
.stack 50
.data
     so db 10,0,10 dup($)
     muoi db 10
     xuong db 10, 13, '$'
     b1 dw 0
.code
    main proc
        mov ax,@data
        mov ds,ax
        
        mov ah,0Ah 
        lea dx, so
        int 21h
        
        lea dx, xuong
        mov ah, 9 
        int 21h
        
        lea si, so +2
        mov cl, [so + 1]
        Lap:
            mov ax,b1
            xor bx, bx
            mov bl,[si]
            sub bl,30h
            mul muoi
            add ax,bx
            mov b1,ax 
            inc si
            loop Lap
        mov bx,b1
        mov cx,16
        tobin:
            mov dl,30h
            shl bx,1
            adc dl,0
            mov ah,2
            int 21h
            loop tobin
        mov ah, 4Ch
        int 21h
    main endp
    end main
                   