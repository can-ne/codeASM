;vi du ve file 1
;tao 1 tep moi,doc du lieu tu ban phim va luu vao tep
.model small
.stack 50
.data
        controf dw ?
        tenf    db 'ab.txt',0
        buff db ?
        
.code
    main proc 
        mov ax, @data
        mov ds, ax
        
        mov cx,0  ; cx = 0 binh thuong, 1 chi doc 2 an 4 tap tin he thong
        lea dx,tenf
        mov ah,3Ch
        int 21h
        mov controf, ax
        
        Lapdoc: 
        xor dx,dx
        mov ah,1
        int 21h
        cmp al,13
        je thoat
        mov buff,al
        lea dx,buff
        mov bx,controf
        mov cx,1
        mov ah,40h
        int 21h
        jmp Lapdoc
        
        thoat:
            mov ah,3Eh
            mov bx,controf
            int 21h
            
        mov ah,4Ch
        int 21h
    main endp
end main        