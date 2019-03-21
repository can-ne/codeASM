.model small
.stack 50
.data
    str1 DB 10,13, 'Chao ban$'     
.code
    main proc
        mov ax, @data
        mov ds,ax   
        
        
        mov cx,10
Nhan1:
        mov ah,09h 
        mov dx,offset str1
        int 21h 
        loop Nhan1
        
        mov ah,4CH
        int 21h    
        
        
        
    main endp
    end main