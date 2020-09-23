import UIKit

// MARK: - Shorthands

extension CGSize {
    
    static func only(width: CGFloat = 0, height: CGFloat = 0) -> CGSize {
        return .init(width: width, height: height)
    }

    static func equal(_ value: CGFloat) -> CGSize {
        return .init(width: value, height: value)
    }
    
}
