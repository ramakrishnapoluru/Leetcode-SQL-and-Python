class Solution:
    def sumOfDigits(self, nums: List[int]) -> int:
        return  int(sum( map(int,list(str(min(nums)))) )%2==0)
        
    