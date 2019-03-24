;Nhap vao 1 chu cai thuong/ hien thi tu chu cai do den z
.model small   ;hien thi tu ?-z
.stack 50
.data
       str DB 10,13,'Nhap ky tu thuong:$' 
       str1 DB ' $'
       ktu DB ?
       
.code
    main proc
        mov ax, @data
        mov ds,ax 
        
        mov ah,09h
        mov dx,offset str
        int 21h
        
        
        mov ah,01h
        int 21h
        mov ktu,al
Lap:    
        lea dx, str1
        mov ah,09
        int 21h
        
        inc ktu
        cmp ktu, 'z'
        jg Thoat
        lea dx,str1
        mov ah,9
        mov dl,ktu
        mov ah,2
        int 21h
        jmp Lap
Thoat:
        
        mov ah,4CH
        int 21h    
              
    main endp
    end main