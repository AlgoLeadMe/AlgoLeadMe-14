import Foundation

func solution(_ files: [String]) -> [String] {
    var 정렬할배열: [(HEAD: String, NUMBER: String, TAIL: String, 원본: String)] = []

    for file in files {
        let eachFile = Array(file)
        var HEAD = ""
        var NUMBER = ""
        var TAIL = ""

        var firstSection = true // HEAD랑 TAIL이 둘다 문자라 숫자를 경계로 구분해주기 위한 변수
        for char in eachFile {
            if !char.isNumber, firstSection { // 넘버나올때까지
                HEAD += String(char)
            }
            else if char.isNumber {
                firstSection = false // 커서값 땡겨와서 이제 HEAD에는 (idx > cursor)에 걸려서 안들어가게 , 다음 LETTER는 TAIL로 이동 !
                NUMBER += String(char)
            }
            else { // isLetter로했다가 .이 포함안돼서 else로 수정
                TAIL += String(char)
            }
        }
        정렬할배열.append((HEAD: HEAD.lowercased(), NUMBER: NUMBER, TAIL: TAIL, 원본: file))
    }

    // 이제 정렬을 해주자 !
    var 정렬완료배열 = 정렬할배열.sorted {
        if $0.HEAD != $1.HEAD {
            return $0.HEAD < $1.HEAD
        }
        else {
            return Int($0.NUMBER)! < Int($1.NUMBER)!
        }
    }.map { $0.원본 }

    return 정렬완료배열
}
