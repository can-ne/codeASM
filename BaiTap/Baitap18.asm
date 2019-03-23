.MODEL SMALL
.STACK 100
.DATA
     tong db 0 
     muoi db 10
     xuong db 10,13,'$'
     chuoi db 50,0,50 dup($)
     count db 0 
     b1 db 0
.CODE
    MAIN PROC
        MOV ax,@data
        MOV ds,ax
        xor cx,cx 
        mov ah,0Ah
        lea dx,chuoi
        int 21h
        xor ax,ax 
        mov cl,[chuoi+ 1]
        lea si,chuoi + 2
Tongso: 
        cmp [si],0dh
        je congcuoi
        cmp [si],' '
        jne tiep
        congcuoi: 
            inc count
            xor bx,bx
            mov bl,tong
            add bl,b1
            mov tong,bl
            mov b1,0
            inc si
            
        tiep:
            mov al,b1
            xor bx,bx
            mov bl,[si]
            sub bl,30h
            mul muoi
            add ax,bx
            mov b1,al
            inc si
        loop tongso
Chia:    
        mov ah,9
        lea dx,xuong 
        int 21h
        XOR AX,AX 
        mov al,tong 
        mov cl,count
        div cl
        xor ah,ah
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