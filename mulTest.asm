
             
INCLUDE Irvine32.inc 
.data


.code 

main PROC 
mov eax, 00000011h
mov ebx, 0
xor ebx, ebx
mov ecx, 32

shifting:

    shl eax, 1
    jnc skip_inc
    inc ebx
    call DumpRegs
skip_inc:
    loop shifting

exit
main ENDP 


unknown PROC USES edx 
mul al 
mul ax 
shl eax, 16 
shr eax, 16 
shl edx, 16 
or eax, edx 
ret
unknown ENDP


END main
