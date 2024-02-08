void main()
{
  int i,j,num;
  for(int i=2;i<=100;i++)
  {
      num=0;
      for(j=2;j<i;j++)
      {
        if(i%j==0)
        {
          num++;
          break;
        }
      }
    if(num==0)
    {
      print(i);
    }
  }
}
