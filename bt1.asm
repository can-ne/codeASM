.model small
.stack 50
.data
    tem DB ? 
    str1 DB 10,13,'Nhap 1 ky tu:$'
    str2 DB 10,13,'Ky tu nhan duoc la:$'    
.code
    main proc
        mov ax, @data
        mov ds,ax   
                     
        mov ah,09h
        lea dx,str1
        int 21h
        
        mov ah,07h
        int 21h
        
        mov tem,al
        
        
        mov ah,09
        lea dx,str2
        int 21h
        
        mov ah,02h
        mov dl,tem
        int 21h
        
        mov ah,4CH
        int 21h    
        
        
        
    main endp
    end main