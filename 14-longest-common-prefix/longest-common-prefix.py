class Solution:
    def longestCommonPrefix(self, strs: List[str]) -> str:
        strs.sort()
        common=""
        first_elem=strs[0]
        last_elem=strs[-1]
        for i in range(min(len(first_elem),len(last_elem))):
            if first_elem[i]!=last_elem[i]:
                return common
            common+=last_elem[i]
        return common