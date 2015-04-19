;Matthew Moua
;ucdmoua@ucdavis.edu
;This program prompts for inputs, and takes the average of all the numbers and gives the average of the numbers with the 
;corresponding sign.
;

INCLUDE Irvine32.inc 

.data

input BYTE "Enter an integer (0 to quit): ",0
positive BYTE "Number of positive integers: ",0
negative BYTE "Number of negative integers: ",0
posavg BYTE "Average of positive integers: ",0
negavg BYTE "Average of negative integers: ",0

count DWORD ?
count1 DWORD ?
.code

main PROC

mov ecx, 10
mov ebx, 0
mov esi, 0
mov count, 0
mov count1, 0

L1:
    mov edx, OFFSET input
    call WriteString
    call ReadInt
    cmp eax, 0
    jl negs
    
    add ebx, eax            ;positives add up
    inc count
    
    cmp eax, 0
    jz posnext
    loop L1
negs:
    add esi, eax
    inc count1
    loop L1

posnext:
    mov edx, OFFSET positive
    call WriteString
    sub count, 1
    mov eax, count
    call WriteInt
    call crlf
    
    mov edx, OFFSET posavg
    call WriteString
    mov eax, ebx
    cdq
    idiv count
    call WriteInt 
    call crlf   

    mov edx, OFFSET negative
    call WriteString
    mov eax, count1
    call WriteInt
    call crlf

    mov edx, OFFSET negavg
    call WriteString
    mov eax, esi
    cdq
    idiv count1
    call WriteInt
exit


    

main ENDP              
   

END main
