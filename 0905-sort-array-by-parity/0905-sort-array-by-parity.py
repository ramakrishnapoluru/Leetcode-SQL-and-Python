class Solution:
    def sortArrayByParity(self, nums: List[int]) -> List[int]:
        
        result=[]
        for i in nums:
            if i%2==1:
                result.append(i)
            else:
                result.insert(0,i)
        return result
                
            
        