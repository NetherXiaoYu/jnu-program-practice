/*************************************************************************
	> File Name: 6.公约公倍数.c
	> Author: 施湘岚
	> Mail: admin@cloudtower.cc
	> Created Time: Sun 30 Oct 2022 12:43:41 PM CST
 ************************************************************************/

#include<stdio.h>
#include<stdlib.h>
#include<math.h>

int gcd(int a, int b) {
    if(b == 0) return a;

    if(a < b) {
        int c = a;
        a = b;
        b = c;
    }

    return gcd(b , a % b);
}

int main(int argc, char* argv[]) {
    int a, b, c;
    scanf("%d %d", &a, &b);
    c = gcd(a, b);
    printf("%d %d", c, (a * b) / c);
    return 0;
}
