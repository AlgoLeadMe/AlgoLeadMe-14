/* MARK: - SOLUTION
 - 아 어케풀지?
 - dp[i] => i를 만드는 방법의 수
 
 1. 입력받고
 2. dp[k+1] 배열 생성
 3. dp[0] = 1 (0은 빈배열이라는 유일한 경우의 수가 있음.)
 4. 점화식 세우기
 5. 출릐역
 
 */

import Foundation

guard let input = readLine(),
      let n = Int(input.split(separator: " ")[0]),
      let k = Int(input.split(separator: " ")[1]) else { exit(0) }

var numbers: [Int] = []

for _ in 0..<n {
    guard let coin = Int(readLine() ?? "") else { exit(0) }
    
    // 런타임에러 잡기1
    if coin <= k {
        numbers.append(coin)
    }
}

var dp = Array(repeating: 0, count: k + 1)
dp[0] = 1

// print(dp)

for num in numbers {
    for i in num...k {
        dp[i] += dp[i - num]
        // 런타임에러 잡기2
        if dp[i] >= 2_147_483_648 {
            dp[i] = 0
        }
    }
}

print(dp[k])
