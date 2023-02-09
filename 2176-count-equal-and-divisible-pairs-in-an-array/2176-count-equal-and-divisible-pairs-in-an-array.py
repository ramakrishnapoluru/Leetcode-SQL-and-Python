class Solution:
    def countPairs(self, nums: List[int], k: int) -> int:
        kvp=dict()
        counter=0
        for i,v in enumerate(nums):
            if v in kvp:
                kvp[v].append(i)
            else:
                kvp[v]=[i]
    
    
    
        for kv in kvp.values():
            for i in range(len(kv)):
                for j in range(i+1,len(kv)):
                    if kv[i]*kv[j]%k==0:
                        counter+=1
                        

                
        # print(kvp) 
        
        
        return counter