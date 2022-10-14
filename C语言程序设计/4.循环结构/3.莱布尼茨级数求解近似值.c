/*************************************************************************
	> File Name: 3.莱布尼茨级数求解近似值.c
	> Author: 施湘岚
	> Mail: admin@cloudtower.cc
	> Created Time: Sat 08 Oct 2022 08:19:55 PM CST
 ************************************************************************/

#include<stdio.h>
#include<stdlib.h>
#include<math.h>

int main(int argc, char* argv[]) {
    double ans = 0;
    int n = 10000000, sgn = 1;
    for(int i = 1; i <= n; i += 2) {
        ans += (4.0 / (i * 1.0)) * sgn;
        sgn *= -1;
    }
    printf("pi=%.6f", ans);
    return 0;
}
