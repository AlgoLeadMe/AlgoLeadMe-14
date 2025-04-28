//
//  main.swift
//  11656
//
//  Created by Seungeun Park on 4/28/25.
//

import Foundation

let N = readLine()!
let num = N.count
var array : [String] = []

for i in 0 ..< num {
    let startIndex = N.index(N.startIndex, offsetBy: i)
    let suffix = N[startIndex...]
    array.append(String(suffix))
}

array.sort()

for item in array {
    print(item)
}

