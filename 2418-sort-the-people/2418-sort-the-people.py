class Solution:
    def sortPeople(self, names: List[str], heights: List[int]) -> List[str]:
        
        # heightinitial=heights.copy()
        # heights.sort(reverse=True)
        # namesfinal=[]
        # for i in heights:
        #     namesfinal.append(names[heightinitial.index(i)])
        # return namesfinal
        kvp=dict(zip(heights,names))
        names.clear()

        for i in sorted(kvp.keys(),reverse=True):
            names.append(kvp[i])
        return names
    
        
        
            
            
     
            
            
        