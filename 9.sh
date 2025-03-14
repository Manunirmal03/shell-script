#!/bin/bash

while true; do
    echo "===== STRING MANIPULATION MENU ====="
    echo "1. Convert to Uppercase"
    echo "2. Convert to Lowercase"
    echo "3. Find String Length"
    echo "4. Reverse a String"
    echo "5. Extract a Substring"
    echo "6. Replace a Word in a String"
    echo "7. Count Occurrences of a Character/Word"
    echo "8. Check if a String is Empty or Not"
    echo "9. Remove Whitespaces from a String"
    echo "10. Split a String by a Delimiter"
    echo "11. Append a Character to a String"
    echo "12. Check if Two Strings are Equal"
    echo "13. Exit"
    read -p "Enter your choice: " choice

    case $choice in
        1) 
            read -p "Enter a string: " str
            result=""
            for ((i=0; i<${#str}; i++)); do
                char="${str:$i:1}"
                case "$char" in
                    [a-z]) result+=$(echo "$char" | awk '{printf("%c", toupper($1))}') ;;
                    *) result+="$char" ;;
                esac
            done
            echo "Uppercase: $result"
            ;;
        2) 
            read -p "Enter a string: " str
            result=""
            for ((i=0; i<${#str}; i++)); do
                char="${str:$i:1}"
                case "$char" in
                    [A-Z]) result+=$(echo "$char" | awk '{printf("%c", tolower($1))}') ;;
                    *) result+="$char" ;;
                esac
            done
            echo "Lowercase: $result"
            ;;
        3)
            read -p "Enter a string: " str
            length=0
            while [ -n "$str" ]; do
                str=${str#?}
                ((length++))
            done
            echo "String Length: $length"
            ;;
        4) 
            read -p "Enter a string: " str
            reversed=""
            for ((i=${#str}-1; i>=0; i--)); do
                reversed+="${str:$i:1}"
            done
            echo "Reversed String: $reversed"
            ;;
        5) 
            read -p "Enter a string: " str
            read -p "Enter starting position: " pos
            read -p "Enter length: " len
            substr=""
            for ((i=pos; i<pos+len && i<${#str}; i++)); do
                substr+="${str:$i:1}"
            done
            echo "Substring: $substr"
            ;;
        6)
            read -p "Enter the original string: " str
            read -p "Enter the word to replace: " old
            read -p "Enter the new word: " new
            result=""
            words=($str)
            for word in "${words[@]}"; do
                if [ "$word" == "$old" ]; then
                    result+="$new "
                else
                    result+="$word "
                fi
            done
            echo "Updated String: $result"
            ;;
        7)
            read -p "Enter a string: " str
            read -p "Enter the character/word to count: " search
            count=0
            words=($str)
            for word in "${words[@]}"; do
                if [ "$word" == "$search" ]; then
                    ((count++))
                fi
            done
            echo "Occurrences: $count"
            ;;
        8)
            read -p "Enter a string: " str
            if [ -z "$str" ]; then
                echo "The string is empty."
            else
                echo "The string is not empty."
            fi
            ;;
        9)
            read -p "Enter a string: " str
            trimmed=""
            for ((i=0; i<${#str}; i++)); do
                char="${str:$i:1}"
                if [ "$char" != " " ]; then
                    trimmed+="$char"
                fi
            done
            echo "String without whitespaces: $trimmed"
            ;;
        10)
            read -p "Enter a string: " str
            read -p "Enter delimiter: " delimiter
            temp=""
            for ((i=0; i<${#str}; i++)); do
                char="${str:$i:1}"
                if [ "$char" == "$delimiter" ]; then
                    echo "$temp"
                    temp=""
                else
                    temp+="$char"
                fi
            done
            echo "$temp"
            ;;
        11)
            read -p "Enter a string: " str
            read -p "Enter character to append: " char
            echo "Updated String: ${str}${char}"
            ;;
        12)
            read -p "Enter first string: " str1
            read -p "Enter second string: " str2
            if [ "$str1" == "$str2" ]; then
                echo "Strings are equal."
            else
                echo "Strings are not equal."
            fi
            ;;
        13)
            echo "Exiting..."
            exit 0
            ;;
        *)
            echo "Invalid choice. Please try again."
            ;;
    esac
    echo "--------------------------------------"
done

