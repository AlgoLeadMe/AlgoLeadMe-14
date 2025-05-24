import Foundation

// 그룹 수 1 ~ 10^5 
let input = readLine()!.split(separator: " ").map { Int($0)! }
let group = input[1]

let scores = readLine()!.split(separator: " ").map { Int($0)! }

func canMakeGroups(_ scores: [Int], _ target: Int, _ group: Int) -> Bool {
    var sum = 0
    var count = 0
    
    for score in scores {
        sum += score
        if sum >= target {
            count += 1
            sum = 0
        }
    }
    
    return count >= group
}

func solution(_ scores: [Int], _ group: Int) -> Int {
    var start = 0
    var end = scores.reduce(0, +)
    var res = 0
    
    while start <= end {
        let mid = (start + end) / 2
        
        if canMakeGroups(scores, mid, group) {
            res = mid
            start = mid + 1
        } else {
            end = mid - 1
        }
    }
    
    return res
}

print(solution(scores, group)) 