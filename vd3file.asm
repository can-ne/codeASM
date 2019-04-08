;vi du ve file 3
;tao 1 tep moi,doc du lieu tu ban phim va luu vao tep
.model small
.stack 50
.data
        controf dw ?
        tenf    db 'ab.txt',0
        buff db 5 dup('$')
        
.code
    main proc 
        mov ax, @data
        mov ds, ax
        
        mov cx,0  ; cx = 0 binh thuong, 1 chi doc 2 an 4 tap tin he thong
        lea dx,tenf
        mov ah,3Ch
        int 21h
        mov controf, ax
             
        Lea Si,buff
        xor cx,cx 
Lapnhap:        
        mov ah,1
        int 21h 
        cmp al,0Dh
        je thoat
        mov [si], al
        inc si
        inc cx
        jmp Lapnhap    
        thoat:  
        
        lea dx, buff
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