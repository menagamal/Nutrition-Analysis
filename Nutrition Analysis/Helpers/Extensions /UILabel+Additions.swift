import UIKit
@IBDesignable
public extension UILabel{
  @IBInspectable
  var LocalizationKey: String  {
    get{
      return ""
    }
    set{
      self.text = NSLocalizedString(newValue, comment: LocalizationKey)
    }
    
  }
}
