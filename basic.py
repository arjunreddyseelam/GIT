def is_palindrome(number):
    # Convert the number to a string
    number_str = str(number)
    # Compare the string with its reverse
    return number_str == number_str[::-1]

# Test the function
number_to_check = 12321
print(is_palindrome(number_to_check))  # Output: True