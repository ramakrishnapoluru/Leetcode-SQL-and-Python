class Solution:
    def numIdenticalPairs(self, nums: List[int]) -> int:
        # counter=0
        # for i in range(len(nums)):
        #     for j in range(i+1,len(nums)):
        #         if nums[i]==nums[j]:
        #             counter+=1
        # return counter
        d=dict()
        res=0
        for numbers in nums:
            if numbers in d:
                res+=d[numbers]
                d[numbers]+=1
            else:
                d[numbers]=1
        return res
                