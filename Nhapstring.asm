.MODEL  Small
      
      .STACK      100h

      .DATA
      prompt      DB "Enter a string: $"
      prompt2      DB 10, 13, "You typed: $"
      inBuff      DB 21, ?, 21 DUP('$')

      .CODE

Start:
      mov      ax, @data
      mov      ds, ax
      mov      ah, 09h
      lea      dx, prompt
      int      21h

      mov      ah, 0Ah
      lea      dx, inBuff
      int      21h

      mov      ah, 09h
      lea      dx, prompt2
      int      21h

      lea      dx, [inBuff + 2]
      int      21h

      mov      ax, 4c00h ;
      int      21h ;
      END      Start
