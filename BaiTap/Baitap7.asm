.model small
.stack 50
.data
      mang DB 50 dup(?)  
      kt Db ? 
      xuongdong db 10,13,'$'
      chia db 10
.code
    main proc
        mov ax,@data
        mov ds,ax
        ;nhap mang
        Lea Si,mang
        xor cx,cx 
Lapnhap:        
        mov ah,1
        int 21h 
        cmp al,0Dh
        je Xuong
        mov [si], al
        inc si
        inc cx
        jmp Lapnhap
;xuong dong        
Xuong:  
        lea dx,xuongdong  
        mov ah,09h
        int 21h
;hien thi so ky tu        
        mov kt,cl
        mov al,cl
        mov ah,0
        xor cx,cx
        Lap:
            xor dx,dx
            div chia
            
            add ah,30h
            mov dl,ah
            push dx
            inc cx
            xor ah,ah
            cmp ax,0
            jne Lap
        Hienthi:
            pop dx
            mov ah,2
            int 21h
            loop Hienthi:
        
        lea dx,xuongdong  
        mov ah,09h
        int 21h
;hien thi da nhap vao        
        mov cl,kt
        lea si,mang
        XUat:
        mov dl,[si]
        mov ah,2
        int 21h
        inc si
        loop xuat  
            
        mov ah,4Ch
        int 21h
    
    main endp
    end main