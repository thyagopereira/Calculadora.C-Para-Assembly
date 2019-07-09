.file "calculadora.c"
.option nopic
.text
.globl _mulsi3
.globl _divsi3
.align 2
.globl calculadora
.type calculadora, @function

calculadora:
      li    a5, 2
      beq   a2,a5,.L2
      ble   a2,a5,.L11
      addi  sp,sp,-16
      sw    ra,12(sp)
      li    a5,3
      beq   a2,a5,.L5
      li    a5,4
      bne   a2,a5,.L1
      call  __divsi3
      mv    a4,a0
      j     .L1

.L11:
      li   a5,1
      bne  a2,a5,.L9
      add  a4,a0,a1

.L9:
      mv   a0,a4
      j    .L9

.L6:
     call  __mulsi3
     mv    a4,a0

.L1:
    mv    a0,a4
    lw    ra,12(sp)
    addi  sp,sp,16
    jr    ra
    .size   calculadora, .-calculadora
    .align  2
    .globl  main
    .type   main, @function

main:
    addi    sp, sp, -32
    sw      ra,28(sp)
    lui     a0,%hi(.LC0)
    addi    a0,a0,%lo(.LC0)
    call    puts
    addi    a1,sp,12
    lui     s0,%hi(.LC1)
    addi    a0,s0,%lo(.LC1)
    call    scanf
    lw      a1,12(sp)
    lw      a5,8(sp)
    add     a1,a1,a5
    lui     a0,%hi(.LC2)
    addi    a0,a0,%lo(.LC2)
    call    printf
    lw      a5,8(sp)
    sub     a1,a1,a5
    lui     a0,%hi(.LC3)
    addi    a0,a0,%lo(.LC3)
    call    printf
    lw      a1,8(sp)
    lw      a0,12(sp)
    call    __mulsi3
    mv      a1,a0
    lui     a0,%hi(LC4)
    addi    a0,a0,%lo(.LC4)
    call    printf
    lw      a1,8(sp)
    lw      a0,12(sp)
    call    __divsi3
    mv      a1,a0
    lui     a0,%hi(.LC5)
    addi    a0,a0,%lo(.LC5)
    call    printf
    li      a0,0
    lw      ra,28(sp)
    lw      s0,24(sp)
    addi    sp,sp,32
    jr      ra
    .size   main, .-main
    .section      .rodata.str1.4."aMS".@progbits.1
    .align 2

.LC0:
    .string "Grupo calculadora = Joao \nThyago \nBeatriz \nMarcella"
.LC1:
    .string "%d"
    .zero 1
.LC2:
    .string "Soma %d\n"
    .zero 3
.LC3:
    .string "Subtracao %d\n"
    .zero 2
.LC4:
    .string "Multiplicacao%d\n"
    .zero 2
.LC5:
    .string "Divisao %d\n"
    .ident "GCC: (GNU) 8.1.0"
