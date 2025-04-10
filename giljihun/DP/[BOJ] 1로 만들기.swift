//
//  main.swift
//  PS
//
//  Created by 길지훈 on 3/30/25.
//

/* MARK: - NOTE
 
 GOAL => N을 1로 만드는 최소 연산 횟수 찾기
 1. 숫자에서 -1
 2. 숫자가 2로 떨어지면 //2
 3. 숫자가 3으로 떨어지면 //3
 
 작은 숫자부터 1로 만드는 연산횟수를 구해간다.
 그렇게 dp로 큰 숫자의 연산횟수를 구할 때 더 빨리 구하면 될듯?
 
 dp[i] = min(dp[i-1], dp[i/2], dp[i/3] + 1
 - 2, 3으로 떨어지는 경우에만.
 - 항상 1빼기 연산은 가능.
 
*/

// MARK: - CODE
import Foundation

guard let N = Int(readLine() ?? "") else { exit(0) }

if N == 1 {
    print(0)
    exit(0)
}

var dp = Array(repeating: 0, count: N + 1)
dp[1] = 0

for i in 2...N {
    // 1을 빼는 연산은 항상 가능함
    dp[i] = dp[i-1] + 1
    
    if i % 2 == 0 {
        dp[i] = min(dp[i], dp[i/2] + 1)
    }
    
    if i % 3 == 0 {
        dp[i] = min(dp[i], dp[i/3] + 1)
    }
}

print(dp[N])
