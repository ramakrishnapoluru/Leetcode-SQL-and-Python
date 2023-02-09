class Solution:
    def arraysIntersection(self, arr1: List[int], arr2: List[int], arr3: List[int]) -> List[int]:
        arr1= list(set(set(arr1).intersection(set(arr2))).intersection(arr3))
        arr1.sort()
        return arr1
        