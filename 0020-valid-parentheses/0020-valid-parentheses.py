class Solution:
    def isValid(self, s: str) -> bool:
        stack=[]
        dictionary={
            '(':')',
            '{':'}',
            '[':']'
        }
        
        for i in s:
            if i in dictionary:
                stack.append(i)
            elif len(stack)==0 or dictionary[stack.pop()]!=i:
                return False
        return len(stack)==0