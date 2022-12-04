/*************************************************************************
	> File Name: 3.结构体存储数据.c
	> Author: 施湘岚
	> Mail: admin@cloudtower.cc
	> Created Time: Sun 04 Dec 2022 04:25:09 PM CST
 ************************************************************************/

#include<stdio.h>
#include<stdlib.h>
#include<string.h>
#include<math.h>

struct Candidate {
    char name[20];
    int ticket;
};

int main(int argc, char* argv[]) {
    struct Candidate c[3] = {"Li", 0, "Zhang", 0, "Sun", 0};
    int n;
    char s[20];
    scanf("%d", &n);
    for(int i = 0; i < n; i++) {
        scanf("%s", s);
        for(int i = 0; i < 3; i++) {
            if(strcmp(s, c[i].name) == 0) {
                c[i].ticket++;
            }
        }
    }
    for(int i = 0; i < 3; i++) {
        printf("%s:%d\n", c[i].name, c[i].ticket);
    }
    return 0;
}
