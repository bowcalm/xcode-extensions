import UIKit

// MARK: - Shorthands

extension CGRect {
    
    static func only(x: CGFloat = 0, y: CGFloat = 0, width: CGFloat = 0, height: CGFloat = 0) -> CGRect {
        return .init(x: x, y: y, width: width, height: height)
    }
    
}
