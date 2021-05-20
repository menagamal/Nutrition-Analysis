import Foundation
import UIKit
//SF Pro Display ["SFProDisplay-Regular", "SFProDisplay-Bold", "SFProDisplay-Semibold", "SFProDisplay-Medium"]
extension UIFont{
    //NAVIGATION
    @nonobjc class var NavigationTextFont:UIFont{
      return UIFont(name: AppFontName.bold, size: 16.0)!
    }
    @nonobjc class var NavigationLargetTitleTextFont:UIFont{
        return UIFont(name: AppFontName.bold, size: 35.0)!
    }
//TEXTFIELD
    @nonobjc class var TextFieldPlacehlder: UIFont {
        return UIFont(name: AppFontName.regular, size: 16.0)!
    }
    @nonobjc class var TextFieldText: UIFont {
        return UIFont(name: AppFontName.regular, size: 16.0)!
    }
    @nonobjc class var TextFieldTextCode: UIFont {
        return UIFont(name: AppFontName.bold, size: 16.0)!
    }
    @nonobjc class var TabBarItemFont: UIFont {
        return UIFont(name: AppFontName.regular, size: 10.0)!
    }
    //Button
    @nonobjc class var ButtonTextFont: UIFont {
        return UIFont(name: AppFontName.regular, size: 15.0)!
    }
    @nonobjc class var ButtonTextFontSecondry: UIFont {
        return UIFont(name: AppFontName.regular, size: 16.0)!
    }
    //TableView Section
    @nonobjc class var TableViewSection: UIFont {
        return UIFont(name: AppFontName.bold, size: 16.0)!
    }
  
  // Segmented
  @nonobjc class var SegmentedFont:UIFont{
         return UIFont(name: AppFontName.bold, size: 14.0)!
     }

}
