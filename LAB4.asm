%macro IO 4
    mov rax, %1
    mov rdi, %2
    mov rsi, %3
    mov rdx, %4
    syscall
%endmacro

section .data
    m1 db "Enter X (2 hex digits): "
    l1 equ $-m1

    m2 db 10,"Enter Y (2 hex digits): "
    l2 equ $-m2

    msg db 10,"Result: "
    l3 equ $-msg

    nl db 10

section .bss
    numascii resb 3
    num1     resb 1
    num2     resb 1
    result   resb 2
    dispbuff resb 4

section .text
global _start
_start:

; -------- INPUT X --------
    IO 1,1,m1,l1
    IO 0,0,numascii,3
    call fetchInput
    mov [num1], bl

; -------- INPUT Y --------
    IO 1,1,m2,l2
    IO 0,0,numascii,3
    call fetchInput
    mov [num2], bl

; -------- MULTIPLICATION (SUCCESSIVE ADD) --------
    call successiveAdd

; -------- DISPLAY RESULT --------
    IO 1,1,msg,l3
    mov bx, [result]
    call print

    IO 1,1,nl,1

; -------- EXIT --------
    mov rax,60
    xor rdi,rdi
    syscall

; =====================================
; SUCCESSIVE ADDITION SUBROUTINE
; result = num1 added num2 times
; =====================================

successiveAdd:
    mov cl, [num2]     ; multiplier
    mov al, [num1]     ; multiplicand
    xor bx, bx         ; result = 0

add_loop:
    add bx, ax
    dec cl
    jnz add_loop

    mov [result], bx
ret

; =====================================
; FETCH HEX INPUT (2 DIGITS)
; =====================================

fetchInput:
    xor bl, bl
    mov ecx, 2
    mov rsi, numascii

next_digit:
    rol bl, 4
    mov al, [rsi]
    cmp al, '9'
    jbe digit
    sub al, 7
digit:
    sub al, '0'
    add bl, al
    inc rsi
    loop next_digit
ret

; =====================================
; PRINT 16-BIT HEX NUMBER
; =====================================

print:
    mov ecx, 4
    mov rdi, dispbuff

print_loop:
    rol bx, 4
    mov al, bl
    and al, 0Fh
    cmp al, 9
    jbe ok
    add al, 7
ok:
    add al, '0'
    mov [rdi], al
    inc rdi
    loop print_loop

    IO 1,1,dispbuff,4
Ret

