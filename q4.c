//find largest prime factor
#include <stdio.h>
extern long long int largeprime(long long int N);
// long long int largeprime(long long int N)
// {  
//     if(N<0)
//     N = -N;
//     if(N==0 || N==1)
//     return -1;
//     long long int i = 2;
//     long long int current;
//     while(N!=0)
//     {
//         if(N%i == 0)
//         {
//             current = N;
//             N = N/i;
//             if(N ==1)
//             return current;
//         }
//         else
//         i++;
//     }
// }
int main()
{ 
    long long int N;
    scanf("%lld",&N);
    long long int x = largeprime(N);
    printf("%lld\n",x);  
}


