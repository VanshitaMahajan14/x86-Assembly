//sum of squares
#include <stdio.h>

extern long long sums(long long N);

// long long int sum_square(long long int N)
// { 
//     long long int A = N;
//     long long int B = N+1;
//     long long int C = 2*N + 1;
//     A = A*B*C;
//     A = A/6;
//     return A;
// }
// long long int sum_s(long long int N)
// {
//     long long int i = 1;
//     long long int sum = 0;
//     while(i<=N)
//     {
//         sum = sum + i*i;
//         i++;
//     }
//     return sum;
// }

int main()
{ 
    long long int N;
    scanf("%lld",&N);
    long long sum = sums(N);
    printf("%lld\n",sum);
}



