/*************************************************************************
	> File Name: 4.猜数游戏.c
	> Author: 施湘岚
	> Mail: admin@cloudtower.cc
	> Created Time: Fri 14 Oct 2022 02:49:23 PM CST
 ************************************************************************/

#include<stdio.h>
#include<stdlib.h>
#include<math.h>

int main(int argc, char* argv[]) {
    int left = 1, right = 100, mid = 50, cnt = 0, target = 0;
    // printf("input a number (1-100):");
    scanf("%d", &target);
    // printf("begin guess...\n");
    while(left < right) {
        cnt++;
        mid = (left + right) / 2;
        if(mid < target) {
            // printf("%4d %c\n", mid, 'S');
            left = mid;
            continue;
        } else if(mid > target) {
            // printf("%4d %c\n", mid, 'B');
            right = mid;
            continue;
        } else {
            // printf("%4d %c\n", mid, 'C');
            // printf("You got %d guesses", cnt);
            break;
        }
    }
    return 0;
}
