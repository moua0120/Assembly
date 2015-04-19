TITLE INVESTIGATE 
INCLUDE Irvine32.inc 
.code 
;This program checks if the DF flag is clear or set.

main PROC 

    mov ecx, eax        ;rep movsw takes in eax input
;REP - repeats while ECX > 0
again:
    cmp ecx, 0
    jg greater          ;while ECX > 0
    jmp finish          ;if ECX = 0, then ignored and finish
    
greater:
    
DFclear:
    add si, 2
    add di, 2
    mov di, [si]
    exit
DFset:
    sub si, 2
    sub di, 2
    mov di, [si]
    
    

finish:

    exit
  

    exit 
main ENDP 
END main
