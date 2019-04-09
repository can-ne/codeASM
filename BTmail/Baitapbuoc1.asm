;viet chuong trinh doc tep text
.model small
.stack 50
.data
        controf dw ?
        tenf    db 'bt.txt',0
        buff db ?
.code
    main proc 
        mov ax, @data
        mov ds, ax
        
        lea dx,tenf
        mov al,0
        mov ah,3Dh
        int 21h
        mov controf, ax 
        
        Lapdoc:
        lea dx,buff
        mov bx,controf 
        mov cx,1
        mov ah,3Fh
        int 21h  
        cmp ax,0
        je thoat
        mov dl, buff
        mov ah,2
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