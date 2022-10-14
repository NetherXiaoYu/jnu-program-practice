/*************************************************************************
	> File Name: 5.判断证书是否能被整除.c
	> Author: 施湘岚
	> Mail: admin@cloudtower.cc
	> Created Time: Fri 07 Oct 2022 06:21:38 PM CST
 ************************************************************************/

#include<stdio.h>
#include<stdlib.h>
#include<stdbool.h>
#include<math.h>

void calc(int x) {
    bool d3 = (x % 3 == 0), d5 = (x % 5 == 0), d7 = (x % 7 == 0);

    if(!d3 && !d5 && !d7) printf("不能被3,5,7任一个整除");
    if(d3 && d5 && d7) printf("能同时被3,5,7整除");

    if(!d3 && d5 && d7) printf("能同时被5,7整除");
    if(d3 && !d5 && d7) printf("能同时被3,7整除");
    if(d3 && d5 && !d7) printf("能同时被3,5整除");

    if(d3 && !d5 && !d7) printf("能被3整除");
    if(!d3 && d5 && !d7) printf("能被5整除");
    if(!d3 && !d5 && d7) printf("能被7整除");

    return ;
}

int main(int argc, char* argv[]) {
    int x;
    scanf("%d", &x);
    calc(x);
    return 0;
}
