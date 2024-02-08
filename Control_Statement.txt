void main() {
 int a=10,b=2,c=4;
  //SIMPLE IF
 if(a>b)
 {
   print("a is greater");
 }
 
 //IF ELSE
 if(b<a)  //true part
 {  
   print("b is smaller");
 }
  else     //false part
  {
    print("a is smaller");
  }
  
  //IF ELSE IF LADDER
  if(a>b)   //if true
  {
     print("a is greater");
     if(a>c)   //nested if
    {
        print("a is greater");
    }
    else
    {
      print("c is greater");
    }
  }
  else if(b<c)   // if false
  {
    print("b is greater");
  }
  else
  {
    print("c is greater");
  }
}
