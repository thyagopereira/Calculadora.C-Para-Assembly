#include <stdio.h>

int Calculadora(int op1 , int op2 , int operacao);

int main(void) {
    // Testes
    int resultado;
    resultado =  Calculadora(2, 2 ,1);
    printf("%d\n " ,resultado);
    resultado  = Calculadora(2,2,2);
    printf("%d\n" ,resultado);
    resultado =  Calculadora(2, 2,3);
    printf("%d\n" ,resultado);
    resultado  = Calculadora(2,2,4);
    printf("%d\n" ,resultado);
    resultado = Calculadora(2, 2, 5);

}


//Caluraldora de inteiros . 
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
