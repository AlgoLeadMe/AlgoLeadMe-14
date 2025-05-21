import Foundation

/*
 
 1~N까지 정수로 이루어진 N자리의 순열.
 
 K가 주어짐 ->
 어떤 수를 뒤집음 ->
 그 수부터 오른쪽으로 K개의 수를 뒤집음.
 
 [5 4 3 2 1], K = 3 ->
 어떤 수 = 4 ->
 [5 2 4 3 1]
 
 5 4 3 2 1
 5 4 3 2 1
 5 4 1 2 3
 1 4 5 2 3
 1 2 5 4 3
 1 2 3 4 5
 -> 5번..
 -> 각 상태를 체크하고 오름차순과 맞는지 계속 봐야함.
 
 
 2 ≤ K ≤ N ≤ 8
 
 --------------------
 
 입력으로 들어온 수를 오름차순으로 sort하고싶음!
 근데 최소한의 turn으로.
 몇 번의 turn이 필요?
 
 --------------------
 
 1. turn을 지나오며 오름차순 배열과 같은 지 체크한다?
 2. 근데 오름차순으로 만들 수 없는 경우는? -> 끝까지 오름차순 배열이 안나올때?

 */

// 입력부
guard let input = readLine()?.split(separator: " ").compactMap({ Int($0) }),
          input.count == 2 else { exit(0) }
let (N, K) = (input[0], input[1])

guard let initialArr = readLine()?.split(separator: " ").compactMap({ Int($0) }),
      initialArr.count > 0 else { exit(0) }
      
// 목표 타겟
let targetArr = initialArr.sorted()


// BFS
var searchQueue: [([Int], Int)] = [(initialArr, 0)]
var visitedArr: Set<[Int]> = [initialArr]

while !searchQueue.isEmpty {
    let (currentArr, turnCnt) = searchQueue.removeFirst()
    
    if currentArr == targetArr {
        print(turnCnt)
        exit(0)
    }
    
    for i in 0..<(N - K + 1) {
        var nextArr = currentArr
        nextArr[i..<i+K].reverse()
        
        if !visitedArr.contains(nextArr) {
            visitedArr.insert(nextArr)
            searchQueue.append((nextArr, turnCnt + 1))
        }
    }
}

print(-1)