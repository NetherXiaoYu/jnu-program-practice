/*************************************************************************
	> File Name: 4.阶乘数列.c
	> Author: 施湘岚
	> Mail: admin@cloudtower.cc
	> Created Time: Sun 30 Oct 2022 11:27:28 AM CST
 ************************************************************************/

#include<stdio.h>
#include<stdlib.h>
#include<math.h>

int n;

long long int calc(long long sum, long long x, int now) {
    if(now > n) return sum;
    x *= now;
    sum += x;
    return calc(sum, x, now + 1);
}

int main(int argc, char* argv[]) {
    scanf("%d", &n);
    printf("%lld", calc(1, 1, 2));
    return 0;
}
