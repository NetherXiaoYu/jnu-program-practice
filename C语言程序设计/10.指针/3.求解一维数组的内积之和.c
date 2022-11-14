/*************************************************************************
	> File Name: 3.求解一维数组的内积之和.c
	> Author: 施湘岚
	> Mail: admin@cloudtower.cc
	> Created Time: Mon 14 Nov 2022 09:02:26 PM CST
 ************************************************************************/

#include<stdio.h>
#include<stdlib.h>
#include<string.h>
#include<math.h>

int inner_product(int* a, int* b, int cnt) {
    int ans = 0;

    for(int i = 0; i < cnt; i++) {
        ans += a[i] * b[i];
    }

    return ans;
}

int main(int argc, char* argv[]) {
    int a[1005] = {0}, b[1005] = {0};
    int tmp, cnt = 0;
    char lnbreak;
    
    while(scanf("%d%c", &tmp, &lnbreak)) {
        a[cnt++] = tmp;
        if(lnbreak == '\n') break;
    }
    for(int i = 0; i < cnt; i++) scanf("%d", &b[i]);
    printf("%d", inner_product(a, b, cnt));
    return 0;
}
