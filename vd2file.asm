;vi du ve file 2
;tao 1 tep moi,doc du lieu tu ban phim va luu vao tep
.model small
.stack 50
.data
        controf dw ?
        tenf    db 'ab.txt',0
        buff db 100,0, 100 dup('$')
        
.code
    main proc 
        mov ax, @data
        mov ds, ax
        
        mov cx,0  ; cx = 0 binh thuong, 1 chi doc 2 an 4 tap tin he thong
        lea dx,tenf
        mov ah,3Ch
        int 21h
        mov controf, ax
             
        mov ah,0Ah
        lea dx, buff
        int 21h   
        
        xor cx,cx
        lea dx, buff + 2
        mov cl, [buff + 1]
        mov bx, controf
        mov ah,40h
        int 21h
        
        mov ah,3Eh
        mov bx,controf
        int 21h
            
        mov ah,4Ch
        int 21h
    main endp
end main