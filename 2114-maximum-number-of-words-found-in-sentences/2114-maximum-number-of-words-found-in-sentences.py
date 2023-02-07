class Solution:
    def mostWordsFound(self, sentences: List[str]) -> int:
        maxlen=len(sentences[0].split(' '))
        for senten in sentences:
            if len(senten.split(' '))>maxlen:
                maxlen=len(senten.split(' '))
        return maxlen
            