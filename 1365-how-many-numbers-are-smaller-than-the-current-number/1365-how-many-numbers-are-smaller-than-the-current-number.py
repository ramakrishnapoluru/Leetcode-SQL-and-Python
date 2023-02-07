class Solution:
    def smallerNumbersThanCurrent(self, nums: List[int]) -> List[int]:
        result=[]
        for i in range(len(nums)):
            rest=[]
            counter=0
            rest.extend(nums[0:i])
            rest.extend(nums[i+1:len(nums)])
            for j in range(len(rest)):
                if nums[i]>rest[j]:
                    counter+=1
            result.append(counter)
        return result
                