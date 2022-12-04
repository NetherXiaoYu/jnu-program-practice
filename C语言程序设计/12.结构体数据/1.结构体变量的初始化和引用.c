/*************************************************************************
	> File Name: 1.结构体变量的初始化和引用.c
	> Author: 施湘岚
	> Mail: admin@cloudtower.cc
	> Created Time: Sun 04 Dec 2022 03:56:05 PM CST
 ************************************************************************/

#include<stdio.h>
#include<stdlib.h>
#include<string.h>
#include<math.h>

struct Student {
    long id;
    char name[20];
    int score;
};

int main(int argc, char* argv[]) {
    struct Student s1, s2;
    scanf("%ld %s %d", &s1.id, s1.name, &s1.score);
    scanf("%ld %s %d", &s2.id, s2.name, &s2.score);
    if(s1.score > s2.score) {
        printf("%ld %s %d", s1.id, s1.name, s1.score);
    } else {
        printf("%ld %s %d", s2.id, s2.name, s2.score);
    }
    return 0;
}
