import Foundation

// MARK: - Input
guard let N = Int(readLine() ?? "") else { exit(0) }
guard let M = Int(readLine() ?? "") else { exit(0) }
guard let S = readLine() else { exit(0) }

let chars = Array(S)
var result = 0
var count = 0

// 현재 인덱스 위치
var i = 1

while i < M - 1 {
    // IOI가 등장? -> 카운트를 1개 올림
    if chars[i - 1] == "I", chars[i] == "O", chars[i + 1] == "I" {
        count += 1
        // 카운트가 만약 N이 되었다? 우리가 찾는 패턴이 등장한 것.
        if count == N {
            result += 1
            // 근데 바로 다음에 중복적으로 패턴이 나올 수도 있으니, 1을 줄이기.
            count -= 1
        }
        i += 2
    }
    // 다음으로 이동했더니 IOI가 안나옴? -> 0으로 초기화.
    // 그리고 다음 인덱스부터 다시 비교시작.
    else {
        count = 0
        i += 1
    }
}
print(result)