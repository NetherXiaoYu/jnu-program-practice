/*************************************************************************
        > File Name: main.cpp
        > Author: 施湘岚
        > Mail: admin@cloudtower.cc
        > Created Time: Sat Mar 11 17:36:14 2023
 ************************************************************************/

#include<iostream>
#include<algorithm>
#include<cstdio>
#include<cstring>
#include<climits>

using namespace std;

class Graph{
private:
    int size;
    int *lx, *ly, *matched, *lag;
    int **w;
    bool *visited_x, *visited_y;
public:
    Graph(int n) : size(n) {
        printf("Creating...\n");
        lx = new int[n];
        ly = new int[n];
        matched = new int[n];
        lag = new int[n];
        w = new int*[n];
        visited_x = new bool[n];
        visited_y = new bool[n];
        for(int i = 0; i < n; i++) w[i] = new int[n];
        memset(lx, 0, sizeof(lx));
        memset(ly, 0, sizeof(ly));
        memset(matched, -1, sizeof(matched));
        memset(lag, 0, sizeof(lag));
        memset(visited_x, false, sizeof(visited_x));
        memset(visited_y, false, sizeof(visited_y));
    }

    void setWeight(int i, int j, int weight) {
        printf("Setting %d %d %d...\n", i, j, weight);
        w[i][j] = weight;
        return ;
    }

    void initLxValue() {
        printf("initLxValue...\n");
        for(int i = 0; i < size; i++) {
            for(int j = 0; j < size; j++) {
                lx[i] = max(w[i][j], lx[i]);
            }
        }
    }

    bool findPath(int x) {
        printf("FindPath %d...\n", x);
        visited_x[x] = true;
        for(int y = 0; y < size; y++) {
            if(visited_y[y]) continue;
            int tmp = lx[x] + ly[y] - w[x][y];
            printf("y = %d, tmp = %d\n", y, tmp);
            if(tmp == 0) {
                visited_y[y] = true;
                printf("Matched[%d] = %d\n", y, matched[y]);
                if(matched[y] == -1 || findPath(matched[y])) {
                    matched[y] = x;
                    return true;
                }
                printf("Matched[%d] = %d\n", y, matched[y]);
            }
            else if(lag[y] > tmp) lag[y] = tmp;
        }
        return false;
    }

    void printArg() {
        printf("Matched: \n");
        for(int i = 0; i < size; i++) {
            printf("%2d ", matched[i]);
        }
        printf("\nLag: \n");
        for(int i = 0; i < size; i++) {
            printf("%2d ", lag[i]);
        }
        printf("\nLx: \n");
        for(int i = 0; i < size; i++) {
            printf("%2d ", lx[i]);
        }
        printf("\nLy: \n");
        for(int i = 0; i < size; i++) {
            printf("%2d ", ly[i]);
        }
        printf("\nWeight: \n");
        for(int i = 0; i < size; i++) {
            for(int j = 0; j < size; j++) {
                printf("%2d ", w[i][j]);
            }
            printf("\n");
        }
        printf("\n");
        return ;
    }

    void printSol(int cnt) {
        printf("PrintSol...\n");
        int ans = 0;
        printf("Sol %d:\n", cnt);
        for(int i = 0; i < size; i++) {
            printf("%2d --> %2d, w == %d\n", i, matched[i], w[matched[i]][i]);
            ans += w[matched[i]][i];
        }
        printf("\nans = %d\n\n", ans);
        return ;
    }

    void runKM() {
        printf("runKm....\n");
        int cnt = 10;
        for(int x = 0; x < size; x++) {
            cnt = 10;
            for(int i = 0; i < size; i++) {
                lag[i] = INT_MAX;
            }
            while(true) {
                memset(visited_x, false, sizeof(visited_x));
                memset(visited_y, false, sizeof(visited_y));
                if(findPath(x)) {
                    printf("Result Founded\n");
                    break;
                }

                int delta = INT_MAX;
                for(int i = 0; i < size; i++) {
                    if(!visited_y[i]) delta = min(lag[i], delta);
                }
                printf("\nDelta = %d\n", delta);
                for(int i = 0; i < size; i++) {
                    if(visited_x[i]) lx[i] -= delta;
                }
                for(int i = 0; i < size; i++) {
                    if(visited_y[i]) ly[i] += delta;
                    else lag[i] -= delta;
                }
                printArg();
            }
        }
    }

    void solve() {
        printf("solve...\n");
        for(int i = 0; i < size; i++) matched[i] = -1;
        initLxValue();
        runKM();
        printSol(0);
    }

    ~Graph() {
        printf("destroy....\n");
        delete[] lx, ly, matched, lag;
        delete[] visited_x, visited_y;
        delete[] w;

    }

};

int main() {
    int n;
    int s[10][10], p[10][10];
    scanf("%d", &n);

    Graph *g = new Graph(n);
    printf("Reading...\n");
    for(int i = 0; i < n; i++) {
        for(int j = 0; j < n; j++) {
            scanf("%d", &s[i][j]);
        }
    }

    for(int i = 0; i < n; i++) {
        for(int j = 0; j < n; j++) {
            scanf("%d", &p[i][j]);
        }
    }

    printf("Setting...\n");
    for(int i = 0; i < n; i++) {
        for(int j = 0; j < n; j++) {
            g->setWeight(i, j, s[j][i] + p[i][j]);
        }
    }

    g->solve();

    delete g;
    return 0;
}
