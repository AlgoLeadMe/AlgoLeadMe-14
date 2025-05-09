// 문제 : 1839. Longest Substring Of All Vowels in Order
import Foundation

class Solution {
    let vowels: [Character] = ["a", "e", "i", "o", "u"]
    func longestBeautifulSubstring(_ word: String) -> Int {
        // 길이 5보다 아래 아웃
        guard word.count >= 5 else {
            return 0
        }
        var previous: Character = "z"
        var count = 0
        var answer = 0
        // 추월안되면 무조건 시작은 a가 되어야함
        for item in word {
            // 'z'는 사실상 nil을 뜻하기 위한 코드 ('z'가 previous라면 이거 새로 previous를 찾아야한다는 뜻)
            if previous == "z" {
                if item == "a" {
                    previous = item
                }
            //  시작점이 되어야하는데, a가 아니면 걍 날려버리기
                else {
                    continue
                }
            }
            if canGo(previous, item) {
                count += 1
                previous = item
            //  print(item)
            }
            else {
            //    끝이 u가 아니라면 이게 다 완성이 안된상태라 0 처리가 되어야함
                if previous == "u" {
                //  print("HERE \(item) \(count)")
                    answer = max(answer, count)
                }
                // a가 나와서 끊겼으면 그냥 그때부터 카운팅
                if item == "a" {
                    previous = item
                    count = 1
                }
                // 그게 아니라면 "z"를 줘서 초기화되게끔 함
                else {
                    previous = "z"
                    count = 0
                }
            }
        }
        // 끝에 걸리지않고 끝나버리면 카운팅이 안됨
        if previous == "u" {
            return max(answer, count)
        }
        else {
            return answer
        }
    }

    func canGo(_ previous: Character, _ current: Character) -> Bool {
        let previousIdx = vowels.firstIndex(of: previous)!
        let currentIdx = vowels.firstIndex(of: current)!
        // 같거나 하나 차이 날때만
        if currentIdx - previousIdx <= 1 && currentIdx - previousIdx > -1 {
        //    print(previous, current)
            return true
        }
        return false
    }
}
