# 3. Longest Substring Without Repeating Characters

# Given a string s, find the length of the longest substring without duplicate characters.

# Example 1:
# Input: s = "abcabcbb"
# Output: 3
# Explanation: The answer is "abc", with the length of 3. Note that "bca" and "cab" are also correct answers.

# Example 2:
# Input: s = "bbbbb"
# Output: 1
# Explanation: The answer is "b", with the length of 1.

# Example 3:
# Input: s = "pwwkew"
# Output: 3
# Explanation: The answer is "wke", with the length of 3.
# Notice that the answer must be a substring, "pwke" is a subsequence and not a substring.
 

# Constraints:
# 0 <= s.length <= 105
# s consists of English letters, digits, symbols and spaces.



# @param {String} s
# @return {Integer}
def length_of_longest_substring(s)
    return 0 if s.nil? || s.empty?
    p s

    seen = {}

    longest = 0
    substr_start = 0

    s.chars.each_with_index do |c, i|
        if seen[c]
            # p "seen #{c} at #{i}"

            left_substr_start = substr_start
            substr_start = [substr_start, seen[c] + 1].max
            
            substr = s[substr_start..i]
            # p substr

            substr_length = i - substr_start +1
            # p "substr_length #{substr_length}"

            if substr_length > longest
              longest = substr_length 
            #   p "longest updated to #{longest}"
            end


            # left substr
            left_substr = s[left_substr_start..i-1]
            # p "left_substr #{left_substr}"

            substr_length = i - left_substr_start

            if substr_length > longest
              longest = substr_length 
            #   p "longest updated to #{longest}"
            end


            seen[c] = i
            next
        end

        if i == s.size() -1
            # p "new #{c} at #{i} (last)"
            substr = s[substr_start..i]
            # p substr

            substr_length = i - substr_start + 1
            # p "substr_length #{substr_length}"

            if substr_length > longest
              longest = substr_length 
            #   p "longest updated to #{longest}"
            end

            next
        end

        seen[c] = i
        # p "new #{c} at #{i}"
    end

    longest
end
