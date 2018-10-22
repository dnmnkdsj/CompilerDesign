int main() {
  int a = 10,b=20;
  float flt = 20;
  char ch = 'a';
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
    c ++;
    c --;
    c += -b;
    c -= a * b;
    c *= a /b;
    c /= a%b;
    c %= (a=(b+c));
  }
  return 0;
}
