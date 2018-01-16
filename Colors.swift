//
//  Colors.swift
//
//  Created by Apple on 10/29/17.
//  Copyright © 2017 Apple. All rights reserved.
//

import UIKit

class Colors: UIColor {

    class func imageWithColor(color: UIColor) -> UIImage {
        let rect = CGRect(x: 0.0, y: 0.0, width: 1.0, height: 0.5)
        UIGraphicsBeginImageContextWithOptions(rect.size, false, 0.0)
        color.setFill()
        UIRectFill(rect)
        let image : UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        return image
    }
    
    class var title: UIColor {
        return UIColor.init(red: 0.01, green: 0.11, blue: 0.32, alpha: 1.0)
    }
    
    class var subTitle: UIColor {
        return UIColor.init(red: 0.23, green: 0.23, blue: 0.23, alpha: 1.0)
    }
    
    class var lightSubTitle: UIColor {
        return UIColor.lightGray
    }
    
    class var darkSubTitle: UIColor {
        return UIColor.gray
    }
    
    class var textFieldHighlightBorder: UIColor {
        return Colors.title
    }
    
    class var textFieldHighlightGreenBorder: UIColor {
        return UIColor.init(red: 0.24, green: 0.69, blue: 0.31, alpha: 1.0)
    }
    
    class var textFieldNormalBorder: UIColor {
        return UIColor.init(red: 0.73, green: 0.74, blue: 0.75, alpha: 1.0)
    }
    
    class var textFieldSucessBorder: UIColor {
        return UIColor.init(red: 0.24, green: 0.69, blue: 0.31, alpha: 1.0)
    }
    
    class var textFieldErrorBorder: UIColor {
        return UIColor.red
    }
    
    class var skyBlue: UIColor {
        return Colors.patternBlue
    }
    
    class var buttonColor: UIColor {
        return Colors.title
    }
    
    class var patternBlue: UIColor {
        return UIColor.init(red: 0.29, green: 0.70, blue: 0.79, alpha: 1.0)
    }
    
    class var patternGray: UIColor {
        return UIColor.init(red: 0.70, green: 0.71, blue: 0.69, alpha: 1.0)
    }
    
    class var patternRed: UIColor {
        return UIColor.init(red: 0.95, green: 0.37, blue: 0.18, alpha: 1.0)
    }
    
    class var cardBlue: UIColor {
        return UIColor.init(red: 0.08, green: 0.18, blue: 0.37, alpha: 1.0)
    }
    
    class var cardInfinite: UIColor {
        return UIColor.init(red: 0.25, green: 0.25, blue: 0.26, alpha: 1.0)
    }
    
    class var cardGold: UIColor {
        return UIColor.init(red: 0.48, green: 0.41, blue: 0.15, alpha: 1.0)
    }
    
    class var cardClassic: UIColor {
        return cardBlue
    }
    
    class var cardPrepaid: UIColor {
        return UIColor.init(patternImage: (UIImage(named: "cardpattern"))!)
    }
    
    class var cellWhite: UIColor {
        return UIColor.init(red: 0.97, green: 0.97, blue: 0.98, alpha: 1.0)
    }
    
    class var dropdownBackground: UIColor {
        return UIColor.init(red: 0.95, green: 0.95, blue: 0.95, alpha: 1.0)
    }
    
    class var mediumGreen: UIColor {
        return UIColor.init(red: 0.25, green: 0.69, blue: 0.31, alpha: 1.0)
    }
    
    class var darkOrange: UIColor {
        return UIColor.init(red: 0.96, green: 0.58, blue: 0.19, alpha: 1.0)
    }
    
    class var bloodyRed: UIColor {
        return UIColor.init(red: 0.91, green: 0.15, blue: 0.18, alpha: 1.0)
    }
    
    class var scheduleHeader: UIColor {
        return UIColor.init(red: 0.15, green: 0.24, blue: 0.42, alpha: 1.0)
    }
    
    class var scheduleCell: UIColor {
        return UIColor.init(red: 0.83, green: 0.84, blue: 0.90, alpha: 1.0)
    }
    
}
