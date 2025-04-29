class Solution {
    func countServers(_ grid: [[Int]]) -> Int {
        var visitedGraph = Array(repeating: Array(repeating: false, count: grid[0].count), count: grid.count)
        func isRange(x: Int, y: Int) -> Bool {
            return x >= 0 && y >= 0 && x < grid.count && y < grid[0].count && grid[x][y] == 1 && visitedGraph[x][y] == false
        }
        var answer = 0
        for i in 0 ..< grid.count {
            for j in 0 ..< grid[0].count {
                var queue = [(Int, Int)]()
                var pointer = 0
                var connectCnt = 0

                if isRange(x: i, y: j) {
                    queue.append((i, j))
                    visitedGraph[i][j] = true // 추가
                    connectCnt += 1
                }

                while pointer < queue.count {
                    let tmp = queue[pointer]
                    let currentX = tmp.0, currentY = tmp.1

//                     굴러갈 수 있는지 확인   / 2차 풀이 : 사실상 이부분만 고쳐주면 될 것같은데, 행 - 열이라

//                    행 계산
                    for row in 0 ..< grid.count {
//                        print("next:", nextX, nextY)
                        if isRange(x: row, y: currentY) {
//                            print("Hi")
                            queue.append((row, currentY))
                            visitedGraph[row][currentY] = true
                            connectCnt += 1
//                            print("ROW", row, currentY)
                        }
                    }
//                    열 계싼
                    for col in 0 ..< grid[0].count {
//                        print("next:", nextX, nextY)
                        if isRange(x: currentX, y: col) {
//                            print("Hi")
                            queue.append((currentX, col))
                            visitedGraph[currentX][col] = true
                            connectCnt += 1
//                            print("COL", currentX, col)
                        }
                    }

                    pointer += 1
                }
                if connectCnt > 1 {
                    answer += connectCnt
                    connectCnt = 1
                }
            }
        }

//        print(answer)
        return answer
    }
}

//
// Solution().countServers([[1, 0], [1, 1]])
// Solution().countServers([[1, 1, 0, 0], [0, 0, 1, 0], [0, 0, 1, 0], [0, 0, 0, 1]])
// Solution().countServers([[1, 0], [1, 1]])
Solution().countServers([[1, 0, 0, 1, 0], [0, 0, 0, 0, 0], [0, 0, 0, 1, 0]])
