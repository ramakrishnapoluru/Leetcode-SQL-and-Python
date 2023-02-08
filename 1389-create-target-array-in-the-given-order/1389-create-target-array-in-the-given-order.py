class Solution:
    def createTargetArray(self, nums: List[int], index: List[int]) -> List[int]:
        result=[None]*len(nums)
        print(result)
        for i,j in zip(nums,index):
            

            
            if result[j]:

                print(result)
                
                temp=result[j:len(nums)]
                
                print(temp)
                
                result.insert(j,i)
                
                result.extend(temp)

                temp.clear()
                
            else:
              
                result.insert(j,i)
              
        return result[0:len(nums)]