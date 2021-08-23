class HelloWorld{
	public static void main(String args[]){
		System.out.println("Hello,World!");
		for(int i = 0; i < 1000;i++){
			if(i%7>=3)
				System.out.print("*");
			else
				System.out.print("_");
			if(i%50==0)
				System.out.println();
		}
	}
}
