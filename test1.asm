INCLUDE Irvine32.inc
.data
temp DWORD ?
.code
main PROC
mov eax, 5
mov ebx, 9

mov temp, eax 
mov bh, BYTE PTR temp 
mov bl, BYTE PTR temp + 1 
xchg bl, bh 
xchg ax, bx

call DumpRegs
main ENDP

END main
