//
//  main.swift
//  1051
//
//  Created by Seungeun Park on 4/5/25.
//

import Foundation

let firstLine = readLine()!.split(separator: " ").map {Int($0)!}
let n = firstLine[0] // 행
let M = firstLine[1] // 열

var grid: [[Int]] = [] // 추가해야 하니까 var
for _ in 0..<n { // 줄로 입력 받아 2차원 배열 만들기
    let row = readLine()!.split(separator: "").map {Int($0)!}
    grid.append(row)
}

func largestSquare(grid: [[Int]]) -> Int {
    let n = grid.count
    let m = grid[0].count
    var maxLength = 1
    
    for i in 0..<n {
        for j in 0..<m {
            for k in 1..<min(n-i, m-j){ // 배열 벗어나면 안되니까 !최소한의 정사각형 크기 잡기
                let a = grid[i][j]
                let b = grid[i][j+k]
                let c = grid[i+k][j]
                let d = grid[i+k][j+k]
                // 각 꼭짓점에 있는 숫자 담기
                
                if a == b && a == c && a == d { // 다 확인하기
                    maxLength = max(maxLength, (k+1)*(k+1)) // 왜 1을 더하냐면 변의 길이가 2일 때, 숫자는 3개가 있음 !
                    /*
                     1  1  1
                     1  1  1
                     1  1  1
                     변의 길이가 2여도 숫자는 3개 있어서 ,,
                     */
                }
            }
        }
    }
    return maxLength
}

print(largestSquare(grid: grid))
