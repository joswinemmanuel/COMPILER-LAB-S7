#include <stdio.h>
#include <time.h>

void fun1() {
  for (int i = 0; i < 5; i++)
    printf("Hello\n");
}
void fun2() {
  printf("Hello\n");
  printf("Hello\n");
  printf("Hello\n");
  printf("Hello\n");
  printf("Hello\n");
}
void main() {
  clock_t t1, t2;
  t1 = clock();
  fun1();
  t1 = clock() - t1;
  double time_taken1 = ((double) t1) / CLOCKS_PER_SEC;
  printf("/normal loop/\n");
  printf("Time taken: %f seconds\n\n", time_taken1);
  t2 = clock();
  fun2();
  t2 = clock() - t2;
  double time_taken2 = ((double) t2) / CLOCKS_PER_SEC;
  printf("/unrolled loop/\n");
  printf("Time taken: %f seconds\n", time_taken2);
}

/*
Hello
Hello
Hello
Hello
Hello
/normal loop/
Time taken: 0.000086 seconds

Hello
Hello
Hello
Hello
Hello
/unrolled loop/
Time taken: 0.000015 seconds
*/
