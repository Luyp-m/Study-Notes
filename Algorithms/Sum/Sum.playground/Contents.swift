/*
#3Sum
*/
extension Collection where Element: Equatable {
    
    func formUniqueIndex(after index: inout Index) {
        var prev = index
        repeat {
            prev = index
            formIndex(after: &index)
        } while index < endIndex && self[prev] == self[index]
    }
}

extension BidirectionalCollection where Element: Equatable {
    
}
