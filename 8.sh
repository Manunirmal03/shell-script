 read -p "Enter a string: " str
str=$(echo "$str" | tr '[:upper:]' '[:lower:]')
vowel_count=0
consonant_count=0

for ((i=0; i<${#str}; i++)); do
  char="${str:i:1}"
  if [[ "$char" == "a" || "$char" == "e" || "$char" == "i" || "$char" == "o" || "$char" == "u" ]]; then
    ((vowel_count++))
  elif [[ "$char" =~ [a-z] ]]; then
    ((consonant_count++))
  fi
done

echo "The number of vowels in '$str' is: $vowel_count"
echo "The number of consonants in '$str' is: $consonant_count"

