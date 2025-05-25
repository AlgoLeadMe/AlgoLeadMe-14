import Foundation

// abs(sum - target)가 가장 작은애 찾기

class Solution {
    func threeSumClosest(_ nums: [Int], _ target: Int) -> Int {
        func caculate(_ sum: Int) -> Int {
            return abs(sum - target)
        }

//        var answer = 3000 // 최대값 범위 3개 더한 것 으로 해줬는데, target이 높아서 이렇게 해주면 틀리다고 뜸 !
//        var answer = Int.max // 터짐 - max값에 +가 조금이라도 되니까 펑 터져버리는 이슈가 있음
        var answer = Int(Int32.max) // 그래서 그나마 값이 조금 작은 큰값으로 해결 
        var nums = nums
        nums.sort(by: <)
        let LEN = nums.count
        for i in 0 ..< LEN - 2 {
            var left = i + 1
            var right = LEN - 1
            while left < right {
                let totalSum = nums[i] + nums[left] + nums[right]
//                print(nums[i], nums[left], nums[right])
//                print(totalSum)
//                print(caculate(totalSum))
                if caculate(totalSum) < caculate(answer) {
//                    print(nums[i], nums[left], nums[right])
                    answer = totalSum
                }
                if totalSum < target {
                    left += 1
                } else if totalSum > target {
                    right -= 1
                } else {
                    return target
                }
            }
        }
        return answer
    }
}

print(Solution().threeSumClosest([1, 1, 1, 1], -100))
