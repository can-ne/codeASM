;Nhap vao 2 so he 16 tinh tong hieu or xor
.model small
.stack 100
.data 
    tb1 db 'Nhap so A: $'
    tb2 db 10,13, 'Nhap so B: $'
    b1 dw ?
    b2 dw ?
    tb3 db 10, 13, 'A + B =    $'
    tb4 db 10, 13, 'A - B =     $'
    tb5 db 10, 13, 'A OR B =    $'
    tb6 db 10, 13, 'A XOR B =   $'
    tbloi db 10, 13 , 'Nhap sai$'
    so db 5,0,5 dup(?) ,'$'
    muoi dw 16
.code
    main proc
        mov ax,@data
        mov ds,ax
        
        lea dx,tb1 
        mov ah,9
        int 21h
        call Nhap        
        mov ax,b2
        mov b1,ax
        ;xuong hang  
        mov ah,9
        lea dx,tb2
        int 21h
        call Nhap
    mov ah, 09
    lea dx, tb3
    int 21h
    
    mov bx,b2
    add bx,b1 
    
    mov cx,16
    mov dx, 30h
    adc dx,0
    mov ah,2
    int 21h 
    
Lap3:
    mov dl,30h
    shl bx,1
    adc dl,0
    mov ah,2
    int 21h
    loop Lap3  
    
    mov ah,9
    lea dx,tb4
    int 21h
    
    mov bx,b1
    sub bx,b2
    mov cx,16
Lap4:
    mov dl,30h
    shl bx,1
    adc dl,0
    mov ah,2
    int 21h
    loop Lap4
    
    mov ah,9
    lea dx,tb5
    int 21h  
    
    mov bx,b1
    or bx,b2
    mov cx,16
Lap5:
    mov dl,30h
    shl bx,1
    adc dl,0
    mov ah,2
    int 21h
    loop Lap5
    
    mov ah,9
    lea dx,tb6
    int 21h
    mov bx,b1
    xor bx,b2
    mov cx,16
Lap6:
    mov dl,30h
    shl bx,1
    adc dl,0
    mov ah,2
    int 21h
    loop Lap6 
        mov ah,4Ch
        int 21h
        main endp 
    nhap proc
        xor cx,cx
        lea dx,so
        mov ah,0Ah
        int 21h
        ;dua ve ky tu dau tien nhap vao
        lea si,so + 2                  
        ;dua so ky tu vao
        mov cl,4  
        ;dua so vao b1
        Lap1:
            mov Ax,b2
            xor bx,bx
            mov bl,[si] 
            
            cmp bl, 48
            jle thoat
            cmp bl,57
            jae tiep
            sub bl,48
            jmp nhan1 
            tiep:
            cmp bl,65
            jl thoat
            cmp bl,70
            ja thoat
            sub bl,55
            nhan1:
            mul muoi
            add ax,bx
            mov b2,ax          
            inc si 
            jmp conti
            
            thoat:
            mov cx,0
            mov ah, 9
            lea dx, tbloi
            int 21h 
            
            conti:
            Loop Lap1
        ret
    nhap endp 
    
    end main