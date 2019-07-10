.file "calculadora.c" /*Extensão do arquivo c*/
.option nopic /*modificador de argumento para RISCV*/
.text /*seção que recebe o código*/
.globl _mulsi3 /*Definição de escopo global*/
.globl _divsi3
.align 2 /*diretivas para controle de alinhamento*/
.globl calculadora /*definição do escopo calculadora*/
.type calculadora, @function /*definição de compatibilidade*/

calculadora:
      li    a5, 2 /*sintetiza a constante 2 (pseudo assembler)*/
      beq   a2,a5,.L2 /*beq verifica a igualdade entre a2 e a5 e pula para .L2*/
      ble   a2,a5,.L11 /*verifica se a2 <= a5 e pula para L11*/
      addi  sp,sp,-16 /*soma instantaneamente sp com -16*/
      sw    ra,12(sp) /*armazenamento relativo na constante ra*/
      li    a5,3 /*sintetiza a constante 3 para a5*/
      beq   a2,a5,.L5 /*verifica a igualdade entre a2 e a5 e pula para L5*/
      li    a5,4 /*sintetiza a constante 4 para a5*/
      bne   a2,a5,.L1 /* verifica se a2 é diferente de a5*/
      call  __divsi3 /*faz a chamada da __divsi3*/
      mv    a4,a0 /*copia o valor de a0 para a4*/
      j     .L1 /*salta para L1*/

.L11:
      li   a5,1 /*sintetiza a constante 1 para a5(pseudo codigo assembler)*/
      bne  a2,a5,.L9 /* verifica se a2 é diferente de a5 e salta para L9*/
      add  a4,a0,a1 /*adiciona a a4, a0 mais a1*/

.L9:
      mv   a0,a4 /*copia o valor de a4 para a0*/
      j    .L9 /*pula para L9*/

.L6:
     call  __mulsi3 /*faz a chamada de __mulsi3*/
     mv    a4,a0 /* copia o valor de a0 para a4*/

.L1:
    mv    a0,a4 /*copia o valor de a4 para a0*/
    lw    ra,12(sp) /*carrega a palavra para ra*/
    addi  sp,sp,16 /*adiciona instantaneamente o valor de sp mais 16 para sp*/
    jr    ra /*registra ra*/
    .size   calculadora, .-calculadora /*acerto de compatibilidade de fonte*/
    .align  2 /*alinhamento em 2*/
    .globl  main /*definição do escopo global de main*/
    .type   main, @function /*definição do tipo da function*/

main:
    addi    sp, sp, -32 /*adiciona instantaneamente o valor de sp mais -32 a sp*/
    sw      ra,28(sp) /*armazenamento relativo em ra*/
    lui     a0,%hi(.LC0) /*endereçamento absoluto de um valor [32:20]*/
    addi    a0,a0,%lo(.LC0) /*adiciona instantaneamente o valor a0 mais o valor da function*/
    call    puts /*chama puts*/
    addi    a1,sp,12 /*adiciona instantaneamente o valor a a1 de sp + 12*/
    lui     s0,%hi(.LC1) /*endereçamento absoluto de um valor [32:20]*/
    addi    a0,s0,%lo(.LC1) /*adiciona a a0 os valores de s0 mais a function .LC1*/
    call    scanf /*chama scanf*/
    lw      a1,12(sp) /*carrega a palavra de sp para a1*/
    lw      a5,8(sp) /*carrega a palavra de sp para a5*/
    add     a1,a1,a5 /*adiciona a a1 os valores de a1 mais a5*/
    lui     a0,%hi(.LC2) /*endereçamento absoluto de um valor [32:20]*/
    addi    a0,a0,%lo(.LC2) /*adiciona instantaneamente a a0 o valor de a0 mais o valor da função LC2*/
    call    printf /*chama printf*/
    lw      a5,8(sp) /*carrega a palavra de sp para a5*/
    sub     a1,a1,a5 /*subtrai para o valor a1 , a1 menos a5*/
    lui     a0,%hi(.LC3) /*endereçamento absoluto de um valor de [32:20]*/
    addi    a0,a0,%lo(.LC3) /*adiciona a a0 o valor de a0 mais o valor da funçao LC3*/
    call    printf /*chama print*/
    lw      a1,8(sp) /*carrega a palavra de sp para a1*/
    lw      a0,12(sp)/*carrega a palavra de sp para a0*/
    call    __mulsi3 /*chama a função de __mulsi3*/
    mv      a1,a0 /*copia o valor de a0 para a1*/
    lui     a0,%hi(LC4) /*endeçamento absoluto de um valor [32:20]*/
    addi    a0,a0,%lo(.LC4) /*adiciona instantaneamente a a0 os valores de a0 mais LC4*/
    call    printf /* chama printf*/
    lw      a1,8(sp) /*carrega a palavra de sp para a1*/
    lw      a0,12(sp) /*carrega a palava de sp para a0*/
    call    __divsi3 /*chama a funçao __divsi3*/
    mv      a1,a0 /*copia o valor de a0 para a1*/
    lui     a0,%hi(.LC5) /*endeçamento absoluto de um valor [32:20]*/
    addi    a0,a0,%lo(.LC5) /*adiciona instantaneamente a a0 os valores de a0 mais o valor da funçao LC5*/
    call    printf /*chama printf*/
    li      a0,0 /*sintetiza a constante 0 para a0*/
    lw      ra,28(sp) /*carrega a palavra de sp para ra*/
    lw      s0,24(sp)/*carrega a palavra de sp para s0*/
    addi    sp,sp,32 /*adiciona instantaneamente a sp os valores de sp mais 32*/
    jr      ra /*registra ra*/
    .size   main, .-main /*define a finalização de main*/
    .section      .rodata.str1.4."aMS".@progbits.1 /*sintetiza a adequação do processo*/
    .align 2 /*finaliza o alinhamento*/

.LC0: /*definição de funçao .LC0*/
    .string "Grupo calculadora = Joao \nThyago \nBeatriz \nMarcella"
.LC1: /*definição de funçao .LC1*/
    .string "%d"
    .zero 1
.LC2:  /*definição de funçao .LC2*/
    .string "Soma %d\n"
    .zero 3
.LC3: /*definição de funçao .LC3*/
    .string "Subtracao %d\n"
    .zero 2
.LC4: /*definição de funçao .LC4*/
    .string "Multiplicacao%d\n"
    .zero 2
.LC5: /*definição de funçao .LC5*/
    .string "Divisao %d\n"
    .ident "GCC: (GNU) 8.1.0"
