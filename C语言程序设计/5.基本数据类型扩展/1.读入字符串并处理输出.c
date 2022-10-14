/*************************************************************************
  > File Name: 1.读入字符串并处理输出.c
	> Author: 施湘岚
	> Mail: admin@cloudtower.cc
	> Created Time: Fri 14 Oct 2022 01:32:17 PM CST
 ************************************************************************/

#include<stdio.h>
#include<stdlib.h>
#include<math.h>
#include<string.h>

int main(int argc, char* argv[]) {
    int cnt = 0;
    char c;
    while((c = getchar()) != EOF) {
        if(c >= '0' && c <= '9') continue;
        cnt++;
        if(c >= 'A' && c <= 'Z') c += 'a' - 'A';
        else if(c >= 'a' && c <= 'z') c += 'A' - 'a';
        printf("%c", c);
    }
    printf("length:%d", cnt - 1);
    return 0;
}
