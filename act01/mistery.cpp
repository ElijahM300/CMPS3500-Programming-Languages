#include <bits/stdc++.h>
using namespace std;
int foo(int X[], int l, int r, int x)
{if (r >= l) {
int R = l + (r - l) / 2;
if (X[R] == x)
return R;
if (X[R] > x)
return foo(X, l, R - 1, x);
return foo(X, R + 1, r, x);
} return -1;}
int main(void)
{int X[] = { 2, 3, 4, 10, 40 };
int x = 10;
int n = sizeof(X) / sizeof(X[0]);
int result = foo(X, 0, n - 1, x);
(result == -1)
? cout << "Element is not present in array \n"
: cout << "Element is present at index \n" << result;
return 0;
}
