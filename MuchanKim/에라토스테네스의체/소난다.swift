import Foundation

// 에라토스테네스의 체
func getPrimes(_ maxNum: Int) -> [Bool] {
    var isPrime = Array(repeating: true, count: maxNum + 1)
    isPrime[0] = false
    isPrime[1] = false
    
    for i in 2...Int(Double(maxNum).squareRoot()) {
        if isPrime[i] {
            for j in stride(from: i * i, through: maxNum, by: i) {
                isPrime[j] = false
            }
        }
    }
    
    return isPrime
}

func solution(_ n: Int, _ m: Int, _ cowsWeight: [Int]) -> String {
    if m > n || n <= 0 || m <= 0 {
        return "-1"
    }
    
    // 모든 무게 합의 최대값 계산
    var maxPossibleSum = 0
    for weight in cowsWeight {
        maxPossibleSum += weight
    }
    
    let isPrime = getPrimes(maxPossibleSum)
    
    var result: Set<Int> = []
    // 비트마스크를 이용한 조합 생성
    let totalCombinations = 1 << n
    
    for mask in 0..<totalCombinations {
        // 1의 개수 (선택된 원소 수) 확인
        var count = 0
        var sum = 0
        
        for i in 0..<n {
            if (mask & (1 << i)) != 0 {
                count += 1
                sum += cowsWeight[i]
            }
        }
        
        // 정확히 m개가 선택되고, 그 합이 소수인 경우
        if count == m && sum >= 2 && isPrime[sum] {
            result.insert(sum)
        }
    }
    
    let sortedResult = Array(result).sorted()
    return sortedResult.isEmpty ? "-1" : sortedResult.map { String($0) }.joined(separator: " ")
}

let input = readLine()!.split(separator: " ").map { Int($0)! }
let cowWeightArray = readLine()!.split(separator: " ").map { Int($0)! }

let res = solution(input[0], input[1], cowWeightArray)
print(res)