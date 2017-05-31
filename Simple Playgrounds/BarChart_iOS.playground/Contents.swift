//: Playground - noun: a place where people can play

import PlaygroundSupport
import UIKit

struct Color {
    let red: Float
    let green: Float
    let blue: Float
    let alpha: Float = 1.0
    
    var displayColor: UIColor {
        return UIColor(colorLiteralRed: red, green: green, blue: blue, alpha: alpha)
    }
}

struct Bar {
    var value: Float
    var color: Color
}

class BarChart: UIView {
    
    var bars: [Bar] = [] {
        didSet {
            self.barViews.forEach { $0.removeFromSuperview() }
            
            var barViews = [UIView]()
            
            let barCount: Int = bars.count
            
            // Calculate the max value before calculating size
            for bar in bars {
                maxValue = max(maxValue, bar.value)
            }
            
            var xOrigin: CGFloat = interBarMargin
            
            for bar in bars {
                let width = (frame.size.width - (interBarMargin * CGFloat(barCount+1))) / CGFloat(barCount)
                let height = barHeight(forValue: bar.value)
                let rect = CGRect(x: xOrigin, y: bounds.height - height, width: width, height: height)
                let view = UIView(frame: rect)
                view.backgroundColor = bar.color.displayColor
                barViews.append(view)
                addSubview(view)
                
                xOrigin = view.frame.maxX + interBarMargin
            }
            self.barViews = barViews
        }
    }
    var interBarMargin: CGFloat = 5.0
    
    private var barViews: [UIView] = []
    private var maxValue: Float = 0.0
    
    private func barHeight(forValue value: Float) -> CGFloat {
        return (frame.size.height / CGFloat(maxValue)) * CGFloat(value)
    }
}

let barView = BarChart(frame: CGRect(x: 0, y: 0, width: 300, height: 300))
barView.backgroundColor = .white
PlaygroundPage.current.liveView = barView

let bar1 = Bar(value: 20, color: Color(red: 1, green: 0, blue: 0))
let bar2 = Bar(value: 40, color: Color(red: 0, green: 1, blue: 0))
let bar3 = Bar(value: 25, color: Color(red: 0, green: 0, blue: 1))

barView.bars = [bar1, bar2, bar3]
