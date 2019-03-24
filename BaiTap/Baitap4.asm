;nhap vao chuoi ky tu
;hien thi Xin chao <chuoi ky tu da nhap>
.model small
.stack 100h
.data
    str1 DB 10,13, 'Nhap vao chu cai:$'
    str2 DB 10,13, 'Xin chao $'  
    mang DB 30, 0, 30 dup('$'), '$'
.code
    main proc
        mov ax, @data
        mov ds,ax   
        ;nhap chuoi ky tu
        mov ah,0Ah
        lea dx,mang
        int 21h 
        
        mov  ah,9
        
        lea dx,str2
        int 21h
        ;dua dx chi ve phan tu thu 2 cua mang la ky tu dau tien duoc nhap vao
        lea dx,[mang + 2]       
        int 21h
        
        mov ah,4CH
        int 21h    
        
    main endp
    end main
