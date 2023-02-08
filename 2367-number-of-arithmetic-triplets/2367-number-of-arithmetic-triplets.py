class Solution:
    def arithmeticTriplets(self, nums: List[int], diff: int) -> int:
        result=0
        # for i in range(len(nums)):
        #     for j in range(i,len(nums)):
        #         for k in range(j,len(nums)):
        #             if nums[j] - nums[i] == diff and nums[k] - nums[j] == diff:
        #                 result+=1
        for element in nums:
            if element+diff in nums and element+diff*2 in nums:
                result+=1
        return result
                        