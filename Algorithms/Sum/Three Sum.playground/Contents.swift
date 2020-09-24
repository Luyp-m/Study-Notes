/*
 Three Sum
 three sum是two sum的扩展算法。
 
 算法要求：在一组给定的整型数组中，找到所有满足条件的子集，使得该数组中任意三个元素的和为固定一个目标值，并且该数组中任意元素仅能被使用一次，如果存在两个相同值的元素，则视其为两个不同的元素。
 
 例如：指定数组为[-1,0,1,2,-1,-4]，和的目标值为0，那么结果可以找到两组数据：[[-1,0,1],[-1,-1,2]]，在第二组数据中，包含两个-1，因为原数组中存在两个-1，所以此处的-1被视为两个不同元素的引用值。
*/


/*
 避免集合中的重复值
 在一个排序好的数组中，重复值将必定是在一个值左右，只需要判断其左右是否相等，就可以判断重复值的情况并跳过
 */
extension Collection where Element: Equatable {
    
    /// 在一个有序数组中，将给定索引替换成映射到唯一元素的后继对象
    /// - Parameter index: 集合中一个有效索引，且该索引必须小于末位索引
    func formUniqueIndex(after index: inout Index) {
        var prev = index
        repeat {
            prev = index
            formIndex(after: &index)
        } while index < endIndex && self[prev] == self[index]
    }
}

extension BidirectionalCollection where Element: Equatable {
    
    /// 在一个有序数组中，将给定索引替换成映射到唯一元素的前任索引
    /// - Parameter index: 集合中一个有效索引，且该索引必须大于起始索引
    func formUniqueIndex(before index: inout Index) {
        var prev = index
        repeat {
            prev = index
            formIndex(before: &index)
        } while index > startIndex && self[prev] == self[index]
        
    }
}

/*
 Three Sum实现
 算法思路：遍历数组，对于每次迭代的元素l，都将运用Two Sum算法执行计算l之后的元素，每次移动索引时，都将检查总和，以判断是否找到匹配项。
 */
func threeSum<T: BidirectionalCollection>(_ collection: T, target: T.Element) -> [[T.Element]] where T.Element: Numeric & Comparable {
    
    /// 排序数组
    let sorted = collection.sorted()
    
    /// 结果索引的集合
    var ret: [[T.Element]] = []
    
    /// 遍历到的元素索引
    var l = sorted.startIndex
    
    ThreeSum: while l < sorted.endIndex {
        // 延迟执行，当一次循环结束后，执行后继索引
        defer { sorted.formUniqueIndex(after: &l) }
        
        // 数组中剩余元素中的起始索引值
        var m = sorted.index(after: l)
        
        // 数组中剩余元素中的末位索引值
        var r = sorted.index(before: sorted.endIndex)

        TwoSum: while m < r && r < sorted.endIndex {
            let sum = sorted[l] + sorted[m] + sorted[r]
            if sum == target {
                ret.append([sorted[l], sorted[m], sorted[r]])
                sorted.formUniqueIndex(after: &m)
                sorted.formUniqueIndex(before: &r)
            } else if sum < target {
                sorted.formUniqueIndex(after: &m)
            } else {
                sorted.formUniqueIndex(before: &r)
            }
        }
    }
    return ret
}

let sums = [-1, 0, 1, 2, -1, -4]
let target = 0
let a = threeSum(sums, target: target)
print(a)
