//calculate gcd

#include <stdio.h>
extern long long int gcd(long long int M,long long int N);
// long long int gcd(long long int M,long long int N)
// {   
    // if(M<0) 
//     M = -M;
//     if(N<0)
//     N = -N;
//     if(M==N)
//     return M;

//     if(M<N)
//     {
//     for(long long int i=M;i>=1;i--)
//     {
//         if(M%i ==0 && N%i ==0)
//         return i;
//     }
//     }
//     else
//     for(long long int i=N;i>=1;i--)
//     {
//         if(M%i ==0 && N%i ==0)
//         return i;
//     } 
//     return M;
// }

int main()
{
    long long int M,N;
    scanf("%lld %lld",&M,&N);
    long long int x = gcd(M,N);
    printf("%lld ",x);
}


