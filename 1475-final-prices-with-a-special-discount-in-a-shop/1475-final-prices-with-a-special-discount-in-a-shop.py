class Solution:
    def finalPrices(self, prices: List[int]) -> List[int]:
        
        discount=[]
        for i in range(len(prices)-1):
            for j in prices[i+1:]:
                if prices[i]>=j:
                    print(prices[i]-j)
                    discount.append(prices[i]-j)
                    print(discount)
                    break
            else:
                discount.append(prices[i])
        discount.append(prices[-1])
        return discount
            
            
            