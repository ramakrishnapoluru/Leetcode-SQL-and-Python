class Solution:
    def flipAndInvertImage(self, image: List[List[int]]) -> List[List[int]]:
        result=[]
        for i in image:
            ilist=[]
            i=i[::-1]
            for j in i:
                if j:
                    ilist.append(0)
                else:
                    ilist.append(1)
            result.append(ilist)
        return result