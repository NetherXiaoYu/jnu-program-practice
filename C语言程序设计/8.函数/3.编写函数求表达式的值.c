/*************************************************************************
	> File Name: 3.编写函数求表达式的值.c
	> Author: 施湘岚
	> Mail: admin@cloudtower.cc
	> Created Time: Sun 30 Oct 2022 10:36:26 AM CST
 ************************************************************************/

#include<stdio.h>
#include<stdlib.h>
#include<math.h>

int n, cnt = 1;
double ans = 1.0;

void calc(double a, double b) {
    if(cnt > n) return ;
    ans += (a / b);
    cnt++;
    if(cnt % 2 == 1) {
        return calc(a, (b / cnt) * (2 * cnt + 1));
    } else {
        return calc(a * (cnt), b * (2 * cnt + 1));
    }
}

int main(int argc, char* argv[]) {
    scanf("%d", &n);
    calc(1, 3);
    printf("%.10f", ans);
    return 0;
}
