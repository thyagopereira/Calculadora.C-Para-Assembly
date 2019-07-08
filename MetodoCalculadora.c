#include <stdio.h>

int Calculadora(int op1 , int op2 , int operacao);

//Calculadora de inteiros . 
int Calculadora( int op1  , int op2 , int operacao){
  // operacao = 1 soma , inteiros ;.
  // operacao = 2 subtração , inteiros ;
  // operacao = 3 multiplicação , inteiros
  // operacao =  4 divisao de inteiros  com % ignorado 
  int result ;

  switch(operacao){
    case 1 :
        result  = op1  + op2 ;
        break;
    case 2 :
        result  = op1 - op2 ;
        break;
    case 3 :
        result  = op1 * op2 ;
        break;
    case 4  :
        result  = op1 / op2 ;
        break;
    default:
         printf("Operacao Invalida");
  }

  return result;

}
