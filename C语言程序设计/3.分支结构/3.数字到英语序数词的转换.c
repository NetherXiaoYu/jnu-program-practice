/*************************************************************************
	> File Name: 3.数字到英语序数词的转换.c
	> Author: 施湘岚
	> Mail: admin@cloudtower.cc
	> Created Time: Fri 07 Oct 2022 06:19:42 PM CST
 ************************************************************************/

#include<stdio.h>

int main() {
    int x;
    scanf("%d", &x);
    if(x <= 0) {
        printf("invalid number");
    } else {
        if((x % 100) / 10 == 1) { // 111 1012
            printf("%dth", x);
        } else {
            switch(x % 10) {
                case 1:
                printf("%dst", x);
                break;
                case 2:
                printf("%dnd", x);
                break;
                case 3:
                printf("%drd", x);
                break;
                default:
                printf("%dth", x);
            }
        }
    }
    return 0;
}
