/*************************************************************************
	> File Name: 2.求两个自然数的最大公约数.c
	> Author: 施湘岚
	> Mail: admin@cloudtower.cc
	> Created Time: Sat 08 Oct 2022 08:12:55 PM CST
 ************************************************************************/

#include<stdio.h>
#include<stdlib.h>
#include<math.h>

int gcd(int a, int b) {
    if(a < b) {
        int c = a;
        a = b;
        b = c;
    }

    if(a % b == 0) return b;
    return gcd(b, a % b);
}

int main(int argc, char* argv[]) {
    int a, b;
    scanf("%d %d", &a, &b);
    printf("%d,%d的最大公约数是:%d", a, b, gcd(a, b));
    return 0;
}
