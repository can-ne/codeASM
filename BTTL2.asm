.model small
.stack 50
.data
    str1 DB 10,13, 'Nhap vao chu cai:$'
    str2 DB 10,13, 'Ky tu da doi:$' 
    ktu DB ?  
.code
    main proc       
        mov ax, @data
        mov ds,ax   
     
Lap:  
        mov ah,09
        lea dx,str1  
        int 21h 
                
        mov ah,01h
        int 21h
        
        cmp al,'A'
        JL Lap       
        cmp al,'z'
        Ja Lap
        
        cmp al,'Z'
        Jl Low        
        cmp al,'a'
        JL Lap
        cmp al,'z'
        JL Up
        
Up:
    sub al,32 
    mov ktu,al
    jmp Exit1
    
Low:                       
    
    add al,32 
    mov ktu,al
    
Exit1:
    lea dx,str2
    mov ah,9
    int 21h
    mov dl,ktu
    mov ah,02 
    int 21h
        
        mov ah,4CH
        int 21h    
        
    main endp
    end main