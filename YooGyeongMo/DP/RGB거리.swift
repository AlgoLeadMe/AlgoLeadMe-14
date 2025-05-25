import Foundation

// RGB 순으로 N 개의 집이 들어온다.
// 여러 조건이 있지만 단 하나의 조건만 만족하면된다. 현재, 집에서 전,후 집 색과 겹치지만 않으면 된다.
// dp 배열로 현재 좌표에 대한것을 전 좌표 비교후 저장하여 마지막 것만 내면 될듯함. 
// 입력값 최대 1000, 재귀보단 반복문 바텀업 ㄱ

let n = Int(readLine()!)!

var arr = Array(repeating: Array(repeating:0, count: 3), count: n) // 0 Based Indexing

var dp = Array(repeating: Array(repeating:0 , count: 3), count: n)

for i in 0..<n {
    arr[i] = readLine()!.split(separator: " ").map{ Int($0)! }
}
// 첫번째 집 초기화
dp[0][0] = arr[0][0]
dp[0][1] = arr[0][1]
dp[0][2] = arr[0][2]

for i in 1..<n {
    dp[i][0] = min(dp[i-1][1],dp[i-1][2]) + arr[i][0]
    dp[i][1] = min(dp[i-1][0],dp[i-1][2]) + arr[i][1]
    dp[i][2] = min(dp[i-1][0],dp[i-1][1]) + arr[i][2]
}

print(min(dp[n-1][0],dp[n-1][1],dp[n-1][2]))
