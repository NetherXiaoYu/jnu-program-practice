/*************************************************************************
	> File Name: 5.亲密数.c
	> Author: 施湘岚
	> Mail: admin@cloudtower.cc
	> Created Time: Sun 30 Oct 2022 11:50:27 AM CST
 ************************************************************************/

#include<stdio.h>
#include<stdlib.h>
#include<math.h>

int getSum(int a) {
    int sum = 0;
    for(int i = 1; i <= (a / 2); i++) {
        if(a % i == 0) sum += i;
    }
    return sum;
}

int main(int argc, char* argv[]) {
    for(int i = 2; i < 3000; i++) {
        int b = getSum(i);
        if(getSum(b) == i && i != b) {
            printf("(%d,%d)", i, b);
            if(i < b) i = b;
        }
    }
    return 0;
}
