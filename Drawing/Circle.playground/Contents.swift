import UIKit


func getRGBRandom() -> UIColor {
    let randomR = arc4random_uniform(255 - 0) + 0
    let randomG = arc4random_uniform(255 - 0) + 0
    let randomB = arc4random_uniform(255 - 0) + 0
    let randomA = drand48()
    let color = UIColor(displayP3Red: CGFloat(randomR)/255, green: CGFloat(randomG)/255, blue: CGFloat(randomB)/255, alpha: CGFloat(randomA))
    print(color)
    return color
}

class CicleView: UIView {
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
//        drawCIrcle()
//        drawSquare()
        drawSemicircle()
//        drawTriangle()
    }
    // 画圆
    private func drawCIrcle() {
        let center = CGPoint(x: self.frame.size.width / 2, y: self.frame.size.height / 2)
        let radius = min(center.x, center.y)
        let path = UIBezierPath()
        path.addArc(withCenter: center, radius: radius, startAngle: (-0.5 * CGFloat.pi), endAngle: (1.5 * CGFloat.pi), clockwise: true)
        path.close()
        getRGBRandom().setFill()
        getRGBRandom().setStroke()
        path.fill()
        path.stroke()
    }
    // 画半圆
    private func drawSemicircle() {
        let center = CGPoint(x: self.frame.size.width / 2, y: self.frame.size.height / 2)
        let radius = min(center.x, center.y)
        let path = UIBezierPath()
        path.addArc(withCenter: center, radius: radius, startAngle: (-0.5 * CGFloat.pi), endAngle: (0.5 * CGFloat.pi), clockwise: true)
        path.close()
        getRGBRandom().setFill()
        getRGBRandom().setStroke()
        path.fill()
        path.stroke()
    }
    // 画直角矩形
    private func drawSquare() {
        let path = UIBezierPath()
        path.move(to: CGPoint(x: 0, y: 0))
        path.addLine(to: CGPoint(x: self.frame.size.width/2, y: 0))
        path.addLine(to: CGPoint(x: self.frame.size.width/2, y: self.frame.size.height/2))
        path.addLine(to: CGPoint(x: 0, y: self.frame.size.height/2))
        path.close()
        getRGBRandom().setFill()
        getRGBRandom().setStroke()
        path.fill()
        path.stroke()
    }
    // 画直角三角形
    private func drawTriangle() {
        let path = UIBezierPath()
        path.move(to: CGPoint(x: 0, y: 0))
//        path.addLine(to: CGPoint(x: self.frame.size.width/2, y: 0))
        path.addLine(to: CGPoint(x: self.frame.size.width/2, y: self.frame.size.height/2))
        path.addLine(to: CGPoint(x: 0, y: self.frame.size.height/2))
        path.close()
        getRGBRandom().setFill()
        getRGBRandom().setStroke()
        path.fill()
        path.stroke()
    }
}

let a = CicleView(frame: CGRect(x: 0, y: 0, width: 150, height: 100))
a.backgroundColor = .white
a.backgroundColor = .systemPink
