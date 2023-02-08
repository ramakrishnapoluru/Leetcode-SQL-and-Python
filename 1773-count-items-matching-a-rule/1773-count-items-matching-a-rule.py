class Solution:
    def countMatches(self, items: List[List[str]], ruleKey: str, ruleValue: str) -> int:
        result=0
        for listoflists in items:
            for index,elements in enumerate(listoflists):
               
                if (ruleKey == "type" and ruleValue ==elements and index==0) or (ruleKey == "color" and ruleValue ==elements and  index==1)  or (ruleKey == "name" and ruleValue == elements and  index==2):
      
                    result+=1
        return result