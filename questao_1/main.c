#include <stdio.h>
#include <stdlib.h>

#define QNT_NOTAS 3

int main()
{

  double notas[QNT_NOTAS], pesos[QNT_NOTAS], somaPeso = 0;

  for (int i = 0; i < QNT_NOTAS; i++)
  {
    printf("Digite a nota %d: ", i + 1);
    scanf("%lf", &notas[i]);
    printf("Digite o peso %d: ", i + 1);
    scanf("%lf", &pesos[i]);

    somaPeso += pesos[i];
  }

  double media = 0;
  for (int i = 0; i < QNT_NOTAS; i++)
    media += notas[i] * (pesos[i] / somaPeso);

  printf("A media eh: %.2lf\n", media);

  return 0;
}