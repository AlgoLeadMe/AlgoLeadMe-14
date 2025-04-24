import Foundation

/** 입력 값
 - numOfGroups: 그룹 별 개미 수
 - firstGroup: 첫번째 그룹의 개미들(역순)
 - secondGroup: 두번째 그룹의 개미들
 - cycle: 싸이클 수
 */
func solution(_ numOfGroups: [Int], _ firstGroup: String, _ secondGroup: String, _ Cycle: Int) -> String {
    
    // 사이클이 0이면 그대로 붙여서 반환.
    if Cycle == 0 {
        return firstGroup + secondGroup
    }
    
    // String -> Character 배열
    var ants = Array(firstGroup + secondGroup)
    
    // 각 문자가 어느 그룹에 속하는지 (true: 첫번째 그룹, false: 두번째 그룹)
    var groups = Array(repeating: true, count: firstGroup.count) + 
                Array(repeating: false, count: secondGroup.count)
    
    for _ in 0..<Cycle {
        var swapIdx: [(Int, Int)] = []
        
        // 앞의 개미 친구가 나의 그룹이 아니면, 각각의 개미 위치를 저장
        for i in 0..<(ants.count-1) {
            if groups[i] && !groups[i+1] {
                swapIdx.append((i, i+1))
            }
        }
        
        // 기억해둔 개미 위치들을 한번에 교체 시켜줌!
        for (i, j) in swapIdx {
            ants.swapAt(i, j)
            groups.swapAt(i, j)
        }
    }
    
    return String(ants)
}

let numOfGroups = readLine()!.split(separator: " ").map { Int($0)! }
let firstGroup = String(readLine()!.reversed())
let secondGroup = readLine()!
let cycle = Int(readLine()!)!

let res = solution(numOfGroups, firstGroup, secondGroup, cycle)
print(res)