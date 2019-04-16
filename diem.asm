.model small
.stack 100
.data  
    diem db 3
    xs db 'Xuat sac$'
    gi db 'Gioi$'
    tb db 'Trung binh$'
    yk db 'Kem$'
.code

    main proc
        mov ax,@data
        mov ds,ax
        
        cmp diem,9
        jae xuatsac
        cmp diem,8
        jae gioi
        cmp diem,5
        jae trungbinh  
        
        lea dx,yk 
        jmp exit
        
        xuatsac:
        lea dx,xs 
        jmp exit
        
        gioi:
        lea dx,gi
        jmp exit
        
        trungbinh:
        lea dx,tb
        jmp exit
        
        exit:
        mov ah,9
        int 21h
        
        mov ah,4Ch
        int 21h
    main endp
end main