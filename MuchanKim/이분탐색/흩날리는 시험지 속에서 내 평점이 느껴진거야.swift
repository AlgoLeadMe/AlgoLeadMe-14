import Foundation

// 그룹 수 1 ~ 10^5 
let input = readLine()!.split(separator: " ").map { Int($0)! }
let group = input[1]

// 문제 최대 개수 20
let scores = readLine()!.split(separator: " ").map { Int($0)! }

var start = 0
var end = 20 * 100000
var answer = -1

while start <= end {
    let mid = (start + end) / 2
    var sum = 0
    var count = 0
    
    for score in scores {
        sum += score
        if sum >= mid {
            count += 1
            sum = 0
        }
    }
    
    if count >= group {
        answer = mid
        start = mid + 1
    } else {
        end = mid - 1
    }
}

print(answer) 