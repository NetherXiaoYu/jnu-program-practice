/*************************************************************************
	> File Name: 4.报数.c
	> Author: 施湘岚
	> Mail: admin@cloudtower.cc
	> Created Time: Mon 14 Nov 2022 09:12:40 PM CST
 ************************************************************************/

#include<stdio.h>
#include<stdlib.h>
#include<string.h>
#include<math.h>

int calc(int n) {
    int cnt = n, ptr = 0;
    int *ppl = (int *) malloc(sizeof(int) * (n + 1));
    memset(ppl, n + 1, 0);
    while(cnt > 1) {
        int tmp = 0;
        
        while(tmp < 3) {
            ptr++;
            if(ptr > n) ptr = 1;
            if(ppl[ptr] == 0) tmp++;
        }

        ppl[ptr] = 1;
        cnt--;
    }
    for(int i = 1; i <= n; i++) {
        if(ppl[i] != 1) {
            free(ppl);
            return i;
        }
    }
    free(ppl);
    return 0;
}

int main(int argc, char* argv[]) {
    int n;
    scanf("%d", &n);
    printf("%d", calc(n));
    return 0;
}
