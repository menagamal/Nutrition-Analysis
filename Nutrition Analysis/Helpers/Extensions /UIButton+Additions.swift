import UIKit
@IBDesignable
public extension UIButton{
  @IBInspectable
  var LocalizationKey: String  {
    get{
      return ""
    }
    set{
      self.setTitle( NSLocalizedString(newValue, comment: LocalizationKey), for: .normal)}
    
  }
}

extension UIBarButtonItem {
    private struct AssociatedObject {
        static var key = "action_closure_key"
    }
    
    var actionClosure: (()->Void)? {
        get {
            return objc_getAssociatedObject(self, &AssociatedObject.key) as? ()->Void
        }
        set {
            objc_setAssociatedObject(self, &AssociatedObject.key, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
            target = self
            action = #selector(didTapButton(sender:))
        }
    }
    
    @objc func didTapButton(sender: Any) {
        actionClosure?()
    }
}
