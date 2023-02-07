class Solution:
    def differenceOfSum(self, nums: List[int]) -> int:
        sumoflist=sum(nums)
        digitssum=0
        for i in nums:
            while i>0:
                remainder=i%10
                digitssum+=remainder
                i=i//10
        return sumoflist-digitssum
