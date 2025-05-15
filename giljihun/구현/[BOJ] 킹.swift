/* MARK: - SOLUTION
 
 1. 8x8 체스판 만들기
 2. 컨트롤러 정의
 3. 이동 로직
 4. 돌을 밀치는 로직

 핵심 구현은.. 알파벳 -> 좌표 변환
 
 아스키 코드 쓰면될듯
 근데 어케 변환하지
 
 */
import Foundation

// MARK: - Input & 이동 로직
guard let N = readLine(),
      N.components(separatedBy: " ").count >= 3 else { exit(0) }
let firstPositionOfKing = N.components(separatedBy: " ")[0]
let firstPositionOfStone = N.components(separatedBy: " ")[1]

// let movingCnt = Int(N.components(separatedBy: " ")[2])
guard let movingCnt = Int(N.components(separatedBy: " ")[2]) else { exit(0) }

var chessBoard = Array(repeating: Array(repeating: ".", count: 8), count: 8)

let direction: [String: (dx: Int, dy: Int)] = [
    "R": (1, 0), "L": (-1, 0),
    "B": (0, 1), "T": (0, -1),
    "RT": (1, -1), "LT": (-1, -1),
    "RB": (1, 1), "LB": (-1, 1)
]

// 초기 위치로 초기화! (x, y) 형태로 만들자
var posOfKing = toRealCoordinate(firstPositionOfKing)
var posOfStone = toRealCoordinate(firstPositionOfStone)

// 이동 로직
for _ in 0..<movingCnt {
    guard let command = readLine(),
          // 근데 잘못된 커맨드가 들어오면? 문제 조건엔 없네.
          let moving = direction[command] else { exit(0) }

    let nextPosOfKing = (posOfKing.0 + moving.dx, posOfKing.1 + moving.dy)

    // 다음 킹의 위치가 체스판 영역에 있는지
    if (0..<8).contains(nextPosOfKing.0), (0..<8).contains(nextPosOfKing.1) {
        
        // 돌이랑 위치가 같아진다면
        if nextPosOfKing == posOfStone {
            let nextPosOfStone = (posOfStone.0 + moving.dx, posOfStone.1 + moving.dy)
            
            // 다음 돌의 위치가 체스판 영역에 있는지
            if (0..<8).contains(nextPosOfStone.0), (0..<8).contains(nextPosOfStone.1) {
                posOfKing = nextPosOfKing
                posOfStone = nextPosOfStone
            }
        } else {
            posOfKing = nextPosOfKing
        }
    }
}

print(toChessCoordinate(from: posOfKing))
print(toChessCoordinate(from: posOfStone))

// MARK: - Functions
// asciiValue: 문자 → 숫자 (ex. ‘A’ → 65)
// UnicodeScalar: 숫자 → 문자 (ex. 65 → ‘A’)

func toRealCoordinate(_ pos: String) -> (Int, Int) {
    let x = Int(pos.first!.asciiValue! - 65)
    let y = 8 - Int(String(pos.last!))!
    return (x, y)
}

func toChessCoordinate(from position: (Int, Int)) -> String {
    let x = String(UnicodeScalar(position.0 + 65)!)
    let y = String(8 - position.1)
    return x + y
}
