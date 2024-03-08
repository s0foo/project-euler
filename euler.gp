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

\\ Problem 10: Summation of Primes
p_010() =
{
  s = 0;
  forprime(p = 2, 2000000, s += p);
  s
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

\\ Problem 16: Power Digit Sum
p_016() =
{
  sumdigits(2^1000)
}

\\ Problem 20: Factorial Digit Sum
p_020() =
{
  sumdigits(vecprod([2..100]))
}

\\ Problem 25: 1000-digit Fibonacci Number
p_025() =
{
  i = 13;
  while(fibonacci(i) < 10^999, i++);
  i
}
