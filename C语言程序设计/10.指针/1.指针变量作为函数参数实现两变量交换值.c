/*************************************************************************
	> File Name: 1.指针变量作为函数参数实现两变量交换值.c
	> Author: 施湘岚
	> Mail: admin@cloudtower.cc
	> Created Time: Mon 14 Nov 2022 08:44:16 PM CST
 ************************************************************************/

#include<stdio.h>
#include<stdlib.h>
#include<string.h>
#include<math.h>

void swap(int *a, int *b) {
    int c = *a;
    *a = *b;
    *b = c;
}

int main(int argc, char* argv[]) {
    int a, b;
    scanf("%d %d", &a, &b);
    swap(&a, &b);
    printf("%d %d", a, b);
    return 0;
}
