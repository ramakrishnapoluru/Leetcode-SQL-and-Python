class Solution:
    def sortPeople(self, names: List[str], heights: List[int]) -> List[str]:
        heightinitial=heights.copy()
        heights.sort(reverse=True)
        namesfinal=[]
        for i in heights:
            namesfinal.append(names[heightinitial.index(i)])
        return namesfinal
            
            
     
            
            
        