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
        // 추월안되면 무조건 시작 a
        for item in word {
            if previous == "z" {
                if item == "a" {
                    previous = item
                }
                else {
                    continue
                }
            }
            if canGo(previous, item) {
                count += 1
                previous = item
//                print(item)
            }
            else {
                // 끝이 u가 아니라면 이게 다 완성이 안된상태라 0 처리가 되어야함
                if previous == "u" {
//                    print("HERE \(item) \(count)")
                    answer = max(answer, count)
                }
//                else {
//                    print("ERRRR")
//                }
                if item == "a" {
                    previous = item
                    count = 1
                }
                else {
                    previous = "z"
                    count = 0
                }
            }
        }
        // 끝나버린게 카운팅이 안됐음
        if previous == "u" {
            return max(answer, count)
        }
        else {
            return answer
        }

//        return answer
    }

    func canGo(_ previous: Character, _ current: Character) -> Bool {
        let previousIdx = vowels.firstIndex(of: previous)!
        let currentIdx = vowels.firstIndex(of: current)!
        // 같거나 하나 차이 날때만
        if currentIdx - previousIdx <= 1 && currentIdx - previousIdx > -1 {
//            print(previous, current)
            return true
        }
        return false
    }
}
