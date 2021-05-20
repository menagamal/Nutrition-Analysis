import UIKit
@IBDesignable
public extension UITextField{
  @IBInspectable
  var LocalizationKey: String  {
    get{
      return ""
    }
    set{
      self.placeholder = NSLocalizedString(newValue, comment: LocalizationKey)
    }
  }
}
