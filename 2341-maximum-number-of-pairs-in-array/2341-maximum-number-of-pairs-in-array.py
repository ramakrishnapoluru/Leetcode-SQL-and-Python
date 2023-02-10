class Solution:
    def numberOfPairs(self, nums: List[int]) -> List[int]:
        kvp=dict()
        counter,left=0,0
        for i in nums:
            if i in kvp:
                kvp[i]+=1
            else:
                kvp[i]=1
        print(kvp)
        for i in kvp.values():
            counter+=i//2
            left+=i%2
        return [counter,left]
 
