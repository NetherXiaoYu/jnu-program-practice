/*************************************************************************
	> File Name: 1.求和.c
	> Author: 施湘岚
	> Mail: admin@cloudtower.cc
	> Created Time: Sun 30 Oct 2022 10:27:11 AM CST
 ************************************************************************/

#include<stdio.h>
#include<stdlib.h>
#include<math.h>

int calc(int n) {
    if(n == 0) return 0;

    return n + calc(n - 1);
}

int main(int argc, char* argv[]) {
    int n;
    scanf("%d", &n);
    printf("%d", calc(n));
    return 0;
}
