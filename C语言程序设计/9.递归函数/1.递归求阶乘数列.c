/*************************************************************************
	> File Name: 1.递归求阶乘数列.c
	> Author: 施湘岚
	> Mail: admin@cloudtower.cc
	> Created Time: Tue 08 Nov 2022 07:07:45 PM CST
 ************************************************************************/

#include<stdio.h>
#include<stdlib.h>
#include<math.h>

long long nums[25] = {0};

long long calc(int n) {
    if(n <= 0) return 1;
    if(nums[n] != 0) return nums[n];

    nums[n] = n * calc(n - 1);
    return nums[n];
}

int main(int argc, char* argv[]) {
    int n;
    long long tmp, ans = 0;

    scanf("%d", &n);
    tmp = calc(n);
    
    for(int i = 1; i <= n; i++) ans += nums[i];
    printf("%lld", ans);

    return 0;
}
