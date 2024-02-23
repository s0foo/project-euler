\\ Problem 3: Largest Prime Factor
p_003() =
{
  f = factor(600851475143)[,1];
  f[#f]
}
