;viet chuong trinh doc tep text
.model small
.stack 50
.data
        controf dw ?
        tenf    db 'ab.txt',0
        buff db 50 dup('$') 
        tam db 5 dup(?)
        count db 0
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
        lea dx, buff
        mov ax,5
        mul count
        add dx, ax
        mov bx,controf 
        mov cx,5
        mov ah,3Fh
        int 21h           
        cmp ax,0
        je thoat 
        inc count
        jmp Lapdoc
        
        thoat: 
        lea dx,buff
        mov ah,9
        int 21h
            mov ah,3Eh
            mov bx,controf
            int 21h
            
        mov ah,4Ch
        int 21h
    main endp
end main  