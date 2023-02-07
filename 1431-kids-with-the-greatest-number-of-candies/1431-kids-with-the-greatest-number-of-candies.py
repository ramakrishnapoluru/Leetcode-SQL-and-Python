class Solution:
    def kidsWithCandies(self, candies: List[int], extraCandies: int) -> List[bool]:
        result=[]
        for i in range(len(candies)):
            rest=[]
            rest.extend(candies[0:i])
            rest.extend(candies[i+1:len(candies)])
            if candies[i]+extraCandies>=max(rest):
                result.append(True)
            else:
                result.append(False)
        return result