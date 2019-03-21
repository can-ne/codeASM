.model small
.stack 100h
.data
    str1 DB 10,13, 'Nhap vao chu cai:$'
    str2 DB 10,13, 'Da nhap: $'  
    mang DB 30, ?, 30 dup('$'), '$'
.code
    main proc
        mov ax, @data
        mov ds,ax   
        
        mov ah,0Ah
        lea dx,mang
        int 21h 
        
        mov  ah,9
        
        lea dx,str2
        int 21h
        
        lea dx,[mang + 2]       
        int 21h
        
        mov ah,4CH
        int 21h    
        
    main endp
    end main
