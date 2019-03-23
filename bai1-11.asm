;Nhap 2 so nhi phan 16 bit A,B
;In ra ket qua o dang nhi phan A+B, A-B, A and B, A or B

.model small
.stack 50h
.data
    tbA db "Nhap 2 so nhi phan 16 bit A,B:",10,13,"A:$"
    tbB db 10,13,"B:$"
    x db 17,0,17 dup('$')
    y db 17,0,17 dup('$')
    s1 db 16 dup('0'),'$'
    tb1 db 10,13,"A+B=$"
.code
    ;khoi tao ds:
    mov ax,@data
    mov ds,ax
    
    xor cx,cx
    ;in ra tbA:
    mov ah,9
    lea dx,tbA
    int 21h    
    
    ;nhap A luu vao chuoi x:
    mov ah,10
    lea dx,x
    int 21h 
    
    ;in ra tbB:
    mov ah,9
    lea dx,tbB
    int 21h  
    
    ;nhap B luu vao chuoi y:
    mov ah,10
    lea dx,y
    int 21h   
    
    ;sao chep chuoi y vao s1 
    lea si,y+2      ;si tro den dau chuoi y
    lea di,s1       ;di tro den dau chuoi s1
    mov cx,16       ;lap 16 lan
    saochep1:
    mov bl,[si]     ;
    mov [di],bl     ;gan s1[di]=y[si]
    inc si
    inc di
    loop saochep1
    ;sau do lay x + s1
    lea si,x+17     ;si tro den cuoi chuoi x
    lea di,s1+15    ;di tro den cuoi chuoi s1
    mov cx,16       ;lap 16 lan
    mov bl,0        ;bl bien nho
    lap1:
    mov al,bl       ;khoi tao al=bl
    add al,[si]     ;
    sub al,48       ;
    add al,[di]     ;
    sub al,48       ;al=bl+x[si]-48+s1[di]-48
                    ;x[si]-48 de chuyen ki tu sang so
                    ;s1[di]-48 de chuyen ki tu sang so
    
    cmp al,3        
    jz bang3        
    cmp al,2
    jz bang2
    cmp al,1
    jz bang1
    mov [di],'0'    ;mac dinh neu al=0 thi gan s1[di]=0 
    mov bl,0        ;va so du bl=0
    jmp thoat1 
    
    
    
    bang3:          ;neu al=3 
    mov [di],'1'    ;gan s1[di]=1
    mov bl,1        ;va so du bl=1
    jmp thoat1
    bang2:          ;neu al=2
    mov [di],'0'    ;gan s1[di]=0
    mov bl,1        ;va so du bl=1
    jmp thoat1
    bang1:          ;neu al=1
    mov [di],'1'    ;gan s1[di]=1
    mov bl,0        ;va so du bl=0
    thoat1:         
    dec si
    dec di
    loop lap1
    
    ;in ra s1
    mov ah,9
    lea dx,tb1
    int 21h
    lea dx,s1
    int 21h
    
    ;ket thuc chuong trinh:
    mov ah,4ch
    int 21h 
end