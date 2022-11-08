/*************************************************************************
	> File Name: 3.将整数递归转换成字符串.c
	> Author: 施湘岚
	> Mail: admin@cloudtower.cc
	> Created Time: Tue 08 Nov 2022 07:22:26 PM CST
 ************************************************************************/

#include<stdio.h>
#include<stdlib.h>
#include<string.h>
#include<stdbool.h>
#include<math.h>

char* ans;

int convert(int n, bool last_digit) {
    if(n < 0) return 0;
    if(last_digit) {
        ans[0] = (char) n + 48;
        ans[1] = ' ';
        return 2;
    }
    
    int tmp = convert(n / 10, ((n / 10) < 10));
    ans[tmp] = (char) (n % 10) + 48;
    ans[tmp + 1] = ' ';
    return tmp + 2;
}

int main(int argc, char* argv[]) {
    int n;
    scanf("%d", &n);
    ans = (char *) malloc(sizeof(char) * n);
    convert(n, false);
    printf("%s", ans);
    free(ans);
    return 0;
}
