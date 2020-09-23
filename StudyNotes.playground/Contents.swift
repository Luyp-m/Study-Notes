import UIKit

class HomeProgressView: UIView {
    // 线宽
    let lineWidth: CGFloat = 15
    let maxPercent: CGFloat = 0.62
    let spacePercent: CGFloat = 0.42
    
    // 初始偏移角度
    // 正常是以Y轴负半轴为正轴依次进行计算
    let initialOffsetAngle: CGFloat = CGFloat.pi / 4
    
    // 半径
    var radius: CGFloat {
        return (bounds.size.width - lineWidth) / 2
    }
    
    // 进度
    var progress: CGFloat = 0 {
        didSet {
            setNeedsDisplay()
        }
    }
    
    // 元素个数
    var elementCount: Int = 3
    
    struct ProgressItem {
        // 轨迹线颜色
        var trackColor: UIColor
        // 元素图标
        var itemImage: UIImage?
        // 点击事件
        var action: Selector?
        
    }
    
    var progressItems: [ProgressItem] = [HomeProgressView.ProgressItem(trackColor: #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1), itemImage: nil, action: nil),
                                         HomeProgressView.ProgressItem(trackColor: #colorLiteral(red: 0.8549019694, green: 0.250980407, blue: 0.4784313738, alpha: 1), itemImage: nil, action: nil),
                                         HomeProgressView.ProgressItem(trackColor: #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1), itemImage: nil, action: nil),
                                         HomeProgressView.ProgressItem(trackColor: #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1), itemImage: nil, action: nil)] {
        didSet {
            setNeedsDisplay()
        }
    }
    
    
    
    override func draw(_ rect: CGRect) {
        drawCircle()
        for (index, item) in progressItems.enumerated() {
            drawItem(item, at: index)
        }
    }
    
    // 绘制基础圆环
    func drawCircle() {
        let linebgColor = #colorLiteral(red: 0.8345544934, green: 0.9457178712, blue: 0.9964376092, alpha: 1)
        let size = bounds.size
        let center = CGPoint(x: size.width / 2, y: size.height / 2)
        let startAngle = -CGFloat.pi / 2
        let endAngle = CGFloat.pi * 2 + startAngle
        
        /// 绘制背景圆圈
        let bgPath = UIBezierPath()
        bgPath.lineWidth = lineWidth
        bgPath.lineCapStyle = .round
        bgPath.addArc(withCenter: center, radius: radius, startAngle: startAngle, endAngle: endAngle, clockwise: true)
        
        linebgColor.set()
        bgPath.stroke()
    }
    
    // 绘制轨迹和元素
    func drawItem(_ item: ProgressItem, at index: Int) {
        
        let pi = CGFloat.pi
        
        let size = bounds.size
        let center = CGPoint(x: size.width / 2, y: size.height / 2)
        // 平均每个元素所占角度
        let perAngle: CGFloat = pi * 2 / 4
        // 初始角度（Y负半轴） + 初始偏移角度 + 第n个元素所在位置 + 间隔角度
        let startAngle = (-pi / 2) + initialOffsetAngle + perAngle * CGFloat(index)
        // 结束角度
        let endAngle = (startAngle + perAngle - (perAngle / 4)) * progress
        
        print(perAngle,startAngle,endAngle)
        let bgPath = UIBezierPath()
        bgPath.lineWidth = lineWidth
        bgPath.lineCapStyle = .round
        bgPath.addArc(withCenter: center, radius: radius, startAngle: startAngle, endAngle: endAngle, clockwise: true)
        
        item.trackColor.set()
        bgPath.stroke()
        
//        let x = radius * cos(endAngle)
//        let y = radius * sin(endAngle)
//        print(x, y)
//        let button = UIButton(frame: CGRect(origin: CGPoint(x: x, y: y), size: item.itemImage.size))
//        addSubview(button)
    }
    
//    func drawLeftProgress() {
//
//        let linebgColor = #colorLiteral(red: 0.09019607843, green: 0.6862745098, blue: 0.9921568627, alpha: 1)
//        let lineWidth: CGFloat = 15
//
//        let pi = CGFloat.pi
//
//        let size = bounds.size
//        let center = CGPoint(x: size.width / 2, y: size.height / 2)
//        let radius = (size.width - lineWidth) / 2
//        let startAngle = -pi + (spacePercent > 0.0 ? spacePercent : 0.0)
//        let endAngle = -pi + pi * 0.6 * progress
//
//        /// 绘制背景圆圈
//        let bgPath = UIBezierPath()
//        bgPath.lineWidth = lineWidth
//        bgPath.lineCapStyle = .round
//        bgPath.addArc(withCenter: center, radius: radius, startAngle: startAngle, endAngle: endAngle, clockwise: true)
//
//        linebgColor.set()
//        bgPath.stroke()
//    }
//
//    func drawRightProgress() {
//
//        let linebgColor = #colorLiteral(red: 0.01568627451, green: 0.7725490196, blue: 0.8745098039, alpha: 1)
//        let lineWidth: CGFloat = 15
//
//        let pi = CGFloat.pi
//
//        let size = bounds.size
//        let center = CGPoint(x: size.width / 2, y: size.height / 2)
//        let radius = (size.width - lineWidth) / 2
//        let startAngle: CGFloat = pi * CGFloat(1.0/3.0) + (spacePercent > 0.0 ? spacePercent : 0.0)
//        let endAngle = pi * CGFloat(1.0/3.0) + pi * 0.6 * progress
//
//        /// 绘制背景圆圈
//        let bgPath = UIBezierPath()
//        bgPath.lineWidth = lineWidth
//        bgPath.lineCapStyle = .round
//        bgPath.addArc(withCenter: center, radius: radius, startAngle: startAngle, endAngle: endAngle, clockwise: true)
//
//        linebgColor.set()
//        bgPath.stroke()
//    }
//
//    func drawTopProgress() {
//
//        let linebgColor = #colorLiteral(red: 0.3960784314, green: 0.7725490196, blue: 0.08235294118, alpha: 1)
//        let lineWidth: CGFloat = 15
//
//        let pi = CGFloat.pi
//
//        let size = bounds.size
//        let center = CGPoint(x: size.width / 2, y: size.height / 2)
//        let radius = (size.width - lineWidth) / 2
//        let startAngle: CGFloat = -pi * CGFloat(1.0/3.0) + (spacePercent > 0.0 ? spacePercent : 0.0)
//        let endAngle = -pi * CGFloat(1.0/3.0) + pi * 0.6 * progress
//
//        /// 绘制背景圆圈
//        let bgPath = UIBezierPath()
//        bgPath.lineWidth = lineWidth
//        bgPath.lineCapStyle = .round
//        bgPath.addArc(withCenter: center, radius: radius, startAngle: startAngle, endAngle: endAngle, clockwise: true)
//
//        linebgColor.set()
//        bgPath.stroke()
//    }

}


let progressView: HomeProgressView = HomeProgressView.init(frame: CGRect(x: 0, y: 0, width: 300, height: 300))



// MARK: - Animations
//func prepareForAnimation() {
//    update(toProgress: 0)
//}

func runProgressAnimation() {
    update(progress: 0, start: Date())
}

func update(progress: CGFloat, start: Date) {
    
//    if progress >= 1 {
//        update(toProgress: 1)
////        labelsView.alpha = 0
////        labelsView.isHidden = false
////        UIView.animate(withDuration: 0.25, animations: {
////            self.labelsView.alpha = 1
////        })
//
//        return
//    }
    
//    update(toProgress: progress)
    
    DispatchQueue.main.asyncAfter(wallDeadline: DispatchWallTime.now()) {
        let now = Date()
        let interval = now.timeIntervalSince(start)
        update(progress: CGFloat(interval) * 0.9, start: start)
    }
    
//    DispatchQueue.main.asyncAfter(delay: 0.005) {
//        let now = Date()
//        let interval = now.timeIntervalSince(start)
//        self.update(progress: CGFloat(interval) * 0.9, start: start)
//    }
}

runProgressAnimation()

//func update(toProgress progress: CGFloat) {
//
//    progressView.progress = progress
//
//    let r = progressView.radius
//    let a = CGFloat.pi * progressView.maxPercent * progress
//    let sin_a = sin(a)
//    let cos_a = cos(a)
//    let sin_a_r = sin_a * r
//    let cos_a_r = cos_a * r
//    let angle_120 = CGFloat(2.0 / 3.0) * CGFloat.pi
//    let sin_b = sin(a - angle_120)
//    let sin_c = sin(a + angle_120)
//    let cos_b = cos(a - angle_120)
//    let cos_C = cos(a + angle_120)
//    let sin_b_r = sin_b * r
//    let sin_c_r = sin_c * r
//    let cos_b_r = cos_b * r
//    let cos_c_r = cos_C * r
//
////    aqiButtonCenter.constant = -sin_a_r
////    aqiButtonLeft.constant = r - cos_a_r - aqiButton.frame.size.width / 2
////    waterButtonCenter.constant = -sin_b_r //sin_a_r
////    waterButtonRight.constant = r + cos_b_r - waterButton.frame.size.width / 2 //r - cos_a_r - waterButton.frame.size.width / 2
////    riverButtonCenter.constant = -sin_c_r//sin_a_r
////    riverButtonRight.constant = r + cos_c_r - riverButton.frame.size.width / 2//r - cos_a_r - riverButton.frame.size.width / 2
////    view.layoutIfNeeded()
//}


