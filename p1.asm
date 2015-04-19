;Matthew Moua
;ucdmoua@ucdavis.edu
;
;This assignment aims at computing the function f(n) = n!+n^3+n^2+n 
;(where n! is the fac- torial of n) for several n values. 
;Write an assembly program that computes f(1), f(2), f(3),..., and f(10). 
;Note that n! is defined as follows: n! = n(n-1)(n-2) ... (3)(2)(1) or n! = n[(n-1)!] . 
;Also, note that 1! = 0! = 1. 

TITLE Sum Factorial
; This program computes f(n) = n! + n^3 + n^2 + n for several n values.

INCLUDE Irvine32.inc
.data

.code
main PROC

mov ebx, 0  ;start count n = 0
mov ecx, 10 ;start loop, iterates 10 times

mov edx, 1 ;this will be n!
mov esi, 1 ;this will be n^2
    
L1:
    inc ebx            ;inc n by 1 each time it loops
    mov edi, ecx       ;save count number of ecx
    mov eax, ebx       ;eax = n


    mov ecx, ebx       ;reassign ecx to ebx.
    sub ecx, 1         ;loops n-1 times
    mov esi, ebx       ;assigns esi, n value
L2:                    ;n^2 loop  
    add esi, ebx       ; n^2
    loop L2
        
    cmp edx, 1     ;compares if edx = 1,
    je looop       ;if edx = 1, go to looop, THIS skips over the L3 loop
        
    looop2:            ;if ebx = 2, go here, start the loop
        mov ecx, ebx   ;assign count value 
        sub ecx, 1     ;assign n-1 looping times
        mov ebp, edx   ;assign to ebp edx, saves the value of edx
L3:
    add edx, ebp       ;since edx is saved every loop, add edx with itself
    loop L3

    looop:             ;if edx = 1, start here   
       
    cmp edx, 2         ;compares if edx = 2, 
    je looop3          ;if edx = 2, go to looop3
    
    cmp ebx, 2         ;compares if EBX = 2
    je looop2          ;if it does start or jump to looop2
    
    looop3:            ;CONTINUE if edx = 2

    mov ecx, esi       ;assign counting value, esi OR n^2 times
    sub ecx, 1         ;loops n^2-1 times
    
L4:                    ;n^3 loop
    add eax, ebx; n^3  ;add ebx to eax n^2-1 times!!
    loop L4           
       
    
    add eax, esi       ; n^3 + n^2            
    add eax, ebx       ; n^3 + n^2 + n
    add eax, edx       ; n^3 + n^2 + n + n!
    
    call DumpRegs
          
    mov ecx, edi       ; RESTORES counting value!
    loop L1

exit

main ENDP

END main
