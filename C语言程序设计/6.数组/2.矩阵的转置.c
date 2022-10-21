/*************************************************************************
	> File Name: 2.矩阵的转置.c
	> Author: 施湘岚
	> Mail: admin@cloudtower.cc
	> Created Time: Fri 21 Oct 2022 08:00:59 PM CST
 ************************************************************************/

#include<stdio.h>
#include<stdlib.h>
#include<math.h>

int main(int argc, char* argv[]) {
    int matrix[2][3] = {0};
    printf("原矩阵:\n");

    for(int i = 0; i < 2; i++) {
        for(int j = 0; j < 3; j++) {
            scanf("%d", &matrix[i][j]);
            printf("%5d", matrix[i][j]);
        }
        printf("\n");
    }

    printf("转置矩阵:\n");
    for(int i = 0; i < 3; i++) {
        for(int j = 0; j < 2; j++) {
            printf("%5d", matrix[j][i]);
        }
        if(i != 2) printf("\n");
    }
    return 0;
}
