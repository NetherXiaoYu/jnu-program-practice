/*************************************************************************
	> File Name: 2.用函数实现数组平均值、最大值、最小值的求解.c
	> Author: 施湘岚
	> Mail: admin@cloudtower.cc
	> Created Time: Mon 14 Nov 2022 08:50:49 PM CST
 ************************************************************************/

#include<stdio.h>
#include<stdlib.h>
#include<string.h>
#include<math.h>

void calc(int* nums, int *sum, double *mean) {
    for(int i = 1; i <= nums[0]; i++) *sum += nums[i];
    *mean = 1.0 * *sum / nums[0];
}

int main(int argc, char* argv[]) {
    int nums[1005] = {0};
    int tmp, cnt = 0, sum = 0;
    double mean = 0;

    while(scanf("%d", &tmp) != EOF) nums[++cnt] = tmp;
    nums[0] = cnt;
    
    calc(nums, &sum, &mean);
    
    printf("%d %.2f", sum, mean);
    return 0;
}
