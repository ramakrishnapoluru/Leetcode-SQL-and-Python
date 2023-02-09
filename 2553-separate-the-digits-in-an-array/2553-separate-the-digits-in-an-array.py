class Solution:
    def separateDigits(self, nums: List[int]) -> List[int]:
        result=[]
        for i in nums:
            result.extend(list(list(str(i))))
        # for i,v in enumerate(result):
        #     result[i]=eval(v)
        # return result
        return map(int,result)