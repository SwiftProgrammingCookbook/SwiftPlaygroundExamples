
import PlaygroundSupport
import UIKit

let barView = BarChart(frame: CGRect(x: 0, y: 0, width: 300, height: 300))
barView.backgroundColor = .white

let jan2017 = Bar(value: 970.17, color: Color(red: 0, green: 1, blue: 0, alpha: 0.2))
let feb2017 = Bar(value: 960.05, color: Color(red: 0, green: 1, blue: 0, alpha: 0.4))
let mar2017 = Bar(value: 1203.02, color: Color(red: 0, green: 1, blue: 0, alpha: 0.6))
let apr2017 = Bar(value: 1076.90, color: Color(red: 0, green: 1, blue: 0, alpha: 0.8))
let may2017 = Bar(value: 1390.24, color: Color(red: 0, green: 1, blue: 0, alpha: 1.0))

barView.bars = [jan2017, feb2017, mar2017, apr2017, may2017]

PlaygroundPage.current.liveView = barView

//: [Next: Etherium](@next)
