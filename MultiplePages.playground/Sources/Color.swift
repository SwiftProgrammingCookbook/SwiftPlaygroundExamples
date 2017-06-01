import UIKit

public struct Color {
    let red: Float
    let green: Float
    let blue: Float
    let alpha: Float
    
    public init(red: Float, green: Float, blue: Float, alpha: Float = 1.0) {
        self.red = red
        self.green = green
        self.blue = blue
        self.alpha = alpha
    }
    
    var displayColor: UIColor {
        return UIColor(colorLiteralRed: red, green: green, blue: blue, alpha: alpha)
    }
}

