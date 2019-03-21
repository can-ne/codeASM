.model small
.stack 50
.data
    str1 DB 10,13, 'Nhap vao chu cai:$'
    str2 DB 10,13, '$' 
    ktu DB ?  
    mang DB 5 dup(?) ;10 phan tu co gia tri ?
.code
    main proc
        mov ax, @data
        mov ds,ax   
;Nhap mang     
        lea SI,ktu ;dua con tro si ve phan tu dau tien cua mang
        mov cx,10
Lap:        
        mov ah,1
        int 21h
        mov [si],al;
        inc si
        loop Lap
;Xuong dong         
        Lea Dx,str2
        mov ah,9
        int 21h
;Xuat mang        
        lea Si,mang 
        mov cx,10
Lap2:
        mov dl,[si]
        mov ah,2
        int 21h
        inc si
        Loop Lap2
        
        mov ah,4CH
        int 21h    
        
    main endp
    end main
