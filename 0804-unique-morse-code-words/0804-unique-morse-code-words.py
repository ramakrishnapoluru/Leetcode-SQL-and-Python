class Solution:
    def uniqueMorseRepresentations(self, words: List[str]) -> int:
        morsecode=[".-","-...","-.-.","-..",".","..-.","--.","....","..",".---","-.-",".-..","--","-.","---",".--.","--.-",".-.","...","-","..-","...-",".--","-..-","-.--","--.."]
        setresult=set()
        for element in words:
            morsecodestr=''
            for char in element:
                morsecodestr+=morsecode[ord(char)-97]
            setresult.add(morsecodestr)
            
        return len(setresult)
