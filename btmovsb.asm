.model small
.stack 100
.data
        b1 db 'Chao$'
        b2 db 5 dup(0)
.code
    main PROC
        mov ax, data
        mov es,ax
        mov ds,ax
        
        ;cld
        lea SI,b1
        lea di,b2
        mov cx,5
        rep movsb
        
        
        mov ah,9
        lea dx,b2
        int 21h
        mov ah,4Ch
        int 21h
    main ENDP
    END MAIN