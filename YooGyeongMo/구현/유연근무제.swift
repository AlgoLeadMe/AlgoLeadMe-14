import Foundation

func minSum(_ n: Int) -> Int {
    var h = Int(n / 100)
    var m = n % 100
    return h * 60 + m
}


func solution(_ schedules:[Int], _ timelogs:[[Int]], _ startday:Int) -> Int {
    
    var result: Int = 0
    
    for i in 0..<schedules.count {
        let time: Int = minSum(schedules[i]) + 10
        var cnt: Int = 0
        
        for j in 0...6 {
            let day_idx:Int = (startday - 1 + j) % 7
            if day_idx <= 4 && time >= minSum(timelogs[i][j]) {
                cnt += 1
            }
        }
        if cnt == 5 {
            result += 1
        }
    }
    return result
}