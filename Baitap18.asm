.MODEL SMALL
.STACK 100
.DATA
     tong db 0 
     muoi db 10
     xuong db 10,13,'$'
     chuoi db 50,0,50 dup($)
     count db 0
.CODE
    MAIN PROC
        MOV ax,@data
        MOV ds,ax
        xor cx,cx 
;Nhap:        
;        mov ah,1
;        int 21h
;        cmp al,0
;        sub al,30H
;        je Chia 
;        inc cx
;        add tong, al
;        mov ah,9
;        lea dx,xuong
;        int 21h        
;        jmp Nhap
        mov ah,0Ah
        lea dx,chuoi
        int 21h 
        mov cl,[chuoi+ 1]
        lea si,chuoi + 2
Tong:
        cmp [si],' '
        je 
        inc si
        
        
        loop tong
Chia:    
        mov ah,9
        lea dx,xuong 
        int 21h
        XOR AX,AX 
        mov al,tong
        div cl
        
        xor cx,cx
        Lap:
           xor dx,dx
           div muoi
           mov dl,ah 
           add dx, 30h
           push dx
           inc cx 
           xor ah,ah
           cmp ax,0
           jne Lap
        Hienthi:
            pop dx
            mov ah,2
            int 21h
            loop Hienthi
        MOV ah,4Ch
        INT 21h
    MAIN ENDP
    END MAIN