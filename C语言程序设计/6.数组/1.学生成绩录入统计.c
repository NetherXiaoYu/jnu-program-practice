/*************************************************************************
	> File Name: 1.学生成绩录入统计.c
	> Author: 施湘岚
	> Mail: admin@cloudtower.cc
	> Created Time: Fri 21 Oct 2022 07:53:29 PM CST
 ************************************************************************/

#include<stdio.h>
#include<stdlib.h>
#include<math.h>

int main(int argc, char* argv[]) {
    int stu[4] = {0, 0, 0};
    double tmp;
    printf("你输入的学生成绩:");
    for(int i = 0; i < 10; i++) {
        scanf("%lf", &tmp);
        if(tmp <= 60) stu[0]++;
        else if(tmp >= 86) stu[2]++;
        else stu[1]++;
        printf("%.1lf", tmp);
        if(i < 8) printf(" ");
        if(i < 9) printf(" ");
    }
    printf("\n0~60:%d人\n61~85:%d人\n86+:%d人", stu[0], stu[1], stu[2]);
    return 0;
}
