%include 'in_out.asm'     ; Подключаем внешний файл для вывода и завершения

SECTION .data
a db 17                   ; Замените значением 'a' из вашего варианта
b db 23                   ; Замените значением 'b' из вашего варианта
c db 45                   ; Замените значением 'c' из вашего варианта
smallest db 0             ; Переменная для хранения минимального значения
msg1 db 'Наименьшее значение: ', 0

SECTION .text
GLOBAL _start

_start:
    ; Загружаем 'a' в AL и 'b' в BL
    mov al, [a]           ; Загружаем значение 'a' в AL
    mov bl, [b]           ; Загружаем значение 'b' в BL
    cmp al, bl            ; Сравниваем 'a' с 'b'
    jle _check_c          ; Если 'a' <= 'b', переходим к проверке 'c'
    mov al, bl            ; Иначе, минимальное значение — это 'b'

_check_c:
    ; Сравниваем текущее минимальное значение (AL) с 'c'
    mov bl, [c]           ; Загружаем значение 'c' в BL
    cmp al, bl            ; Сравниваем минимальное значение с 'c'
    jle _store_smallest   ; Если минимальное значение <= c, переходим к сохранению
    mov al, bl            ; Иначе, минимальное значение — это 'c'

_store_smallest:
    ; Сохраняем минимальное значение в переменной 'smallest'
    mov [smallest], al    ; Сохраняем минимальное значение в памяти

    ; Переходим к выводу результата
    jmp _print_result

_print_result:
    ; Выводим сообщение: "Наименьшее значение:"
    mov eax, msg1
    call sprint

    ; Выводим наименьшее значение
    mov al, [smallest]    ; Загружаем минимальное значение из памяти
    call iprintLF

_exit:
    call quit
