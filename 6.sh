echo "Enter a number: "
read num
temp=$num
rev=0
while [ $num -gt 0 ]
do 
  rem=$((num%10))
  rev=$((rev*10+rem))
  num=$((num/10))
done
if [ $rev -eq $temp ]; then
  echo "$temp is a Palindrome Number"
else
  echo "$temp is Not a Palindrome Number"
fi      
