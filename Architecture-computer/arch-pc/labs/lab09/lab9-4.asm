%include 'in_out.asm'

SECTION .data
msg_function db "Функция: f(x) = 2x + 15", 0
msg_input db "Введите x: ", 0
msg_result db "Результат: ", 0

SECTION .bss
res RESB 80
x RESB 80

SECTION .text
global _start

_start:
    mov eax, msg_function
    call sprint
    mov eax, msg_input
    call sprint
    mov ecx, x
    mov edx, 80
    call sread
    mov eax, x
    call atoi
    call _calcul
    mov eax, msg_result
    call sprint
    mov eax, res
    call sprint
    mov eax, [res]
    call iprintLF
    call quit

_calcul:
    push eax
    mov ebx, 2
    mul ebx
    add eax, 15
    mov [res], eax
    pop eax
    ret
