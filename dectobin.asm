.model small
.stack 50
.data
    tb1 db 'Nhap so (>2 chu so): $'
    tb2 db 10,13,'Chuyen sang he nhi phan: $'
    tb3 db 10,13,'Nhap lai: $'
    xuongdong db 10,13,'$'
    nhan db 10
    s1 dw ?
    s2 dw ?
    
.code
main proc
    mov ax,@data
    mov ds,ax
    
    xor cx,cx
    mov ah,9
    lea dx, tb1
    int 21h
    
   Nhap:
    mov ah,1
    int 21h
    inc cx
    cmp al,13
    je enter
    
    sub al,30h
    xor bx,bx
    mov bl,al
    mov ax,s1
    MUL nhan
    add ax,bx
    mov s1,ax
    jmp nhap
    
   enter:
    cmp cx,3
    jb loi
    ja inra
   
   Loi:
    mov ah,9
    lea dx,tb3
    int 21h
    xor cx,cx
    mov s1,0
    jmp nhap
   
   inra:
    lea dx,xuongdong
    mov ah,9
    int 21h
    xor ax,ax
    xor bx,bx
    
    mov ah,9
    lea dx,tb2
    int 21h  
    
    mov bx,s1
    mov cx,16
    mov s2,0
    
   lap:
    SHL bx,1
    inc s2
    jc inra1
    mov ah,2
    mov dl,'0'
    int 21h
    jmp hienthi
   inra1:
    mov ah,2
    mov dl,'1'
    int 21h
    
   hienthi:
    cmp s2,4
    jb lap1
    mov ah,2
    mov dl,' '
    int 21h
    mov s2,0
   
   lap1:
    loop Lap
    
    mov ah,4ch
    int 21h
endp
end main