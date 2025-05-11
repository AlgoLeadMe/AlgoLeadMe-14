import Foundation

typealias UserID = String
typealias Nickname = String

enum Action: String, CustomStringConvertible {
    case enter = "Enter"
    case leave = "Leave"
    case change = "Change"
    
    var description: String {
        return self.rawValue
    }
}

func createMessage(_ action: Action, _ userId: UserID, _ userDict: [UserID: Nickname]) -> String? {
    guard let nickname = userDict[userId] else { return nil }
    
    switch action {
    case .enter:
        return "\(nickname)님이 들어왔습니다."
    case .leave:
        return "\(nickname)님이 나갔습니다."
    default:
        return nil
    }
}

func solution(_ record:[String]) -> [String] {
    var res: [String] = []
    var userDict: [UserID: Nickname] = [:]
    var actions: [(action: Action, id: UserID)] = []
    
    for i in 0..<record.count {
        let div = record[i].split(separator: " ").map { String($0) }
        let action = Action(rawValue: div[0])!
        let userId = div[1]
        
        // 닉네임 업데이트 (Enter와 Change)
        if action == .enter || action == .change {
            userDict[userId] = div[2]
        }
        
        // 메시지 생성이 필요한 액션만 기록 (Enter와 Leave)
        if action == .enter || action == .leave {
            actions.append((action, userId))
        }
    }
    
    for action in actions {
        if let message = createMessage(action.action, action.id, userDict) {
            res.append(message)
        }
    }
    
    return res
}

// let record = ["Enter uid1234 Muzi", "Enter uid4567 Prodo","Leave uid1234","Enter uid1234 Prodo","Change uid4567 Ryan"]

// let res = solution(record)

// print(res)
