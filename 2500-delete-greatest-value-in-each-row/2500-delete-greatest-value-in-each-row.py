class Solution:
    def deleteGreatestValue(self, grid: List[List[int]]) -> int:
        maxelem=[]
        result=0
        for j in range(len(grid[0])):
            for i in range(len(grid)):
                        l=len(maxelem)
                        maxelementofrow=max(grid[i])
                        maxelem.append(maxelementofrow)
                        grid[i][grid[i].index(maxelementofrow)]=0
        for k in range(0,len(grid[0])*len(grid),len(grid)):
             result+=max(maxelem[k:k+len(grid)])
        return result