/*************************************************************************
	> File Name: 5.百钱百鸡问题.c
	> Author: 施湘岚
	> Mail: admin@cloudtower.cc
	> Created Time: Sat 08 Oct 2022 08:36:17 PM CST
 ************************************************************************/

#include<stdio.h>
#include<stdlib.h>
#include<math.h>

int main(int argc, char* argv[]) {

    for(int i = 0; i <= 100; i++) {
        for(int j = 0; j <= 100; j++) {
            for(int k = 0; k <= 100; k++) {
                if((15 * i + 9 * j + k) == 300 && (i + j + k) == 100) {
                    printf("公鸡:%d, 母鸡：%d, 小鸡: %d\n", i, j, k);
                }
            }
        }
    }

    return 0;
}
