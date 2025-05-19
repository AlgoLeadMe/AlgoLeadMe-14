//
//  main.swift
//
//  Created by Demian Yoo on 4/16/25.
//

// 1.상하좌우 중에 0인칸 (청소가 되지않은 칸)이 없는 경우.
// 현재 방향 유지 1칸 뒤로 이동
// 0인칸 만나면 1로 바꾸기
// 뒤로 못 가면(1인 경우) 작동 멈추기 -> 작동 멈추는 조건 해당 좌표 뱉어야함.

// 2.상하좌우 중에 0인 칸이 있는 경우.
// 왼쪽으로 90도 회전한다.
// 앞 칸이 0일 경우, 앞으로 1칸 이동하고 1로 바꾼다.
// 1로 돌아간다. (상하좌우 탐색)

// x,y 좌표 북동남서

import Foundation
// 북동남서
let dx = [0,1,0,-1]
let dy = [-1,0,1,0]

// MARK: 보드 사이즈 입력 최소 3이상 최대 50이하.
let boardSize = readLine()!.split(separator: " ").map { Int($0)! }
let (N,M) = (boardSize[0], boardSize[1])

// MARK: 청소기 시작 좌표 입력
let robotInfo = readLine()!.split(separator: " ").map { Int($0)! }
let (r,c,d) = (robotInfo[0], robotInfo[1], robotInfo[2])

// MARK: 보드 선언
var board: [[Int]] = []


// MARK: 보드 초기화
for _ in 0..<N {
    let row = readLine()!.split(separator: " ").map{ Int($0)! }
    board.append(row)
}

// 왼쪽90도는 오른쪽으로 +3
func turnLeft(from direction: Int) -> Int {
    return (direction + 3) % 4
}

func dfs( _ count: Int, _ nowDir: Int,_ x: Int, _ y:Int) {
    
    // 1. 현재 위치가 청소되지 않았다면 -> 청소
    if board[y][x] == 0 {
        board[y][x] = 2
    }
    
    var d = nowDir
    
    for i in 0..<4{
        // 왼쪽으로 한번 회전
        d = turnLeft(from: d)
        let nx = x + dx[d]
        let ny = y + dy[d]
        
        if ny < 0 || ny >= N || nx < 0 || nx >= M { continue }
        
        //0인 칸이 아니어도 다음 index로 넘어감
        if board[ny][nx] != 0 { continue }
        
        // 청소
        board[ny][nx] = 2
        
        //다음 실행
        dfs(count + 1, d, nx, ny)
        return
    }
    
    // 2. 4방향 모두 청소 불가 후진
    let back = (nowDir + 2) % 4
    let bx = x + dx[back]
    let by = y + dy[back]
    
    
    // 뒤로 이동하려는 칸이 1인 경우 (벽이라 이동 불가)
    // 현재까지의 값을 출력하고 종료함
    // 1이 아니라면 뒤로 이동하여 dfs 실행
    if board[by][bx] == 1 {
        print(count)
        exit(0)
    } else {
        dfs(count, nowDir, bx, by)
    }
}

// 시작 위치를 청소하고 dfs 실행
// 여기서 헷갈리면 안되는 점은
// 지도 상에서 rows가 위아래로 이동하는 값이고 cols가 좌우로 이동하는 값임
// x값 = c, y값 = r 이라는 말.

// 무조건 제자리 청소함.
board[r][c] = 2
var result = 1
dfs(result, d, c, r)
