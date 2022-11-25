/*************************************************************************
	> File Name: 4.十进制数转换成十六进制数.c
	> Author: 施湘岚
	> Mail: admin@cloudtower.cc
	> Created Time: Fri 25 Nov 2022 09:40:18 PM CST
 ************************************************************************/

#include<stdio.h>
#include<stdlib.h>
#include<string.h>
#include<math.h>

char getHex(int n) {
    if(n < 10) return n + '0';
    return 'A' + (n - 10);
}

void Dec2Hex(int b, char *p) {
    char s[1005] = {};
    int n = b,i = 0;
    while(n > 0) {
        s[i++] = getHex(n % 16);
        n /= 16;
    }
    for(int j = 0; j < i; j++) {
        p[j] = s[i - j - 1];
    }
    return ;
}

int main(int argc, char* argv[]) {
    int b;
    char s[1005] = {};
    scanf("%d", &b);
    
    Dec2Hex(b, s);

    printf("%s", s);

    return 0;
}
