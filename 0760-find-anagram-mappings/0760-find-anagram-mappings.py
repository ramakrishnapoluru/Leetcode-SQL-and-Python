class Solution:
    def anagramMappings(self, nums1: List[int], nums2: List[int]) -> List[int]:
        result=[]
        for i in nums1:
            result.append(nums2.index(i))
        return result