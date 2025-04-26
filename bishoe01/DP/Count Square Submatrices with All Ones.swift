class Solution {
    func countSquares(_ matrix: [[Int]]) -> Int {
        var answer = 0
        let maxLen = min(matrix.count, matrix[0].count) // 정사각형 한변 최대길이
        let WIDTH = matrix[0].count
        let HEIGHT = matrix.count

        for col in 0 ..< HEIGHT { // 열
            var point: (x: Int, y: Int)
            // 큰 박스가 작은 박스를 포함하는 관계
            // 우측,&아래로갈수록 가능한 변의 길이가 짧아짐
            for row in 0 ..< WIDTH { // 행
                point = (x: row, y: col)
                Pass: for length in stride(from: maxLen, through: 0, by: -1) { // 변 길이로 해주기
                    if point.y + length > HEIGHT || point.x + length > WIDTH {
//                        print("point : \(point), length : \(length) , Width : \(WIDTH), Height : \(HEIGHT)")
                        continue
                    } // 이게 탐색이 초과해버리면 안되니까 (ex 가로길이가 4인데, 0~3는 되지만 3~6은안되니까 )

                    // 정사각형 돌고 이거 다 1인지 판단하는 함수
                    var isSquare = true
                    SquareFunc: for i in point.y ..< point.y + length {
                        for j in point.x ..< point.x + length {
                            if matrix[i][j] == 0 {
                                isSquare = false
                                break SquareFunc
                            }
                        }
                    }
                    if isSquare {
//                        print("point : \(point), length : \(length)")
                        answer += length
                        break Pass
                    }
                }
            }
        }

        return answer
    }
}

func 등차수열합(_ n: Int) -> Int {
    return (n * (2 + (n - 1))) / 2
}
