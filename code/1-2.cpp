#include<iostream>
using namespace std;
#define BITSPERWORD 32
#define SHIFT 5
#define MASK 0x1F
#define N 10000000


int test(int i ) {return 0xFF & (1<<(i & MASK)); }

int main() {
	int i;
	i = 0x81;
	cout<<test(i)<<endl;
}
