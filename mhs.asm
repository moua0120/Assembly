;Matthew Moua
;999198117
;ucdmoua@ucdavis.edu
;

INCLUDE Irvine32.inc 

.data

    minstosec BYTE "Enter minutes :  ",0        ;prompts for user input for y
    hourstosec BYTE "Enter hours :  ",0        ;prompts for z input
    hour BYTE "hours: ",0
    min BYTE "mins: ",0
    sec BYTE "sec: ",0
    
.code

main PROC

 mov edx, OFFSET minstosec
    call WriteString
    call ReadDec
    call mintosec
    call WriteDec

 mov edx, OFFSET hourstosec
    call WriteString
    call ReadDec
    call hourtosec
    call WriteDec

    call mhstosec
    call WriteDec
exit

main ENDP               ;end main

mintosec PROC            ;declares ysquare procedures

   
    mov ecx, eax
    mov edx, eax
    mov eax, 0
    L1:
        add eax, 60
        loop L1
    
    mov ecx, eax
    ret                 ;returns value
mintosec ENDP            ;ends ysquare procedures


hourtosec PROC              ;declares zcube Proc
   

    call mintosec
    mov ecx, 60
    mov edx, eax
    mov eax, 0
    L2:
        add eax, edx
        loop L2

    mov ecx, eax
    ret
hourtosec ENDP

mhstosec PROC

    mov edx, OFFSET hour
    call WriteString
    call ReadDec
    call hourtosec
    mov esi, eax

    mov edx, OFFSET min
    call WriteString
    call ReadDec
    call mintosec
    mov ebx, eax

    mov edx, OFFSET sec
    call WriteString
    call ReadDec
    mov ecx, eax

    mov eax, esi
    add ecx, eax
    add ecx, ebx
    call DumpRegs
    mov eax, ecx
    call DumpRegs
    ret

mhstosec ENDP




END main
