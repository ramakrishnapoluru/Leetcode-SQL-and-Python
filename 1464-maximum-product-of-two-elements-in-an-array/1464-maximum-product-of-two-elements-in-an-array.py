class Solution:
    def maxProduct(self, nums: List[int]) -> int:
        nums.sort(reverse=True)
        return (nums[0]-1)*(nums[1]-1)
        
#         result=[]
#         for i in range(len(nums)):
#             for j in range(i+1,len(nums)):
#                 result.append((nums[i]-1)*(nums[j]-1))
#         return max(result)
            
                
    