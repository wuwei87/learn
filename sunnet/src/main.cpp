#include<bits/stdc++.h>
#include"cat.h"
using namespace std;
const float PI = 3.14;
//开平方倒数算法
float Q_rsqrt(float number){
    long i;
    float x2,y;
    const float threehalfs = 1.5F;

    x2 = number * 0.5F;
    y = number;

    i = * (long * ) &y;
    i = 0x5f3759df - (i >> 1);
    y = * ( float * ) &i;
    y = y * ( threehalfs - ( x2 * y * y));

    return y;
}

int main(int argc, char** argv)
{
    Cat cat1;
    cat1.age=5;
    Cat cat2;
    cat2.age=6;
    cat1.Say();
    cat2.Say();

    cout<<Q_rsqrt(37.0)<<endl;
    return 0;
}
