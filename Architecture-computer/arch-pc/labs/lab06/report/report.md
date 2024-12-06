---
## Front matter
title: "Шаблон отчёта по лабораторной работе"
subtitle: "Простейший вариант"
author: "Дмитрий Сергеевич Кулябов"

## Generic otions
lang: ru-RU
toc-title: "Содержание"

## Bibliography
bibliography: bib/cite.bib
csl: pandoc/csl/gost-r-7-0-5-2008-numeric.csl

## Pdf output format
toc: true # Table of contents
toc-depth: 2
lof: true # List of figures
lot: true # List of tables
fontsize: 12pt
linestretch: 1.5
papersize: a4
documentclass: scrreprt
## I18n polyglossia
polyglossia-lang:
  name: russian
  options:
	- spelling=modern
	- babelshorthands=true
polyglossia-otherlangs:
  name: english
## I18n babel
babel-lang: russian
babel-otherlangs: english
## Fonts
mainfont: IBM Plex Serif
romanfont: IBM Plex Serif
sansfont: IBM Plex Sans
monofont: IBM Plex Mono
mathfont: STIX Two Math
mainfontoptions: Ligatures=Common,Ligatures=TeX,Scale=0.94
romanfontoptions: Ligatures=Common,Ligatures=TeX,Scale=0.94
sansfontoptions: Ligatures=Common,Ligatures=TeX,Scale=MatchLowercase,Scale=0.94
monofontoptions: Scale=MatchLowercase,Scale=0.94,FakeStretch=0.9
mathfontoptions:
## Biblatex
biblatex: true
biblio-style: "gost-numeric"
biblatexoptions:
  - parentracker=true
  - backend=biber
  - hyperref=auto
  - language=auto
  - autolang=other*
  - citestyle=gost-numeric
## Pandoc-crossref LaTeX customization
figureTitle: "Рис."
tableTitle: "Таблица"
listingTitle: "Листинг"
lofTitle: "Список иллюстраций"
lotTitle: "Список таблиц"
lolTitle: "Листинги"
## Misc options
indent: true
header-includes:
  - \usepackage{indentfirst}
  - \usepackage{float} # keep figures where there are in the text
  - \floatplacement{figure}{H} # keep figures where there are in the text
---

# **Лаборатору Отчет No6**

**Кусоро Майова Джеймс**

# Цель работы

Цель данной лабораторной работы - освоение арифметческих инструкций языка 
ассемблера NASM.

# Выполнение лабораторной работы

## Символьные и численные данные в NASM

С помощью утилиты mkdir создаю директорию, в которой буду создавать файлы 
с программами для лабораторной работы №6. Перехожу в созданный каталог с 
помощью утилиты cd.

![Screenshot1](images/Screenshot1.png)

С помощью утилиты touch создаю файл lab6-1.asm

![Screenshot2](images/Screenshot2.png)

Открываю созданный файл lab6-1.asm, вставляю в него программу вывода 
значения регистра eax

![Screenshot3](images/Screenshot3.png)

Создаю исполняемый файл программы и запускаю его. Вывод программы: символ j, потому что программа вывела символ, соответствующий по системе 
ASCII сумме двоичных кодов символов 4 и 6 

![Screenshot4](images/Screenshot4.png)

Изменяю в тексте программы символы "6" и "4" на цифры 6 и 4

![Screenshot5](images/Screenshot5.png)

Создаю новый исполняемый файл программы и запускаю его. Теперь вывелся символ с кодом 10, это символ перевода строки, этот символ не отображается при выводе на экра

![Screenshot6](images/Screenshot6.png)

Создаю новый файл lab6-2.asm с помощью утилиты touch.Ввожу в файл текст другойпрограммы для вывода значения регистра eax

![Screenshot7](images/Screenshot7.png)

Создаю и запускаю исполняемый файл lab6-2.. Теперь вывод число 106, потому что программа позволяет вывести именно число, а не символ, хотя все еще происходит именно сложение кодов символов "6" и "4

![Screenshot8](images/Screenshot8.png)

Заменяю в тексте программы в файле lab6-2.asm символы "6" и "4" на числа 6 и 4

![Screenshot9](images/Screenshot9.png)

Создаю и запускаю новый исполняемый файл. Теперь программа складывает не соответствующие символам коды в системе ASCII, а сами числа, поэтому вывод 10

![Screenshot10](images/Screenshot10.png)

## Выполнение арифметических операций в NASM

Создаю файл lab6-3.asm с помощью утилиты touch.Ввожу в созданный файл текст программы для вычисления значения выражения f(x) = (5 * 2 + 3)/3

![Screenshot11](images/Screenshot11.png)

Создаю исполняемый файл и запускаю его

![Screenshot12](images/Screenshot12.png)

Создаю файл variant.asm с помощью  утилиты touch.Ввожу в файл текст программы для вычисления варианта задания по номеру студенческого билета

![Screenshot13](images/Screenshot13.png)

Создаю и запускаю исполняемый файл.. Ввожу номер своего студ. билета с клавиатуры, программа вывела, что мой вариант - 2

![Screenshot14](images/Screenshot14.png)

### Ответы на вопросы по программе

1. За вывод сообщения "Ваш вариант" отвечают строки кода:

```NASM
mov eax,rem
call sprint
```

2. Инструкция mov ecx, x используется, чтобы положить адрес вводимой строки x в регистр ecx
mov edx, 80 - запись в регистр edx длины вводимой строки 
call sread - вызов подпрограммы из внешнего файла, обеспечивающей ввод сообщения с клавиатуры  

3. call atoi используется для вызова подпрограммы из внешнего файла, которая преобразует ascii-код символа в целое число и записывает результат в регистр eax

4. За вычисления варианта отвечают строки:

```NASM
xor edx,edx ; обнуление edx для корректной работы div
mov ebx,20 ; ebx = 20
div ebx ; eax = eax/20, edx - остаток от деления
inc edx ; edx = edx + 1
```

5. При выполнении инструкции div ebx остаток от деления записывается в регистр edx

6. Инструкция inc edx увеличивает значение регистра edx на 1

7. За вывод на экран результатов вычислений отвечают строки:

```NASM
mov eax,edx
call iprintLF
```

## Выполнение заданий для самостоятельной работы

Создаю файл lab6-4.asm с помощью утилиты touch.Открываю созданный файл для редактирования, ввожу в него текст программы для вычисления значения выражения (11 + x) * 2 - 6

![Screenshot15](images/Screenshot15.png)

Создаю и запускаю исполняемый файл. При вводе значения 4, вывод - 24.

![Screenshot16](images/Screenshot16.png)

# Выводы

При выполнении данной лабораторной работы я освоила арифметические инструкции языка ассемблера NASM.

**Ссылка на официальный сайт** [Github](https://github.com/James-4321/Kusoro/tree/main/Architecture-computer/arch-pc/labs/lab06)


