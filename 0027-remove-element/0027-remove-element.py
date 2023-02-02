class Solution:
    def removeElement(self, nums: List[int], val: int) -> int:
        count=0
        i=0
        for j in range(len(nums)):
            if nums[j]!=val:
                nums[i]=nums[j]
                i=i+1
        return i
         