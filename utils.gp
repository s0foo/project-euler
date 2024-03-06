u_ispalindrome(x) =
{
  r = 0;
  if(x == fromdigits(Vecrev(digits(x))), r = 1);
  r
}
