int main() {
  int a = 10,b=20;
  float flt = 20;
  char ch = 'a';
  int d[5] = {1,2,3};
  char string[6] = {'H','e','l','l','o','\0'};
  a = d[2];
  if (a<b){
    /* this is
    just a
    annotation */
    int c = a+b;// this is a single line annotation &*$#
    if (a==b)
      if (a!=b)
        if (a>b)
          if (a>=b)
            if (a<=b)
              c = b-a;
    c++;
    c -- ;
    c += -b;
    c -= a * b;
    c *= a /b;
    c /= a%b;
    c %= (a=(b+c));
  }
  return 0;
}
