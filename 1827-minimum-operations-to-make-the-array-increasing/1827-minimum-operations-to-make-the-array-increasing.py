class Solution:
    def minOperations(self, nums: List[int]) -> int:
        
        counter=0
        for i in range(len(nums)):
            if nums[i]>max(nums[:i+1]):
                pass
            else:
              
                counter+=max(nums[:i+1])-nums[i]
                nums[i]=max(nums[:i+1])+1
                print(nums[i])
                
            
                
        return counter
                