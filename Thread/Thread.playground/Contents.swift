import UIKit


func globalTask() {
    DispatchQueue.global().async {
        guard groupTask() != nil else {
            print("group失败", Thread.current)
            return
        }
        DispatchQueue.main.sync {
            print("主线程异步处理事件", Thread.current)
        }
        asyncTask {
            print("处理", Thread.current)
        }
    }
}

func groupTask() -> String? {
    let group = DispatchGroup()
    print("开始群组线程", Thread.current)
    for _ in 0...4 {
        group.enter()
        print("准备执行异步操作", Thread.current)
        asyncTask {
            print("异步操作执行结束", Thread.current)
            group.leave()
        }
    }
    group.wait()
    print("群组线程结束", Thread.current)
    return "结束"
}

func asyncTask( result: @escaping () -> ()) {
    DispatchQueue.main.async {
        print("异步请求回调", Thread.current)
        result()
    }
}

func getRGBRandom() -> UIColor {
    let randomR = arc4random_uniform(255 - 0) + 0
    let randomG = arc4random_uniform(255 - 0) + 0
    let randomB = arc4random_uniform(255 - 0) + 0
    let randomA = drand48()
    let color = UIColor(displayP3Red: CGFloat(randomR)/255, green: CGFloat(randomG)/255, blue: CGFloat(randomB)/255, alpha: CGFloat(randomA))
    print(color)
    return color
}

globalTask()
