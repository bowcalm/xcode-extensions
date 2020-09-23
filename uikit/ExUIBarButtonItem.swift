import UIKit

// MARK: - Selector Closure

private var uibarbuttonitemActionKey: Void?

extension UIBarButtonItem {

    private var _action: () -> () {
        get {
            return objc_getAssociatedObject(self, &uibarbuttonitemActionKey) as! () -> ()
        }
        set {
            objc_setAssociatedObject(self, &uibarbuttonitemActionKey, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
    
    convenience init(title: String?, style: Style, action: @escaping () -> ()) {
        self.init(title: title, style: style, target: nil, action: #selector(pressed(_:)))
        self.target = self
        self._action = action
    }
    
    convenience init(image: UIImage?, style: Style, action: @escaping () -> ()) {
        self.init(image: image, style: style, target: nil, action: #selector(pressed(_:)))
        self.target = self
        self._action = action
    }
    
    @objc private func pressed(_ sender: UIBarButtonItem) {
        _action()
    }

}
