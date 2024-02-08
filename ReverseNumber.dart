void main() {
 
 List<int>num=[2,4,5,6];
  List<int>revNum=[];
  for(int i=num.length-1;i>=0;i--)
  {
    revNum.add(num[i]);
  }
  print(revNum);
}
