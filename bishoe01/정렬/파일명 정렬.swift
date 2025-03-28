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

//    print(정렬할배열) // 이 지점에서 IMG01.gif가 img1.png보다 앞으로 나와서 계속 수정
    // [(HEAD: "IMG", NUMBER: "01", TAIL: ".GIF"), (HEAD: "img", NUMBER: "1", TAIL: ".png"), (HEAD: "img", NUMBER: "02", TAIL: ".png"), (HEAD: "img", NUMBER: "2", TAIL: ".JPG"), (HEAD: "img", NUMBER: "10", TAIL: ".png"), (HEAD: "img", NUMBER: "12", TAIL: ".png")]
    // 이거 대문자 소문자 내가 안해줬나 ? -> HEAD.lowercased()  -> 해결
    // 튜플 joined 어떻게 ? ->  스무스하게 해주는 메소드는 없는듯 걍 미리 받아야할듯

    return 정렬완료배열
}
