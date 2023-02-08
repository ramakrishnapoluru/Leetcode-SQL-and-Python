class Solution:
    def countKDifference(self, nums: List[int], k: int) -> int:
        result=0
        kvp=dict()
        
        for i in nums:
            if i in kvp:
                kvp[i] +=1
            else:
                kvp[i] = 1
                
        for i in kvp:
             if i+k in kvp:
                    result+=kvp[i]*kvp[i+k]
        
        return result
                
        
        