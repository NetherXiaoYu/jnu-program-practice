/*************************************************************************
	> File Name: 1.求三个数中最大的数.c
	> Author: 施湘岚
	> Mail: admin@cloudtower.cc
	> Created Time: Fri 07 Oct 2022 06:16:51 PM CST
 ************************************************************************/

#include<stdio.h>
#include<stdlib.h>
#include<math.h>

int max(int a, int b) {
    return (a > b) ? a : b;
}

int main(int argc, char* argv[]) {
    int a, b ,c;
    scanf("%d %d %d", &a, &b, &c);
    printf("input a,b,c:\nmax:%d", max(a, max(b, c)));

    return 0;
}
