;Matthew Moua
;ucdmoua@ucdavis.edu
;

INCLUDE Irvine32.inc 

.data

inputx BYTE "Enter the value of x in Decimal: ",0
inputy BYTE "Enter the value of y in Decimal: ",0 
gcd BYTE "Greatest common divisor = ",0

.code

main PROC

mov edx, OFFSET inputx      ;x input
call WriteString
call ReadDec
mov ebx, eax                ;ebx = x

mov edx, OFFSET inputy      ;y input
call WriteString
call ReadDec                ;eax = y

cmp ebx, eax            
jl less                 ;jmp if ebx < eax or x < y
je equal
jmp prog
equal:
    mov edx, OFFSET gcd     ;if x = y, gcd = x or gcd = y
    call WriteString
    call WriteDec
    exit
prog:
    mov ecx, eax            ;save y value
    mov eax, ebx            ;move x value to eax
    cdq
    div ecx                 ;x/y
    mov eax, edx            ;return the remainder
    push eax                ;save eax value = rem
    mov ebx, eax            ;ebx = rem
    mov eax, ecx            ;eax = y
    cdq
    div ebx                 ;check y/rem
    mov eax, edx            ;eax = remainder
    cmp eax, 0              ;jmp to next if y/rem = 0
    jz next

    mov edx, OFFSET gcd     ;if y/rem not equal to 0, return new remainder
    call WriteString
    call WriteDec
    pop eax
    exit

next:
    pop eax                 ;if y/rem = 0, pop eax and return its original value
    mov edx, OFFSET gcd
    call WriteString
    call WriteDec
    exit

less:
    cdq                     ;if x < y, then do x/y and return rem
    div ebx
    mov eax, edx

    push eax                ;save eax value = rem
    mov esi, eax            ;esi = rem
    mov eax, ebx            ;eax = x
    cdq
    div esi                 ;check x/rem
    mov eax, edx            ;eax = remainder
    cmp eax, 0              ;jmp to next if y/rem = 0
    jz next

    mov edx, OFFSET gcd
    call WriteString
    call WriteDec
    pop eax
    exit

main ENDP              
   

END main
