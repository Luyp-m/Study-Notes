/*
 2Sum
 在指定数组中查找出两个数，使之和为某个值，并返回这两个数所对应的索引值。
 
 2Sum中并没有说明数组中是否存在多个符合条件的对值，
 */

/*
 实现方法一
 时间复杂度：O(n)
 优点：1、时间复杂度最低。
 缺点：1、需要开辟一块新的存储空间来存放字典数据，空间复杂度增加。
 */
func twoSumOn(sums: [Int], target: Int) -> (Int, Int)? {
    // 1、创建空字典用于存储
    var dict = [Int: Int]()
    for (index, n) in sums.enumerated() {
        let complement = target - n
        if let complementIndex = dict[complement] {
            return (complementIndex, index)
        }
        dict[n] = index
    }
    return nil
}

let sums = [0,1,2,3,4,5,6,7,8,9]
let target = 10

let a = twoSumOn(sums: sums, target: target)
print(a)

/*
 实现方法二
 时间复杂度：O(n log n)
 优点：1、无需开辟新的存储空间，空间复杂度最低。
 缺点：1、时间复杂度对比O(n)略高。
      2、需要先对数组进行排序，否则无法正常使用
 */
func twoSumProblem(_ a: [Int], k: Int) -> ((Int, Int))? {
    var i = 0
    var j = a.count - 1
    while i < j {
        let sum = a[i] + a[j]
        if sum == k {
            return (i, j)
        } else if sum < k {
            i += 1
        } else {
            j -= 1
        }
    }
    return nil
}

let b = twoSumProblem(sums, k: target)
print(b)

