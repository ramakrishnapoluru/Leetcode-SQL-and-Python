class Solution:
    def createTargetArray(self, nums: List[int], index: List[int]) -> List[int]:
        # result=[None]*len(nums)
        # print(result)
        # for i,j in zip(nums,index):
        #     if result[j]:
        #         temp=result[j:len(nums)]
        #         result.insert(j,i)
        #         result.extend(temp)
        #         temp.clear()
        #     else:
        #         result.insert(j,i)
        target=[]
        for num, idx in zip(nums, index):
            target.insert(idx, num)
        return target