/*************************************************************************
	> File Name: 2.分段函数的设计与实现.c
	> Author: 施湘岚
	> Mail: admin@cloudtower.cc
	> Created Time: Fri 07 Oct 2022 06:19:00 PM CST
 ************************************************************************/

#include<stdio.h>
#include<stdlib.h>
#include<math.h>

int main(int argc, char* argv[]) {
    double x;
    scanf("%lf", &x);
    if(x <= 0) printf("error");
    else if(x > 0 && x <= 10) printf("y=%.2f", x + 5.0);
    else if(x > 10 && x <= 20) printf("y=10.00");
    else if(x > 20 && x < 40) printf("y=%.2f", (-0.5 * x * x) + 20);
    else printf("error");
    return 0;
}
