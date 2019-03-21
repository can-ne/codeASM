.model small
.stack 50
.data
    str1 DB 10,13, 'Nhap vao chu cai:$'    
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
    and al,11011111b 
    mov dl,al
    mov ah,02 
    int 21h
    JMP Exit1
    
Low:                       
    
    add al,32
    mov ah,02 
    int 21h
Exit1:        
        mov ah,4CH
        int 21h    
        
        
        
    main endp
    end main