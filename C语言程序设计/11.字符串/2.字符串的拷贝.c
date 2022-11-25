/*************************************************************************
	> File Name: 2.字符串的拷贝.c
	> Author: 施湘岚
	> Mail: admin@cloudtower.cc
	> Created Time: Fri 25 Nov 2022 09:12:44 PM CST
 ************************************************************************/

#include<stdio.h>
#include<stdlib.h>
#include<math.h>

void copystr(char *s, char *d) {
    int i = 0;
    while(s[i] != '\n' && s[i] != '\0') {
        d[i] = s[i];
        i++;
    }
    d[i] = s[i];
    return ;
}

int main(int argc, char* argv[]) {
    char str1[1005], str2[1005];
    int i = 0;
    char c;

    while(scanf("%c", &c) != EOF) {
        str1[i++] = c;
    }

    copystr(str1, str2);
    printf("%s", str2);
    return 0;
}
