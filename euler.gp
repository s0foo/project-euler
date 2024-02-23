\\ Problem 3: Largest Prime Factor
p_003() =
{
  f = factor(600851475143)[,1];
  f[#f]
}

\\ Problem 7: 10001st Prime
p_007() =
{
  prime(10001)
}

\\ Problem 10: Summation of Primes
p_010() =
{
  s = 0;
  forprime(p = 2, 2000000, s += p);
  s
}
