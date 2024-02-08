void main() 
{
  int a=10,b=20,c=5;
  print(a);
  print("Value of a is ${a}");
  
//ARITHMETIC OPERATORS
  
  int sum=a+b;
    print("sum is:${sum}");
  int diff=a-b;
    print("diff is: ${diff}");
   int mul=a*b;
    print("product is: ${mul}");
  double div=b/a;
    print("quotient is: ${div}");
  int mod=b%a;
    print("remainder is: ${mod}");
 //UNARY OPERATORS 
  print("Unary");
    print(a++); //10;11
    print(++a); //11+1;12
    print(a--); //12;12-1
    print(--a); //11;11-1
  
 //ASSIGNMENT OPERATORS
  print("Assignment");
 a=c;
  print(a);
 a+=b;
  print(a);
 a-=b;
  print(a);
 a*=b;
  print(a);
 a~/=b;
  print(a);
 a%=b;
  print(a);
  
 //RELATIONAL OPERATORS
  print("Relational");  //a=10,b=20   
  bool result;   
 result=(a>b);
  print (result);
 result=(a<b);
  print(result);
 result=(a>=b);
  print(result);
 result=(a<=b);
  print(result);
 result=(a==b);
  print(result);
 result=(a!=b);
  print(result);
  
 //LOGICAL OPERATORS
  print("Logical");
  bool res;
 res=(a<b)&&(b>a);
  print(res);
 res=(a>b)||(b>a);
  print(res);
 res=!((a<b)&&(b>a));
  print(res);
  
 //CONDITIONAL OPERATOR
  print("Conditional");
 int greatest=a>b?a:b;
  print("greatest is : ${greatest}");
 
  
}

