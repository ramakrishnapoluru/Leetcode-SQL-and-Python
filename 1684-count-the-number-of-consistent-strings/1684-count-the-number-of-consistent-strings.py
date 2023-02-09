class Solution:
    def countConsistentStrings(self, allowed: str, words: List[str]) -> int:
        counter=0
        for element in words:
            if all(char in list(allowed) for char in list(element)):
                counter+=1
        return counter