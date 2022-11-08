/*************************************************************************
	> File Name: 2.递归实现输出一个整数的逆序.c
	> Author: 施湘岚
	> Mail: admin@cloudtower.cc
	> Created Time: Tue 08 Nov 2022 07:19:20 PM CST
 ************************************************************************/

#include<stdio.h>
#include<stdlib.h>
#include<math.h>

long long calc(int n) {
    long long tmp = 0;
    while(n > 0) {
        tmp *= 10;
        tmp += n % 10;
        n /= 10;
    }
    return tmp;
}

int main(int argc, char* argv[]) {
    int n;
    scanf("%d", &n);
    printf("%lld", calc(n));
    return 0;
}
