/*************************************************************************
	> File Name: 2.简易计算器的设计.c
	> Author: 施湘岚
	> Mail: admin@cloudtower.cc
	> Created Time: Fri 14 Oct 2022 02:22:36 PM CST
 ************************************************************************/

#include<stdio.h>
#include<stdlib.h>
#include<math.h>
#include<string.h>

int find_op(const char* s, char c) {
    for(int i = 0; i < strlen(s); i++) {
        if(s[i] == c) return i + 1;
    }
    return 6;
}

int main(int argc, char* argv[]) {
    char s[1005] = "Y", ops[6] = "+-*/%";
    int a = 0, b = 0, op = 0;
    while(s[strlen(s) - 1] == 'Y') {
        a = b = op = 0;
        printf("输入运算表达式:");
        scanf("%s", s);
        for(int i = 0; i < strlen(s) - 1; i++) {
            if(s[i] >= '0' && s[i] <= '9') {
                a *= 10;
                a += s[i] - '0';
            } else {
                op += find_op(ops, s[i]);
                b = a;
                a = 0;
            }
        }
        switch(op) {
            case 1:
                printf("%d+%d=%d", b, a, b + a);
                break;
            case 2:
                printf("%d-%d=%d", b, a, b - a);
                break;
            case 3:
                printf("%d*%d=%d", b, a, b * a);
                break;
            case 4:
                printf("%d/%d=%d", b, a, b / a);
                break;
            case 5:
                printf("%d%%%d=%d", b, a, b % a);
                break;
            default:
                printf("非法表达式");
                break;
        }
        printf("\n继续吗？(Y/N):");
    }
    return 0;
}
