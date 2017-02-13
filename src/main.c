#include <stdint.h>
#include <stdio.h>

extern int32_t rust_sum(size_t size, int32_t input[]);

int main() {
    int input[] = {4,5,6};
    int output = rust_sum(sizeof(input)/sizeof(int), input);
    printf("sum(%d", input[0]);
    for(int i=1; i<sizeof(input)/sizeof(int); i++) {
      printf(",%d", input[i]);
    }
    printf(") = %d\n", output);
    return 0;
}
