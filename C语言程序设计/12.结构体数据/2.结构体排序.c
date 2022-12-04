/*************************************************************************
	> File Name: 2.结构体排序.c
	> Author: 施湘岚
	> Mail: admin@cloudtower.cc
	> Created Time: Sun 04 Dec 2022 04:01:22 PM CST
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

int cmp(const struct Student *a, const struct Student *b) {
    return a->score < b->score;
}

void swap(struct Student *a, struct Student *b) {
    struct Student c = *a;
    *a = *b;
    *b = c;
}

void sort(struct Student* s, int n) {
    for(int i = 0; i < n; i++) {
        int j = i + 1, max = i + 1;
        while(j < n) {
            if(cmp(&s[max], &s[j])) max = j;
            j++;
        }
        if(cmp(&s[i], &s[max])) swap(&s[i], &s[max]);
    }
}

int main(int argc, char* argv[]) {
    int n;
    scanf("%d", &n);
    struct Student *s = (struct Student *) malloc(sizeof(struct Student) * (n + 1));
    for(int i = 0; i < n; i++) {
        scanf("%ld %s %d", &s[i].id, s[i].name, &s[i].score);
    }
    sort(s, n);
    for(int i = 0; i < 5; i++) {
        printf("%ld %s %d\n", s[i].id, s[i].name, s[i].score);
    }
    free(s);
    
    return 0;
}
