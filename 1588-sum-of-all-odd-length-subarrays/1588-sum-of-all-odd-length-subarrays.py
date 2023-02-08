class Solution:
    def sumOddLengthSubarrays(self, arr: List[int]) -> int:
        result=0
        for i in range(len(arr)+1):
            for j in range(i):
                if len(arr[j:i])%2==1:
                    result+=sum(arr[j:i])
        return result