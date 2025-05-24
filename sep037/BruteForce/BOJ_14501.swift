//
//  main.swift
//  14501
//
//  Created by Seungeun Park on 5/24/25.
//

import Foundation

let N = Int(readLine()!)!
var profitFromWork : [(Int, Int)] = []
var maxProfit = 0

for _ in 0 ..< N {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    let (time, profit) = (input[0], input[1])
    profitFromWork.append((time, profit))
}

func workTime(day: Int, profit: Int){
    if day >= N {
        maxProfit = max(maxProfit, profit)
        return
    }
    
    if day + profitFromWork[day].0 <= N {
        workTime(day: day + profitFromWork[day].0, profit: profit + profitFromWork[day].1)
    }
    workTime(day: day + 1, profit: profit)
}

workTime(day: 0, profit: 0)
print(maxProfit)
