//check prime

#include <stdio.h>

extern long long prime(long long N);
// int prime(long long int N)
// { 
//  
//    long long int i;
//    if(N<2)
//    return 1;
//    for(i=2;i<N;i++)
//    {
//        if(N%i == 0)
//        {
//           flag = 1;
// break;
//        }
//    }
//    if(flag == 1)
// return 1;
// return 0;
// }

int main()
{ 
    long long int N;
    scanf("%lld",&N);
    int x = prime(N);
    if(x==1)
    printf("FALSE\n");
    else
    printf("TRUE\n");
    
}


