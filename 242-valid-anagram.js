/*
    242. Valid Anagram
    https://leetcode.com/problems/valid-anagram/

    Given two strings s and t, return true if t is an anagram of s, and false otherwise.

    Example 1:
        Input: s = "anagram", t = "nagaram"
        Output: true

    Example 2:
        Input: s = "rat", t = "car"
        Output: false

    Constraints:
        1 <= s.length, t.length <= 5 * 104
        s and t consist of lowercase English letters.
*/


const tallyMap = (items) => {
    return items.reduce((map, item) => {
        map.set(item, (map.get(item) ?? 0) + 1);
        return map;
    }, new Map());
};


const mapEquals = (map1, map2) => {
    if (map1.size !== map2.size) return false;
    for (const [key, value] of map1) {
        if (!map2.has(key) || map2.get(key) !== value) { return false; }
    }
    return true;
};


/**
 * @param {string} s
 * @param {string} t
 * @return {boolean}
 */
var isAnagram = function (s, t) {
    // tally maps for s and t
    const ss = tallyMap([...s]);
    const tt = tallyMap([...t]);

    return mapEquals(ss, tt) && mapEquals(tt, ss);
};