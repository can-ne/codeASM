.model small
.stack 50
.data
    str1 DB 10,13, 'Nhap ky tu:$'
    str2 DB 10,13, 'Ky tu vua nhap:$'  
    ktu DB ?   
.code
    main proc
        mov ax, @data
        mov ds,ax   
        
        mov ah,09h
        lea dx,str1
        int 21h
        
        
        mov ah,01h
        int 21h 
        mov ktu,al
        
        mov ah, 09h
        mov dx,offset str2
        int 21h
        
        
        mov ah,2
        mov dl,ktu
        int 21h
        
        mov ah,4CH
        int 21h    
        
        
        
    main endp
    end main
