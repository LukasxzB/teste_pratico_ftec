#include <stdio.h>
#include <stdlib.h>

int main()
{

  int qntNumeros;
  printf("Digite a quantidade de numeros: ");
  scanf("%d", &qntNumeros);

  if (qntNumeros <= 0)
  {
    printf("Quantidade de numeros invalida\n");
    return 1;
  }

  int *numeros = (int *)malloc(qntNumeros * sizeof(int));
  for (int i = 0; i < qntNumeros; i++)
  {
    printf("Digite o %do numero (apenas inteiros): ", i + 1);
    scanf("%d", &numeros[i]);
  }

  // Bubble sort
  for (int i = 0; i < qntNumeros; i++)
  {
    for (int j = 0; j < qntNumeros - 1; j++)
    {
      if (numeros[i] < numeros[j])
      {
        int temp = numeros[i];
        numeros[i] = numeros[j];
        numeros[j] = temp;
      }
    }
  }

  printf("Numeros ordenados: ");
  for (int i = 0; i < qntNumeros; i++)
    printf("%d ", numeros[i]);

  return 0;
}