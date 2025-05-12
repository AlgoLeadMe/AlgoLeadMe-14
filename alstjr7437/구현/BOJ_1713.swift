let N = Int(readLine()!)!
let totalCount = Int(readLine()!)!
let recommend = readLine()!.split(separator: " ").map { Int(String($0))! }

var result: [Int: (recommendCount: Int, time: Int)] = [:]
var currentTime = 0

for student in recommend {
    if result[student] != nil {
        result[student]!.recommendCount += 1
    } else {
        if result.count < N {
            result[student] = (1, currentTime)
        } else {
            let removeValue = result.min {
                if $0.value.recommendCount == $1.value.recommendCount {
                    return $0.value.time < $1.value.time
                }
                return $0.value.recommendCount < $1.value.recommendCount
            }!.key
            
            result.removeValue(forKey: removeValue)
            result[student] = (1, currentTime)
        }
    }
    currentTime += 1
}

print(result.keys.sorted().map { String($0) }.joined(separator: " "))
