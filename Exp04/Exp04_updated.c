#include <stdio.h>
#include <string.h>

char result[20][20], copy[3], states[20][20];

void display(int n) {
  printf("\nEpsilon closure of %s = { ", copy);
  for (int k=0; k<n; k++) {
    printf(" %s", result[k]);
  }
  printf(" }\n");
}

int main() {
  FILE * fp;
  fp = fopen("input.dat", "r");
  char state[3];
  int i, n, k;
  char state1[3], input[3], state2[3];
  printf("\nEnter the no of states : ");
  scanf("%d", &n);
  printf("\nEnter the states : ");
  for (k=0; k<n; k++) {
    scanf("%s", states[k]);
  }

  for (k=0; k<n; k++) {
    i = 0;
    strcpy(state, states[k]);
    strcpy(copy, state);
    strcpy(result[i++], state);
    while (!feof(fp)) {
      fscanf(fp, "%s%s%s", state1, input, state2);

      if (strcmp(state, state1) == 0) {
        if (strcmp(input, "e") == 0) {
          strcpy(result[i++], state2);
          strcpy(state, state2);
        }
      }

    }
    display(i);
    rewind(fp);
  }

  return 0;
}

/*
gcc EXP04.c 
./a.out

Enter the no of states: 3

Enter the states :q0 q1 q2

Epsilon closure of q0 = {  q0 q1 q2 }

Epsilon closure of q1 = {  q1 q2 }

Epsilon closure of q2 = {  q2 }
*/
