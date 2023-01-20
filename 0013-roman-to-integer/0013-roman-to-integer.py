class Solution:
    def romanToInt(self, s: str) -> int:
        romannumeral={
            'I':1,
            'V':5,
            'X':10,
            'L':50,
            'C':100,
            'D':500,
            'M':1000
        }
        i=0
        outputcaluclation=0
        while i<len(s):
            
            if i<len(s)-1 and romannumeral[s[i]]<romannumeral[s[i+1]]:
                outputcaluclation=outputcaluclation+(romannumeral[s[i+1]]-romannumeral[s[i]])
                i=i+2
            else:
                outputcaluclation=outputcaluclation+romannumeral[s[i]]
                i=i+1
        return outputcaluclation
