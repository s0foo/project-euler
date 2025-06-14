\r data.gp
\r utils.gp

\\ Problem 1: Multiples of 3 or 5
p_001() =
{
  q3 = floor(999/3); q5 = floor(999/5); q15 = floor(999/15);
  m3 = 3*(q3^2 + q3)/2;
  m5 = 5*(q5^2 + q5)/2;
  m15 = 15*(q15^2 + q15)/2;
  m3 + m5 - m15
}

\\ Problem 2: Even Fibonacci Numbers
p_002() =
{
  s = 0; i = 3;
  while(s < 4000000, s += fibonacci(i); i += 3);
  s
}

\\ Problem 3: Largest Prime Factor
p_003() =
{
  f = factor(600851475143)[,1];
  f[#f]
}

\\ Problem 4: Largest Palindrome Product
p_004() =
{
  m = 0;
  for(i = 100, 999,
    for(j = i, 999, p = i*j; if(u_ispalindrome(p), m = max(m,p)))
  );
  m
}

\\ Problem 5: Smallest Multiple
p_005() =
{
  lcm([1..20])
}

\\ Problem 6: Sum Square Difference
p_006() =
{
  sum(x=1,100,x)^2 - sum(x=1,100,x^2)
}

\\ Problem 7: 10001st Prime
p_007() =
{
  prime(10001)
}

\\ Problem 8: Largest Product in a Series
p_008() =
{
  m = 0;
  t = digits(d_008);
  for(i = 1, #t-12, p = vecprod(t[i..i+12]); m = max(m,p));
  m
}

\\ Problem 9: Special Pythagorean Triplet
p_009() =
{
  t = 0;
  for(a = 1, 332, a2 = a^2;
    for(b = a, (999 - a)/2, c = 1000 - a - b;
      if(a2 + b^2 == c^2, t = a*b*c)));
  t
}

\\ Problem 10: Summation of Primes
p_010() =
{
  s = 0;
  forprime(p = 2, 2000000, s += p);
  s
}

\\ Problem 11: Largest Product in a Grid
p_011() =
{
  m = 0;
  for(j = 1, 17,
    for(k = 1, 17,
      m = max(d_011[k,j]*d_011[k+1,j+1]*d_011[k+2,j+2]*d_011[k+3,j+3],m);
      m = max(d_011[k+3,j]*d_011[k+2,j+1]*d_011[k+1,j+2]*d_011[k,j+3],m));
    for(i = 1, 20,
      m = max(vecprod(d_011[i,][j..j+3]),m);
      m = max(vecprod(d_011[,i][j..j+3]),m)));
  m
}

\\ Problem 12: Highly Divisible Triangular Number
p_012() =
{
  i = 1; t = 1;
  while(#divisors(t) < 500, t += i++);
  t
}

\\ Problem 13: Large Sum
p_013() =
{
  s = vecsum(d_013);
  fromdigits(digits(s)[1..10])
}

\\ Problem 14: Longest Collatz Sequence
p_014() =
{
  m = 0;
  r = 0;
  mp = Map();
  for(i = 2, 1000000,
    c = i;
    l = 0;
    while(c != 1,
      if(mapisdefined(mp, c), l += mapget(mp, c); break);
      if(Mod(c,2) == 0, c = c/2, c = 3*c + 1);
      l += 1;
    );
    mapput(mp, i, l);
    if(l > m, m = l; r = i);
  );
  r
}

\\ Problem 15: Lattice Paths
p_015() =
{
  binomial(40,20)
}

\\ Problem 16: Power Digit Sum
p_016() =
{
  sumdigits(2^1000)
}

\\ Problem 17: Number Letter Counts
p_017() =
{
  u = ["one", "two", "three", "four", "five", "six", "seven", "eight", "nine", "ten", "eleven", "twelve", "thirteen", "fourteen", "fifteen", "sixteen", "seventeen", "eighteen", "nineteen"];
  t = ["twenty", "thirty", "forty", "fifty", "sixty", "seventy", "eighty", "ninety"];
  h = #"hundred";
  s = 0;

  for(i = 1, #u, s += #u[i]);
  for(i = 1, #t,
      s += #t[i];
      for(j = 1, 9, s += #t[i] + #u[j]));
  for(i = 1, 9,
      s += #u[i] + h;
      for(j = 1, #u, s += #u[i] + h + 3 + #u[j]);
      for(j = 1, #t,
          s += #u[i] + h + 3 + #t[j];
          for(k = 1, 9,
              s+= #u[i] + h + 3 + #t[j] + #u[k]));
  );
  s += #u[1] + #"thousand";
  s
}

\\ Problem 18: Maximum Path Sum I
p_018() =
{
  t = Vecrev(d_018);
  for(i = 1, 14,
    for(j = 1, 15-i, t[i+1][j] += max(t[i][j],t[i][j+1])));
  t[15]
}

\\ Problem 19: Counting Sundays 
p_019() =
{
  r = 0;
  c = [1900,1,7];
  while(c[1] < 2001,
    if(c[1] > 1900 && c[3] == 1, r += 1);
    c = u_nextsunday(c));
  r
}

\\ Problem 20: Factorial Digit Sum
p_020() =
{
  sumdigits(vecprod([2..100]))
}

\\ Problem 21: Amicable Numbers
p_021() =
{
  s = 0;
  for(n = 1, 9999, m = sigma(n)-n;
    if(m > n && n == sigma(m)-m, s += n+m));
  s
}

\\ Problem 22: Names Scores
p_022() =
{
  r = 0;
  mp = Map();
  mapput(mp, "A", 1);
  mapput(mp, "B", 2);
  mapput(mp, "C", 3);
  mapput(mp, "D", 4);
  mapput(mp, "E", 5);
  mapput(mp, "F", 6);
  mapput(mp, "G", 7);
  mapput(mp, "H", 8);
  mapput(mp, "I", 9);
  mapput(mp, "J", 10);
  mapput(mp, "K", 11);
  mapput(mp, "L", 12);
  mapput(mp, "M", 13);
  mapput(mp, "N", 14);
  mapput(mp, "O", 15);
  mapput(mp, "P", 16);
  mapput(mp, "Q", 17);
  mapput(mp, "R", 18);
  mapput(mp, "S", 19);
  mapput(mp, "T", 20);
  mapput(mp, "U", 21);
  mapput(mp, "V", 22);
  mapput(mp, "W", 23);
  mapput(mp, "X", 24);
  mapput(mp, "Y", 25);
  mapput(mp, "Z", 26);
  for(i = 1, #d_022,
    s = 0;
    chars = Vec(d_022[i]);
    for(j = 1, #chars, s += mapget(mp, chars[j]));
    r += i * s);
  r
}

\\ Problem 23: Non-Abundant Sums
p_023() =
{
  s = 0; B = 28124;
  l = [];
  for(i = 12, B, if(u_abundantnumber(i), l = concat(l, i)));
  L = Set(l);
  for(n = 1, B,
    w = 1;
    for(i = 1, #l,
      c = n - l[i];
      if(setsearch(L, c), w = 0; break));
    if(w, s += n));
  s
}

\\ Problem 24: Lexicographic Permutations
p_024() =
{
  c = 0; r = 0;
  forperm(10, p,
    c += 1;
    if(c == 1000000, f = p; break));
  v = apply(x->x-1, Vec(f));
  for (i = 1, #v, r = Str(r, v[i]));
  eval(r)
}

\\ Problem 25: 1000-digit Fibonacci Number
p_025() =
{
  i = 13;
  while(fibonacci(i) < 10^999, i++);
  i
}

\\ Problem 27: Quadratic Primes
p_027() =
{
  m = 0; r = 0;
  for(a = -1000, 1000,
    for(b = -1000, 1000,
      l = 0; n = 0;
      while(isprime(u_eulercandidate(n,a,b)), l += 1; n += 1);
      if(l > m, m = l; r = a*b)));
  r
}

\\ Problem 29: Distinct Powers
p_029() =
{
  s = Set([]);
  for(a = 2, 100,
    for(b = 2, 100,
      s = setunion(s, [a^b])));
  #s
}

\\ Problem 30: Digit Fifth Powers
p_030() =
{
  s = 0;
  for(n = 2, 354294,
    fp = apply(x->x^5, digits(n));
    if(vecsum(fp) == n, s += n));
  s
}

\\ Problem 34: Digit Factorials
p_034() =
{
  s = 0;
  for(n = 3, 1999999,
    t = apply(x->factorial(x), digits(n));
    if(vecsum(t) == n, s += n));
  s
}

\\ Problem 41: Pandigital Prime
p_041() =
{
  m = 0;
  forprime(p = 2143, 987654321,
    d = digits(p);
    if(Set(d) == Set([1..#d]), m = p));
  m
}

\\ Problem 67: Maximum Path Sum II
p_067() =
{
  t = Vecrev(d_067);
  for(i = 1, 99,
    for(j = 1, 100-i, t[i+1][j] += max(t[i][j],t[i][j+1])));
  t[100]
}
