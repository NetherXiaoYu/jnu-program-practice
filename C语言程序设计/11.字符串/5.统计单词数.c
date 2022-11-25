/*************************************************************************
	> File Name: 5.统计单词数.c
	> Author: 施湘岚
	> Mail: admin@cloudtower.cc
	> Created Time: Fri 25 Nov 2022 09:53:15 PM CST
 ************************************************************************/

#include<stdio.h>
#include<stdlib.h>
#include<string.h>
#include<ctype.h>
#include<math.h>

int main(int argc, char* argv[]) {
    char s[1005] = {}, c;
    int i = 0, cnt = 1;

    while(scanf("%c", &c) != EOF) s[i++] = c;

    cnt = (s[0] != ' ') ? 1 : 0;

    i = 0;
    while(s[i] != '\n' && s[i] != '\0') {
        if(isalpha(s[i]) && i >= 1 && s[i - 1] == ' ') cnt++;
        i++;
    }

    printf("%d", cnt);

    return 0;
}
