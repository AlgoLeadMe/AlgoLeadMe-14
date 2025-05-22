import Foundation

func puzzle(diffs: [Int], times: [Int], level: Int) -> Int{
    var result = 0
    for i in 0..<diffs.count {
        if diffs[i] <= level {
            result += times[i]
        } else {
            let discorrectCount = diffs[i] - level
            let discorrectUseTime = times[i - 1] + times[i]
            let totalUseTime = discorrectUseTime * discorrectCount + times[i]
            result += totalUseTime
        }
    }
    
    return result
}


func solution(_ diffs:[Int], _ times:[Int], _ limit:Int64) -> Int {
    var start = 1
    var end = diffs.max() ?? 100000
    var mid = 0
    var answer = 0
    
    while start <= end {
        mid =  (start + end) / 2
        let result = puzzle(diffs: diffs, times: times, level: mid)
        
        if result <= limit {
            answer = mid  
            end = mid - 1     
        } else {
            start = mid + 1     
        }
    }
    
    return answer
}