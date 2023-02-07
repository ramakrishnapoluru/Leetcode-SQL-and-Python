class Solution:
    def getConcatenation(self, nums: List[int]) -> List[int]:
        lennums=len(nums)
        for i in range(lennums):
            nums.append(nums[i])
        return nums
     