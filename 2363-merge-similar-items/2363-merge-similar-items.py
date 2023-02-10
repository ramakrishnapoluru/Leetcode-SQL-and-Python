class Solution:
    def mergeSimilarItems(self, items1: List[List[int]], items2: List[List[int]]) -> List[List[int]]:
        
        kvp1=dict()
        kvp2=dict()
        values=[]
        result=[]
        
        for i in items1:
            kvp1[i[0]]=i[1]
            if i[0] not in values:
                values.append(i[0])
        for j in items2:
            kvp2[j[0]]=j[1]
            if j[0] not in values:
                values.append(j[0])
        values.sort()
        for i in values:
            result.append([i,kvp1.get(i,0)+kvp2.get(i,0)])
        return result
        
        
            
