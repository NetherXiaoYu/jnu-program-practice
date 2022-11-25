/*************************************************************************
	> File Name: 1.字符串的逆序输出.c
	> Author: 施湘岚
	> Mail: admin@cloudtower.cc
	> Created Time: Fri 25 Nov 2022 09:01:31 PM CST
 ************************************************************************/

#include<stdio.h>
#include<stdlib.h>
#include<string.h>
#include<math.h>

struct Str{
    char content;
    struct Str* next;
};

void put_strr(struct Str *s) {
    while(s != NULL) {
        printf("%c", s->content);
        s = s->next;
    }
    return ;
}

int main(int argc, char* argv[]) {
    struct Str *head = NULL, *ptr = NULL;
    char c;
    while(scanf("%c", &c) != EOF) {
        ptr = (struct Str*) malloc(sizeof(struct Str));
        ptr->content = c;
        ptr->next = head;
        head = ptr;
    }
    put_strr(ptr->next);
    return 0;
}
