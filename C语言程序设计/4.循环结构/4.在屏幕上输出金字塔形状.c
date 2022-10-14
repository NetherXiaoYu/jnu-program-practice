/*************************************************************************
	> File Name: 4.在屏幕上输出金字塔形状.c
	> Author: 施湘岚
	> Mail: admin@cloudtower.cc
	> Created Time: Sat 08 Oct 2022 08:26:39 PM CST
 ************************************************************************/

#include<stdio.h>
#include<stdlib.h>
#include<math.h>

int main(int argc, char* argv[]) {
    int n;
    char c;
    scanf("%d %c", &n, &c);
    for(int i = 1; i <= n; i++) {
        for(int j = i; j < n; j++) printf(" ");
        for(int j = 0; j < (i + i - 1); j++) printf("%c", c);
        if(i != n) printf("\n");
    }
    return 0;
}
