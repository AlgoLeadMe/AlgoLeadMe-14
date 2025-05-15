//
//  main.swift
//  9095
//
//  Created by Seungeun Park on 5/11/25.
//

import Foundation

let N = Int(readLine()!)!

var number : [Int] = []

for _ in 0 ..< N {
    number.append(Int(readLine()!)!)
}

func dp(N : Int) -> Int {
    //var array = [Int](repeating: 0, count: N + 1)
    // 처음에 생각 안 하고 N개 만들었다가 N에 2나 1 같은 게 들어올 수 있는 걸 대응 안 했다.
    // 만약 1이 들어왔을 경우 아래 초기화는 bound를 넘어서게 된다. 그렇다면 최소 배열을 4로 만들어주면 됨 !
    var array = [Int](repeating: 0, count: max(N + 1, 4))
    
    array[1] = 1
    array[2] = 2
    array[3] = 4 // 3까지는 자기 자신을 가지고 있기 때문에 초기화 해줘야 함
    
    if N >= 4 { // 여기도 마찬가지로 N이 4이상인 경우로 제한해줘야 한다.
        for i in 4 ... N {
            array[i] = array[i - 1] + array[i - 2] + array[i - 3]
        }
    }
    
    return array[N]
}

for k in number {
    print(dp(N : k))
}

