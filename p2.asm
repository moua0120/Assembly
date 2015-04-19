;Matthew Moua
;ucdmoua@ucdavis.edu
;Prompts user to enter x, y, z
;Then calculates 1+x+y^2+z^3

INCLUDE Irvine32.inc 

.data

    xinput BYTE "Enter the value of x :  ",0        ;prompts for user input for x
    x DWORD ?                                       ;x variable to be saved later
    yinput BYTE "Enter the value of y :  ",0        ;prompts for user input for y
    y DWORD ?                                       ;y variable
    zinput BYTE "Enter the value of z :  ",0        ;prompts for z input
    z DWORD ?                                       ;z variable
    total BYTE "The value of f(x,y,z) is : ",0      ;function variable
    
.code

main PROC

mov edx, OFFSET xinput  ;set x
call WriteString        ;prompt user on command line
call ReadHex            ;reads user input as hex
mov x, eax              ;save value of eax into xinput
      
mov edx, OFFSET yinput  ;set y
call WriteString        ;prompt user on command line
call ReadHex            ;reads user input as hex
call ysquare            ;calls created function ysquare
mov y, eax              ;save eax value into previous declared y variable
             
mov edx, OFFSET zinput  ;set z
call WriteString        ;prompt user on command line
call ReadHex            ;reads user input as hex
call zcube              ;calls zcube
mov z, eax              ;saves eax value to z
        
mov edx, OFFSET total   ;set total
call WriteString        ;displays on command line
mov eax, 0              ;reset eax value to 0
add eax, 1              ;add to eax, 1
add eax, x              ;add to eax, x
add eax, y              ;add to eax, y^2
add eax, z              ;add to eax, z^3
call WriteHex           ;displays final eax value 
        
exit                    ;exits program

main ENDP               ;end main

ysquare PROC            ;declares ysquare procedures
    mov ebx, eax        ;save value of eax (user prompt) to ebx
    mov esi, 0          ;assigns esi to 0
    mov ecx, ebx        ;loops ebx times (user input for x)
    L1: 
        add esi, eax    ;calculate partial sums 
        loop L1         ;Go back to compute the sum
        mov eax, 0      
        add eax, esi    ;y^2
    ret                 ;returns value
ysquare ENDP            ;ends ysquare procedures

zcube PROC              ;declares zcube Proc
    mov edx, eax        ;save user input for z into edx
    call ysquare        ;calls ysquare procedures
    mov ecx, eax        ;eax holds z*z
    mov ebx, edx        ;save value of user input into ebx
    loop4: add edx, ebx ;calculate partial sums, save into edx
    loop loop4          
    sub edx, ebx        
    mov eax, edx        ;assigns to eax the value of edx
    ret                 ;returns eax
zcube ENDP

END main
