read -p "Enter a string: " str
str=$(echo "$str" | tr '[:upper:]' '[:lower:]')
len=${#str}
is_palindrome=1

for ((i=0, j=len-1; i<j; i++, j--)); do
  if [ "${str:i:1}" != "${str:j:1}" ]; then
    is_palindrome=0
    break
  fi
done

if [ $is_palindrome -eq 1 ]; then
  echo "The string '$str' is a palindrome"
else
  echo "The string '$str' is not a palindrome"
fi

