/*************************************************************************
	> File Name: 2.回文数.c
	> Author: 施湘岚
	> Mail: admin@cloudtower.cc
	> Created Time: Sun 30 Oct 2022 10:30:07 AM CST
 ************************************************************************/

#include<stdio.h>
#include<stdlib.h>
#include<math.h>

int isPalindrome(int n) {
    int tmp = n, tmp2 = 0;
    while(tmp > 0) {
        tmp2 *= 10;
        tmp2 += tmp % 10;
        tmp /= 10;
    }
    return tmp2 == n;
}

int main(int argc, char* argv[]) {
    for(int i = 200; i <= 3000; i++) {
        if(isPalindrome(i)) printf("%d\n", i);
    }
    return 0;
}
