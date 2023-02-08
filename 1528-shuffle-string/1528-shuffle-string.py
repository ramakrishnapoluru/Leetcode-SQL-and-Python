class Solution:
    def restoreString(self, s: str, indices: List[int]) -> str:
        result=['']*len(s)
        
        for i in range(len(indices)):
            result[indices[i]]=s[i]
        
        return ''.join(result)
    

