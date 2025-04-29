struct Heap {
    private var elements: [Int] = []
    
    mutating func insert(node: Int) {
        self.elements.append(node)
        
        var index = elements.count - 1
        while index > 0 {
            let parent = (index - 1) / 2
            
            if elements[parent] < elements[index] {
                elements.swapAt(index, parent)
                index = parent
            } else {
                break
            }
        }
    }
    
    mutating func remove() -> Int? {
        guard !elements.isEmpty else { return nil }
        if elements.count == 1 {
            return elements.removeFirst()
        }

        let removeValue = elements[0]
        elements[0] = elements.removeLast()
        
        var index = 0
        while index < elements.count {
            
            let left = index * 2 + 1
            let right = index * 2 + 2
            var current = index
            
            if left < elements.count && elements[left] > elements[current] {
                current = left
            }
            if right < elements.count && elements[right] > elements[current] {
                current = right
            }
            if current == index { break }
            
            elements.swapAt(index, current)
            index = current
        }
        
        return removeValue
    }
    
}

let N = Int(readLine()!)!
var heap = Heap()

for _ in 0..<N {
    let input = Int(readLine()!)!
    if input == 0 {
        print(heap.remove() ?? 0)
    } else {
        heap.insert(node: input)
    }
}