/*
 Four Sum
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
    func formUniqueIndex(before index: inout Index) {
        var prev = index
        repeat {
            prev = index
            formIndex(before: &index)
        } while index > startIndex && self[prev] == self[index]
    }
}

func fourSum<T: BidirectionalCollection>(_ collection: T, target: T.Element) -> [[T.Element]] where T.Element: Numeric & Comparable {
    let sorted = collection.sorted()
    var ret: [[T.Element]] = []
    
    var l = sorted.startIndex
    
    FourSum: while l < sorted.endIndex { defer { sorted.formUniqueIndex(after: &l) }
        var ml = sorted.index(after: l)
        
        ThreeSum: while ml < sorted.endIndex { defer { sorted.formUniqueIndex(after: &ml) }
            var mr = sorted.index(after: ml)
            var r = sorted.index(before: sorted.endIndex)
            
            TwoSum: while mr < r && r < sorted.endIndex {
                let sum = sorted[l] + sorted[ml] + sorted[mr] + sorted[r]
                if sum == target {
                    ret.append([sorted[l], sorted[ml], sorted[mr], sorted[r]])
                    sorted.formUniqueIndex(after: &mr)
                    sorted.formUniqueIndex(before: &r)
                } else if sum < target {
                    sorted.formUniqueIndex(after: &mr)
                } else {
                    sorted.formUniqueIndex(before: &r)
                }
            }
        }
    }
    return ret
}

let sum = [1,0,-1,0,-2,2]
let target = 0
let a = fourSum(sum, target: target)
print(a)
