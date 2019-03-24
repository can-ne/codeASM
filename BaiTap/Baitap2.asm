;nhap mot ky tu tu ban phim va hien thi lai
;khong dung bien phu
.model small
.stack 50
.data
    str1 DB 10,13, 'Nhap ky tu:$'
    str2 DB 10,13, 'Ky tu vua nhap:$'   
.code
    main proc
        mov ax, @data
        mov ds,ax   
        
        mov ah,09h
        lea dx,str1
        int 21h
        
        mov ah,01h
        int 21h 
        mov bl,al
        
        mov ah, 09h
        mov dx,offset str2
        int 21h
        
        mov ah,2
        mov dl,bl
        int 21h
        
        mov ah,4CH
        int 21h    
        
        
        
    main endp
    end main
