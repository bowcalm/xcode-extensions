import UIKit

// MARK: - RGBA

extension UIColor {
    
    var rgba: RGBA {
        var red: CGFloat = 0
        var green: CGFloat = 0
        var blue: CGFloat = 0
        var alpha: CGFloat = 0
        self.getRed(&red, green: &green, blue: &blue, alpha: &alpha)
        
        return RGBA(
            red: red,
            green: green,
            blue: blue,
            alpha: alpha
        )
    }
    
    struct RGBA {
        var red: CGFloat
        var green: CGFloat
        var blue: CGFloat
        var alpha: CGFloat
    }
    
}

extension UIColor.RGBA: Equatable {
    
    static func ==(lhs: UIColor.RGBA, rhs: UIColor.RGBA) -> Bool {
        return
            lhs.red == rhs.red &&
            lhs.green == rhs.green &&
            lhs.blue == rhs.blue &&
            lhs.alpha == rhs.alpha
    }
    
}

// MARK: - Equatable

extension UIColor {
    
    static func ==(lhs: UIColor, rhs: UIColor) -> Bool {
        return lhs.rgba == rhs.rgba
    }
    
    func isEqual(to color: UIColor) -> Bool {
        return self == color
    }
    
}

// MARK: - Color Code

extension UIColor {
    
    static func hex(_ code: String, alpha: CGFloat = 1.0) -> UIColor {
        let value = Int(code, radix: 16) ?? 0
        let red = CGFloat(value / Int(powf(256, 2)) % 256) / 255
        let green = CGFloat(value / Int(powf(256, 1)) % 256) / 255
        let blue = CGFloat(value / Int(powf(256, 0)) % 256) / 255
        return .init(red: red, green: green, blue: blue, alpha: alpha.clamp(lower: 0, upper: 1))
    }
    
}

// MARK: - Fixing (Depends on RGBA)

extension UIColor {
    
    func fixing(red: CGFloat? = nil, green: CGFloat? = nil, blue: CGFloat? = nil, alpha: CGFloat? = nil) -> UIColor {
        return .init(
            red: red ?? self.rgba.red,
            green: green ?? self.rgba.green,
            blue: blue ?? self.rgba.blue,
            alpha: alpha ?? self.rgba.alpha
        )
    }
    
}

// MARK: - Lighten & Darken

extension UIColor {
    
    func lighten(ratio: CGFloat) -> UIColor {
        let ratio = ratio.clamp(lower: 0, upper: 1)
        
        return .init(
            red: self.rgba.red + (1 - self.rgba.red) * ratio,
            green: self.rgba.green + (1 - self.rgba.green) * ratio,
            blue: self.rgba.blue + (1 - self.rgba.blue) * ratio,
            alpha: self.rgba.alpha
        )
    }
    
    static func lighten(_ base: UIColor, ratio: CGFloat) -> UIColor {
        return base.lighten(ratio: ratio)
    }
    
    func darken(ratio: CGFloat) -> UIColor {
        let ratio = ratio.clamp(lower: 0, upper: 1)
        
        return .init(
            red: self.rgba.red * (1 - ratio),
            green: self.rgba.green * (1 - ratio),
            blue: self.rgba.blue * (1 - ratio),
            alpha: self.rgba.alpha
        )
    }
    
    static func darken(_ base: UIColor, ratio: CGFloat) -> UIColor {
        return base.darken(ratio: ratio)
    }
    
}

// MARK: - Dynamic Color

extension UIColor {
    
    static func dynamic(light: UIColor, dark: UIColor) -> UIColor {
        if #available(iOS 13, *) {
            return UIColor { (traitCollection) -> UIColor in
                if traitCollection.userInterfaceStyle == .dark {
                    return dark
                } else {
                    return light
                }
            }
        }
        return light
    }
    
}
