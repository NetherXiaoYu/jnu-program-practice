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
        for(int j = i; j < 10; j++) {
            if(nums[i] > nums[j]) {
                int c = nums[i];
                nums[i] = nums[j];
                nums[j] = c;
            }
        }
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
