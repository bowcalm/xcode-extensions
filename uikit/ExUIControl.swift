import UIKit

// MARK: - Selector Closure

private var uicontrolActionKey: Void?

extension UIControl {
    
    private var _action: () -> () {
        get {
            return objc_getAssociatedObject(self, &uicontrolActionKey) as! () -> ()
        }
        set {
            objc_setAssociatedObject(self, &uicontrolActionKey, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
    
    func addTarget(for controlEvents: UIControl.Event, action: @escaping () -> ()) {
        self.addTarget(self, action: #selector(pressed(_:)), for: controlEvents)
        self._action = action
    }
    
    @objc private func pressed(_ sender: UIButton) {
        _action()
    }
    
}
