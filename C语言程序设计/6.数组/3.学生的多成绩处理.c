/*************************************************************************
	> File Name: 3.学生的多成绩处理.c
	> Author: 施湘岚
	> Mail: admin@cloudtower.cc
	> Created Time: Fri 21 Oct 2022 08:09:05 PM CST
 ************************************************************************/

#include<stdio.h>
#include<stdlib.h>
#include<math.h>

int main(int argc, char* argv[]) {
    double results[3][5] = {0};
    printf("输入学生成绩\n");
    for(int i = 0; i < 3; i++) {
        for(int j = 0; j < 5; j++) {
            scanf("%lf", &results[i][j]);
        }
    }

    printf("学生总分 平均分\n");
    for(int i = 0; i < 3; i++) {
        double sum = 0;
        for(int j = 0; j < 5; j++) {
            sum += results[i][j];
        }
        printf("%.1f %.1f\n", sum, (sum / 5.0));
    }

    printf("课程总分 平均分\n");
    for(int i = 0; i < 5; i++) {
        double sum = 0;
        for(int j = 0; j < 3; j++) {
            sum += results[j][i];
        }
        printf("%.1f %.1f", sum, (sum / 3.0));
        if(i != 4) printf("\n");
    }
    return 0;
}
