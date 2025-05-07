import Foundation

var paper = Array(repeating: Array(repeating: 0, count: 100), count: 100)

let T = Int(readLine()!)!  // 색종이 개수
var result = 0

for _ in 0..<T {
    let input = readLine()!.split(separator:" ").map{ Int($0)! }
    let x = input[0]
    let y = input[1]
    
    // 색종이 한 장은 10X10크기
    for i in x..<x+10 {
        for j in y..<y+10 {
            paper[i][j] = 1
        }
    }
}

// 반복문은 색종이 입력 끝나고 난 뒤에 한 번만 돌려야 함
for i in 0..<100 {
    for j in 0..<100 {
        if paper[i][j] == 1 {
            result += 1
        }
    }
}

print(result)
