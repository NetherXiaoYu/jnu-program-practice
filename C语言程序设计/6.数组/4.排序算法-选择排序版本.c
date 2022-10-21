/*************************************************************************
	> File Name: 4.排序算法.c
	> Author: 施湘岚
	> Mail: admin@cloudtower.cc
	> Created Time: Fri 21 Oct 2022 08:15:54 PM CST
 ************************************************************************/

#include<stdio.h>
#include<stdlib.h>
#include<math.h>

int nums[15] = {0};

void selection_sort() {
    for(int i = 0; i < 10; i++) {
        int target = nums[i], pos = 0;

        while(target>nums[pos]) pos++;
        for(int j = i; j > pos; j--) nums[j] = nums[j - 1];

        nums[pos] = target;
    }
}

int main(int argc, char* argv[]) {
    printf("Input 10 numbers:\n");
    for(int i = 0; i < 10; i++) scanf("%d", &nums[i]);
    selection_sort();
    printf("The sorted numbers:");
    for(int i = 0; i < 10; i++) {
        printf("%d", nums[i]);
        if(i != 9) printf(" ");
    }
    return 0;
}
