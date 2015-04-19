TITLE lab3 (p3.asm)
; labs 25%
; Hw 15%
; midterm 25%
; final 35%

INCLUDE Irvine32.inc
.data

Labs BYTE 4 DUP(?)
Hws BYTE 4 DUP(?)
MExam BYTE ?
FExam BYTE ?
linput BYTE "Enter the four lab grades",0
lgrade BYTE "Lab0: ",0
hinput BYTE "Enter the four Hw grades",0
hgrade BYTE "Hw0: ",0
meinput BYTE "Enter the midterm exam grade: ",0
feinput BYTE "Enter the final exam grade: ",0
total BYTE "Total Grade = ",0
letter BYTE "Letter Grade = ",0

.code

main PROC

; ---------------- Read lab grades ---------------
mov edx, OFFSET linput
call WriteString
call crlf
mov edi, OFFSET Labs
mov ecx, 4
loop1:
inc [lgrade+3]

mov edx, OFFSET lgrade
call WriteString
call Readint
mov [edi], al
add edi, 1
loop loop1

; ---------------- Read Hw grades ---------------
mov edx, OFFSET hinput
call WriteString
call crlf
mov edi, OFFSET Hws
mov ecx, 4
loop2:
inc [hgrade+2]
mov edx, OFFSET hgrade
call WriteString
call Readint
mov [edi], al
add edi, 1
loop loop2

; ---------------- Read Exams grades ---------------
mov edx, OFFSET meinput
call WriteString
call Readint
mov MExam, al
mov edx, OFFSET feinput
call WriteString
call Readint
mov FExam, al
; ---------------- Compute the total grade ---------
mov esi, OFFSET Labs
mov bl, [esi]
mov dl, bl
movzx ax, bl
inc esi
mov ecx, 3
loop4:
movzx bx, BYTE PTR [esi]
add ax, bx
cmp bl, dl
jg next4
mov dl, bl
next4:
inc esi
loop loop4
movzx dx, dl
sub ax, dx
; multiply LT by 5
mov dx, ax
add ax, ax
add ax, ax
add ax, dx
push ax
mov esi, OFFSET Hws
mov bl, [esi]
mov dl, bl
movzx ax, bl
inc esi
mov ecx, 3
loop5:
movzx bx, BYTE PTR [esi]
add ax, bx
cmp bl, dl
jg next5
mov dl, bl
next5:
inc esi
loop loop5
movzx dx, dl
sub ax, dx
; multiply HT by 3
mov bx, ax
add ax, ax
add ax, bx
pop bx
add ax, bx
push ax
movzx dx, MExam
mov ax, dx
; multiply EM by 15
add ax, ax
add ax, ax
add ax, ax
add ax, ax
sub ax, dx
pop bx
add ax, bx
push ax
movzx ax, FExam
mov bx, ax
; multiply EF by 21
add ax, ax
add ax, ax
mov dx, ax
add ax, ax
add ax, ax
add ax, dx
add ax, bx
pop bx
add ax, bx
; Divide total by 60
mov bx, ax
shr bx, 4
add ax, bx
shr ax, 6
call crlf
mov edx, OFFSET total
call WriteString
movzx eax, ax
call WriteInt
call crlf
; ---------------- Compute the letter grade ---------
mov edx, OFFSET letter
call WriteString
cmp al, 85
jg Alabel
cmp al, 75
jg Blabel
cmp al, 65
jg Clabel
cmp al, 59
mov al, 'F'
jmp done
Alabel:
mov al, 'A'
jmp done
Blabel:
mov al, 'B'
jmp done
Clabel:
mov al, 'C'
jmp done
Dlabel:
mov al, 'D'
done: call WriteChar
call crlf
exit
main ENDP
END main
