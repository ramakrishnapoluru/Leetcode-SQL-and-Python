class Solution:
    def divideArray(self, nums: List[int]) -> bool:
        flag=True
        nums.sort()
        print(nums)
        if len(nums)%2==0:
            for i in range(0,len(nums),2):
                if nums[i]==nums[i+1]:
                    falg=False
                else:
                    return False
        
        else:
            return False
        return flag
                
            
            
