.model small
.stack 50
.data
     inp db 'inp.txt',0
     ctrof dw ?
     buf db  100,0,100 dup('$') 
     count db 0
     b1 db  0  
     b2 db 1 dup('$')
     muoi db 10
     outp db 'out.txt',0
     conf dw ?
.code

    MAIN PROC
        mov ax,@data
        mov ds,ax 
        
        mov ah, 3Dh
        lea dx,inp
        mov al,0
        int 21h
        mov ctrof,ax
       
        loopREAD:
        xor ax,ax
        lea dx,buf 
        mov al,count
        add dx,ax
        mov bx,ctrof
        mov cx,1
        mov ah,3fh
        int 21h
        
        cmp ax,0  
        je exitread 
        inc count
        JMP loopREAD
        
        exitRead: 
        mov ah,3eh
        mov bx,ctrof
        int 21h 
        
        mov ah,3ch
        lea dx,outp
        mov cx,0
        int 21h
        mov conf, ax
        
        lea si,buf 
        
        xulichuoi: 
        cmp [si],'$'
        je exitXLC
        cmp [si], ' '
        jne tiep
            call xau
            call kiemtra
            mov b1,0
            inc si  
            
            tiep:
            mov al,b1
            xor bx,bx
            mov bl,[si]
            sub bl,30h
            mul muoi
            add ax,bx
            mov b1,al
            inc si
        jmp XULICHUOI  
        exitXLC:
            call kiemtra
              
        MOV AH, 4Ch
        INT 21H
    MAIN ENDP
    
    KIEMTRA PROC
            mov cx,2
        nt: 
            mov al,b1
            div cl
            cmp ah,0
            ja exit
            cmp cl,b1
            inc cx
            jl nt 
            
            lea dx,b2
            mov cx,3
            mov bx,conf
            mov ah, 40h
            int 21h
        exit:    
        ret    
    KIEMTRA ENDP
    XAU PROC
        
        ret
    XAU ENDP
END MAIN