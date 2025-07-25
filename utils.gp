u_ispalindrome(x) =
{
  r = 0;
  if(x == fromdigits(Vecrev(digits(x))), r = 1);
  r
}

u_nextsunday(c) =
{
  month = [31,28,31,30,31,30,31,31,30,31,30,31];
  y = c[1]; m = c[2]; d = c[3];
  if(y % 4 == 0 && (y % 100 != 0 || y % 400 == 0), month[2] = 29);
  d += 7;
  if(d > month[m], d = d % month[m]; m += 1);
  if(m > 12, m = 1; y += 1);
  [y, m, d]
}

u_abundantnumber(n) =
{
  if(vecsum(divisors(n)) > 2*n, 1, 0)
}

u_eulercandidate(n, a, b) =
{
  n^2 + a*n + b
}

u_cyclelength(n) =
{
  r = 10; l = 0;
  while(r != 10 || l < 1, r = (r%n) * 10; l += 1);
  l
}
