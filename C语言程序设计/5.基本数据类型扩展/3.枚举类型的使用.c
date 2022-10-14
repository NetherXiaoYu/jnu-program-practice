/*************************************************************************
	> File Name: 3.枚举类型的使用.c
	> Author: 施湘岚
	> Mail: admin@cloudtower.cc
	> Created Time: Fri 14 Oct 2022 02:45:36 PM CST
 ************************************************************************/

#include<stdio.h>
#include<stdlib.h>
#include<math.h>

int main(int argc, char* argv[]) {
    char colors[7][20] = {"red", "orange", "yellow", "green", "cyan", "blue", "purple"};
    int n;
    scanf("%d", &n);
    if(n <= 6) {
        printf("%s", colors[n]);
    } else {
        printf("unknown color");
    }
    return 0;
}
