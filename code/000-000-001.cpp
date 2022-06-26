#include<iostream>
#include<algorithm>
#include<vector>
using namespace std;
int main(int argc,char *argv[]){
	cout<<"zhangxioayu"<<endl;
	int n;
	cout<<"请输入一个整数:"<<endl;
	cin>>n;
	while(n){
		cout<<n%10;
		n/=10;
	}


	return 0;
}
