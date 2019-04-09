.MODEL SMALL    
.STACK 50
.DATA
    tb1 db 'Nhap chuoi ki tu vao: $' 
    tb2 db 10,13,'Chuoi da nhap: $'
    tenf db 'bt.txt',0
    controf dw ?
    buff db ?
.CODE

    main proc
        mov ax,@data
        mov ds,ax
        ;tao tap tin moi
        mov ah,3Ch
        lea dx,tenf  ;gan ten moi cho file
        mov cx,0     ;che do file binh thuong
        int 21h
        mov controf, ax  ;luu con tro file vao bien controf
        ;thong bao nhap vao
        lea dx, tb1
        mov ah,9
        int 21h
        ;doc ki tu tu ban phim va ghi vao file
        Lapghi:
        mov ah,1
        int 21h
        cmp al,13  ;so sanh voi ENTER de thoat
        je thoat
        mov buff , al ;neu ghi vao file
        lea dx, buff    ;ky tu can ghi vao duoc chua trong dx
        mov bx,controf ; bien con tro
        mov cx,1       ; ghi 1 ky tu vao file //so ky tu duoc ghi vao
        mov ah,40h
        int 21h
        jmp Lapghi
        
        thoat:
        mov ah,3Eh      ;dong file
        mov bx,controf
        int 21h
        ;mo lai file
        mov ah, 3Dh
        lea dx, tenf    ;ten file
        mov al,0        ;mo lai chi doc
        int 21h
        mov controf,ax  ;luu con tro file
        ;thong bao xuat
        lea dx,tb2
        mov ah,9
        int 21h
        ;doc va xuat file
        Lapdoc: 
        lea dx,buff
        mov bx,controf
        mov cx,1    ;so ky tu doc tu file
        mov ah,3Fh
        int 21h   
        
        cmp ax,0    ;neu o cuoi file ax se bang 0,la so ky tu doc duoc
        je Thoat2       ;neu bang 0 thi ket thuc
        mov dl, buff
        mov ah,2
        int 21h
        jmp Lapdoc
        ;dong file
        thoat2:
        mov ah,3Eh
        mov bx,controf
        int 21h
        
        mov ah,4Ch
        int 21h
    main endp
end main