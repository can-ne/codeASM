.model small   ;chuong trinh in mot so tu thanh ghi ax
.stack 50
.data
    chia8 db 10
    chia16 dw 10  
    mang db 30, 0, 30 dup('$')
.code
    main proc
        mov ax, @data
        mov ds,ax   

        mov ax,2517     ;dua so vao thanh ghi ax
        xor cx,cx       ;gan cx = 0 de dem so ky tu so
Lapchia:                                
        xor dx,dx       ;dua dx =0
        div chia8       ;chia cho ax cho 10 o dang 8 bit ah chua so du al chua thuong
        
        add ah,30h      ;bien so trong ah thanh ky tu so
        mov dl,ah       ; dua ah vao dx
        push dx         ;dua dx vao ngang xep
        inc cx          ;them mot chu so la cong them
        xor ah,ah       ;xoa ah
        cmp ax,0        ;neu thuong bang 0 thi dung lai
        jne Lapchia
        
Dochienthi:             ;luc nay cx co gia tri la so ky tu
        pop dx          ;lay tung ky tu so in ra
        mov ah,2
        int 21h
        loop Dochienthi                    
        ;vi du
        ; ax = 2517
        ;vong lap dau tien
        ; div thi ah =7 + 30h =>> '7' dua vao dl, de vao ngan xep 7   , tang dem cx len 1
        ;al con la 251d
        ;phai xoa ah khong ax =07FBh xoa ah =>> ax = 251d 
        mov ah,4CH
        int 21h    
        
    main endp
    end main