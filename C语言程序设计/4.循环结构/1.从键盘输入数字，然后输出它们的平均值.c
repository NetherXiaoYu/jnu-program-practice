/*************************************************************************
	> File Name: 1.从键盘输入数字，然后输出它们的平均值.c
	> Author: 施湘岚
	> Mail: admin@cloudtower.cc
	> Created Time: Sat 08 Oct 2022 07:59:24 PM CST
 ************************************************************************/

#include<stdio.h>
#include<stdlib.h>
#include<math.h>

int main() {
    double sum = 0, tmp = 0;
    int cnt = 0;
    scanf("%lf", &tmp);
    while(tmp != -1.0) {
        sum += tmp;
        cnt++;
        scanf("%lf", &tmp);
    }
    if(cnt == 0) {
        printf("用户输入0个数");
    } else {
        printf("用户输入%d个数\n", cnt);
        printf("平均值:%.2f", (sum / cnt * 1.0));
    } 
    return 0;
}
