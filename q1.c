//quotient and remainder M/N
#include <stdio.h>
extern long long quotient(long long int M,long long int N);
extern long long rem(long long int M,long long int N);

// long long int quotient(long long int M, long long int N)
// {  
//     int flag = 0;
//     if(M<0)l11
//     { 
//         M = -M;
//         if(N>0)
//         flag = 1;
//     }
//     else if(N < 0)l16
//     {
//     N = -N;
//     if(M>0)
//     flag = 1;
//     }
// if(M<0 and N<0)
// {
//      M=-M;
//      N=-N;
// }

//     long long int count = 0;
//     while(M>=N)
//     {   
//         count++;
//         M = M - N;   
//     }
//     return count;
// }

//  long long int rem(long long int M, long long int N)
// {   
//     int flag;
//  if(M<0)
//  {flag = 1;
//   M = -M;
//  }
// if(N < 0)
// N = -N;
//     long long int counter = 0;  
//      while(M>=N)
//     {   
//         M = M - N;
//     }
//     if(flag == 1)
//     { 
//     M = -M;
//     return M;
//     }
//     else
//     return M;
// }

int main()
{  
     long long int M,N;
     scanf("%lld %lld",&M,&N);
     long long int q,r;
    q = quotient(M,N);
     r = rem(M,N);
     printf("%lld %lld\n",q,r);
}


