//
//  main.swift
//  11725
//
//  Created by Seungeun Park on 4/10/25.
//

import Foundation

let N = Int(readLine()!)!

var graph = Array(repeating: [Int](), count: N+1)
var parent = Array(repeating:0, count: N+1)
var visited = Array(repeating: false, count: N+1)

for _ in 0..<N-1 {
    let edge = readLine()!.split(separator: " ").map {Int($0)!}
    
    let a = edge[0]
    let b = edge[1]
    
    graph[a].append(b)
    graph[b].append(a)
}

func dfs(_ currentnode : Int){
    visited[currentnode] = true
    
    for next in graph[currentnode] {
        if !visited[next] {
            parent[next] = currentnode
            dfs(next)
        }
    }
}

dfs(1)

for i in 2...N {
    print(parent[i])
}
