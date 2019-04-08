.model small
.stack 50
.data   
    tb1 db 'Da ghi xong$'
    tb2 db 'welcome'
    tenf db 'w2a.txt',0
    thef dw ?
.code
    main proc
        mov ax,@data
        mov ds, ax
        
        mov ah,3Ch
        lea dx,tenf 
        mov cx,0
        int 21h 
        mov thef,ax
        
        mov ah,40h ;lenh ghi file
        mov bx,thef;dua con tro file vao
        mov cx,7  ;so ky tu ghi vao file
        lea dx,tb2; thu can ghi vao file
        int 21h
        
        lea dx,tb1
        mov ah,9
        int 21h 
        
        mov ah,3Eh
        mov bx,thef
        int 21h
        
        mov ah,4Ch
        int 21h
    main endp
end main