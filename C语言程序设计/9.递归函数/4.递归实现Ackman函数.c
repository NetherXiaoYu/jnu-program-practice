/*************************************************************************
	> File Name: 4.递归实现Ackman函数.c
	> Author: 施湘岚
	> Mail: admin@cloudtower.cc
	> Created Time: Tue 08 Nov 2022 07:39:31 PM CST
 ************************************************************************/

#include<stdio.h>
#include<stdlib.h>
#include<string.h>
#include<math.h>

long long acm(int m, int n) {
    if(m == 0 && n > 0) return n + 1;
    if(m > 0 && n == 0) return acm(m - 1, 1);
    if(n > 0 && m > 0) return acm(m - 1, acm(m, n - 1));
    return 0;
}

int main(int argc, char* argv[]) {
    int n, m;
    scanf("%d %d", &m, &n);
    printf("%lld", acm(m, n));
    return 0;
}
