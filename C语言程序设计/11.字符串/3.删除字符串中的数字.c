/*************************************************************************
	> File Name: 3.删除字符串中的数字.c
	> Author: 施湘岚
	> Mail: admin@cloudtower.cc
	> Created Time: Fri 25 Nov 2022 09:25:10 PM CST
 ************************************************************************/

#include<stdio.h>
#include<stdlib.h>
#include<string.h>
#include<math.h>

void del_digit(char s[]) {
    int num_cnt = 0, i = 0;
    while(s[i] != '\n' && s[i] != '\0') {
        int j = 0;
        while(s[i + num_cnt + j] >= '0' && s[i + num_cnt + j] <= '9') j++;
        num_cnt += j;
        s[i] = s[i + num_cnt];
        i++;
    }
}

int main(int argc, char* argv[]) {
    char s[1005], c;
    int i = 0;
    
    while(scanf("%c", &c) != EOF) s[i++] = c;

    del_digit(s);

    printf("%s", s);

    return 0;
}
