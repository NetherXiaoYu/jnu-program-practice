/*************************************************************************
	> File Name: 4.求解一元二次议程的实数根.c
	> Author: 施湘岚
	> Mail: admin@cloudtower.cc
	> Created Time: Fri 07 Oct 2022 06:21:00 PM CST
 ************************************************************************/

#include<stdio.h>
#include<stdlib.h>
#include<math.h>

void calc(double a, double b, double c) {
    if(a == 0 && b == 0 && c == 0) {
        printf("恒等式");
        return ;
    }
    if(a == 0 && b == 0 && c != 0) {
        printf("非方程");
        return ;
    }
    if(a == 0 && b != 0 && c != 0) {
        printf("x=%.2f", -c / b);
        return ;
    }
    double delta = pow(b, 2) - 4.0 * a * c;
    if(delta == 0) {
        printf("x=%.2f", (-b + sqrt(delta)) / (2 * a));
        return ;
    }
    if(delta > 0) {
        printf("x1=%.2f,x2=%.2f", (-b - sqrt(delta)) / (2 * a), (-b + sqrt(delta)) / (2 * a));
        return ;
    }
    if(delta < 0) {
        printf("x1=%.2f-%.2fi,x2=%.2f+%.2fi", (-b / (2 * a)), (sqrt(-delta) / (2 * a)), (-b / (2 * a)), (sqrt(-delta) / (2 * a)));
        return ;
    }
}

int main(int argc, char* argv[]) {
    double a, b, c;
    scanf("%lf %lf %lf", &a, &b, &c);
    calc(a, b, c);
    return 0;
}
