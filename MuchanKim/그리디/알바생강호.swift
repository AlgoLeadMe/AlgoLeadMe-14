import Foundation

func solution(_ n: Int, _ tips: [Int]) -> Int {
    let sortedTips = tips.sorted(by: >)
    
    var totalTip = 0
    for i in 0..<sortedTips.count {
        let actualTip = sortedTips[i] - i
        if actualTip > 0 {
            totalTip += actualTip
        }
    }
    
    return totalTip
}

// 손님 수 입력
let n = Int(readLine()!)!

// 각 손님의 팁 입력
var tips: [Int] = []
for _ in 0..<n {
    let tip = Int(readLine()!)!
    tips.append(tip)
}

let res = solution(n, tips)
print(res)
