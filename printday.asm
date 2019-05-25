.model small
.stack 50
.data
chia10 dw 10
nam dw ?
thang dw ?
ngay dw ?
thu dw ?
ngaytam db ?
.code
printday macro thoigian
    mov ax,thoigian      
    xor cx,cx
    local lapchia
    local docstack
    lapchia:
        xor dx,dx
        div chia10
        add dx,30h
        push dx
        inc cx
        cmp ax,0
        jne  lapchia
    docstack:
        pop dx
        mov ah,2
        int 21h
        loop  docstack
printday endm
main proc
    mov ax,@data
    mov ds,ax
    
    mov ah,2ah
    int 21h
    
    mov nam,cx
    
    mov ngaytam,dl
    
    mov dl,dh
    xor dh,dh
    mov thang,dx
    
    xor dh,dh
    mov dl,ngaytam    
    mov ngay,dx
    xor ah,ah  
    add ax,1
    mov thu,ax
    printday nam
    printday thang
    printday ngay
    printday thu
    
    mov ah,4ch
    int 21h
    main endp
end main
    