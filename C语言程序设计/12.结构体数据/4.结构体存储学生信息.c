/*************************************************************************
	> File Name: 4.结构体存储学生信息.c
	> Author: 施湘岚
	> Mail: admin@cloudtower.cc
	> Created Time: Sun 04 Dec 2022 04:31:53 PM CST
 ************************************************************************/

#include<stdio.h>
#include<stdlib.h>
#include<string.h>
#include<math.h>

struct Student {
    long id;
    char name[20];
    int score[4];
    int deleted;
};

void outputAll(struct Student* s, int n) {
    for(int i = 0; i < n; i++) {
        if(!s[i].deleted) {
            printf("%ld %s %d %d %d %d\n", s[i].id, s[i].name, s[i].score[1], s[i].score[2], s[i].score[3], s[i].score[0]);
        }
    }
    return ;
}

int main(int argc, char* argv[]) {
    int n, p, act;
    scanf("%d %d", &n, &p);
    struct Student *s = (struct Student *)malloc(sizeof(struct Student) * (n + 1));
    
    for(int i = 0; i < n; i++) {
        scanf("%ld %s %d %d %d", &s[i].id, s[i].name, &s[i].score[1], &s[i].score[2], &s[i].score[3]);
        s[i].score[0] = (s[i].score[1] + s[i].score[2] + s[i].score[3]);
    }
    
    char name[20];
    long tmp_id;
    int tmp1, tmp2, tmp3;

    for(int i = 0; i < p; i++) {
        scanf("%d", &act);
        switch(act) {
            case 1:
                scanf("%s", name);
                for(int i = 0; i < n; i++) {
                    if(strcmp(s[i].name, name) == 0) {
                        printf("%ld %s %d %d %d %d\n", s[i].id, s[i].name, s[i].score[1], s[i].score[2], s[i].score[3], s[i].score[0]);
                        s[i].deleted = 0;
                    }
                }
                break;
            case 2:
                scanf("%ld", &tmp_id);
                for(int i = 0; i < n; i++) {
                    if(s[i].id == tmp_id) {
                        scanf("%d %d %d", &tmp1, &tmp2, &tmp3);
                        s[i].score[1] = tmp1;
                        s[i].score[2] = tmp2;
                        s[i].score[3] = tmp3;
                        s[i].score[0] = tmp1 + tmp2 + tmp3;
                    }
                }
                outputAll(s, n);
                break;
            case 3:
                scanf("%ld", &tmp_id);
                for(int i = 0; i < n; i++) {
                    if(s[i].id == tmp_id) {
                        s[i].deleted = 1;
                    }
                }
                outputAll(s, n);
                break;
        }
    }

    return 0;
}
