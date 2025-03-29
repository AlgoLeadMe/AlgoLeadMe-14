import Foundation

// 1. 입력
let NM = readLine()!.split(separator: " ").map { Int(String($0))! }
var board:[[Int]] = []
let N = NM[0] - 1
let M = NM[1] - 1

for _ in 0...N {
    board.append(readLine()!.map { Int(String($0))! })
}

// 2. 필요한 변수 선언
let dx = [0,0,-1,1]
let dy = [-1,1,0,0]

var queue:[(Int,Int)] = [(0,0)]
var idx = 0

// 3. 미로 탐색(BFS)
board[0][0] = 0
while idx < queue.count {
    let current = queue[idx]
    idx += 1
    
    if current.0 == N && current.1 == M { break }
    for i in 0..<4 {
        let nx = current.0 + dx[i]
        let ny = current.1 + dy[i]
        
        if nx > M || nx < 0 || ny > N || ny < 0 { continue }
        if board[ny][nx] == 1 {
            queue.append((nx,ny))
            board[ny][nx] = board[current.1][current.0] + 1
        }
    }
}

// 4. 결과 출력
print(board[N][M] + 1)

