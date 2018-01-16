//
//  Utils.swift
//  Orient
//
//  Created by Apple on 10/30/17.
//  Copyright © 2017 Apple. All rights reserved.
//

import UIKit
import AudioToolbox

enum CardType: String {
    case infinite = "464830"
    case gold = "464829"
    case classic = "403656"
    case prepaid = "432281"
}

enum Dashboard: NSInteger {
    case batch2 = 101
    case batch3 = 102
}

class Utils: NSObject {

    static var selectedDashboard:NSInteger = Dashboard.batch2.rawValue
    static var vcScanAndPayControllerIndex:NSInteger = 0
    static var vcSendMoneyControllerIndex:NSInteger = 0
    static var vcMicroSavingsControllerIndex:NSInteger = 0
    static var vcFastPayMenuControllerIndex:NSInteger = 0
    static var vcTransfersControllerIndex:NSInteger = 0
    static var vcOwnAccountTransferControllerIndex:NSInteger = 0
    
    class func getValidCardTypeName(number: String) -> String {
        switch number {
        case CardType.infinite.rawValue:
            return "Infinite"//464830
        case CardType.gold.rawValue:
            return "Gold"//464829
        case CardType.classic.rawValue:
            return "Classic"//403656
        case CardType.prepaid.rawValue:
            return "Prepaid"//432281
        default:
            return "DEBIT"//Others
        }
    }
    
    class func getValidCardTypeColor(number: String) -> UIColor {
        switch number {
        case CardType.infinite.rawValue:
            return Colors.cardInfinite//464830
        case CardType.gold.rawValue:
            return Colors.cardGold//464829
        case CardType.classic.rawValue:
            return Colors.cardClassic//403656
        case CardType.prepaid.rawValue:
            return Colors.cardPrepaid//432281
        default:
            return Colors.cardBlue//Others
        }
    }
    
    class var isVibrationEnabled: Bool {
        return UserDefaults.standard.bool(forKey: "isVibrationEnabled")
    }
    
    class func setVibrationEnabled(enable: Bool) -> Void {
        UserDefaults.standard.set(enable, forKey: "isVibrationEnabled")
    }
    
}

extension CGFloat {
    static func random() -> CGFloat {
        return CGFloat(arc4random()) / CGFloat(UInt32.max)
    }
}

extension UIColor {
    static func randomColor() -> UIColor {
        return UIColor(red: .random(), green: .random(), blue: .random(), alpha: 1.0)
    }
}

extension UIView {
    
    enum SwipeDirection
    {
        case left
        case right
        case top
        case bottom
    }
    
    func addPushTransition(direction: SwipeDirection) -> Void {

        self.layer.removeAllAnimations()
        
        let transition = CATransition()
        
        // Customize the animation's properties
        transition.type = kCATransitionPush
        
        switch direction {
        case SwipeDirection.left:
            transition.subtype = kCATransitionFromLeft
            break
        case SwipeDirection.right:
            transition.subtype = kCATransitionFromRight
            break
        case SwipeDirection.top:
            transition.subtype = kCATransitionFromTop
            break
        case SwipeDirection.bottom:
            transition.subtype = kCATransitionFromBottom
            break
        }
        transition.duration = 0.5
        transition.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
        transition.fillMode = kCAFillModeRemoved
        // Add the animation to the View's layer
        self.layer.add(transition, forKey: "slideTransition")
    }
    
    func addCardBorder(color: UIColor) -> Void {
        self.layer.borderWidth = 1.0
        self.backgroundColor = color
        self.layer.borderColor = UIColor.lightGray.cgColor
        self.layer.masksToBounds = true
        self.layer.cornerRadius = 10.0
    }
    func addBorder(color: UIColor = UIColor.init(red: 0.92, green: 0.92, blue: 0.92, alpha: 1.0)) -> Void {
        self.layer.borderWidth = 1.0
        self.layer.borderColor = color.cgColor
        self.layer.masksToBounds = true
        self.layer.cornerRadius = 4.0
    }
    
    func addTopBorder(color: UIColor = UIColor.init(red: 0.92, green: 0.92, blue: 0.92, alpha: 1.0))
    {
        let border = CALayer()
        let width = CGFloat(1.0)
        border.borderColor = color.cgColor
        border.frame = CGRect(x: 0, y: 0,   width:  self.frame.size.width, height: 1)
        
        border.borderWidth = width
        self.layer.addSublayer(border)
        self.layer.masksToBounds = true
    }
    
    func addBottomBorder(color: UIColor = UIColor.init(red: 0.92, green: 0.92, blue: 0.92, alpha: 1.0))
    {
        let border = CALayer()
        let width = CGFloat(1.0)
        border.borderColor = color.cgColor
        border.frame = CGRect(x: 0, y: self.frame.size.height - width,   width:  self.frame.size.width, height: 1)
        border.borderWidth = width
        self.layer.addSublayer(border)
        self.layer.masksToBounds = true
    }
    
    func addContraints() -> Void {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.topAnchor.constraint(equalTo: self.superview!.topAnchor).isActive = true
        self.bottomAnchor.constraint(equalTo: self.superview!.bottomAnchor).isActive = true
        self.leadingAnchor.constraint(equalTo: self.superview!.leadingAnchor).isActive = true
        self.trailingAnchor.constraint(equalTo: self.superview!.trailingAnchor).isActive = true
    }
    
    func applyGradient(colours: [UIColor] = [UIColor.init(red: 0.98, green: 0.98, blue: 0.98, alpha: 1.0), UIColor.init(red: 0.92, green: 0.92, blue: 0.92, alpha: 1.0)]) -> Void {
        self.applyGradient(colours: colours, locations: nil)
    }
    
    func applyGradient(colours: [UIColor], locations: [NSNumber]?) -> Void {
        let gradient: CAGradientLayer = CAGradientLayer()
        gradient.frame = self.bounds
        gradient.colors = colours.map { $0.cgColor }
        gradient.locations = locations
        self.layer.insertSublayer(gradient, at: 0)
        self.clipsToBounds = true
        self.layer.masksToBounds = true
    }
    
    // Name this function in a way that makes sense to you...
    // slideFromLeft, slideRight, slideLeftToRight, etc. are great alternative names
    func slideInFromLeft(duration: TimeInterval = 0.35, completionDelegate: AnyObject? = nil) {
        // Create a CATransition animation
        let slideInFromLeftTransition = CATransition()
        
        // Set its callback delegate to the completionDelegate that was provided (if any)
        if let delegate: AnyObject = completionDelegate {
            slideInFromLeftTransition.delegate = delegate as? CAAnimationDelegate
        }
        
        // Customize the animation's properties
        slideInFromLeftTransition.type = kCATransitionPush
        slideInFromLeftTransition.subtype = kCATransitionFromLeft
        slideInFromLeftTransition.duration = duration
        slideInFromLeftTransition.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
        slideInFromLeftTransition.fillMode = kCAFillModeRemoved
        
        // Add the animation to the View's layer
        self.layer.add(slideInFromLeftTransition, forKey: "slideInFromLeftTransition")
    }
    
    func slideInFromRight(duration: TimeInterval = 0.35, completionDelegate: AnyObject? = nil) {
        // Create a CATransition animation
        let slideInFromLeftTransition = CATransition()
        
        // Set its callback delegate to the completionDelegate that was provided (if any)
        if let delegate: AnyObject = completionDelegate {
            slideInFromLeftTransition.delegate = delegate as? CAAnimationDelegate
        }
        
        // Customize the animation's properties
        slideInFromLeftTransition.type = kCATransitionPush
        slideInFromLeftTransition.subtype = kCATransitionFromRight
        slideInFromLeftTransition.duration = duration
        slideInFromLeftTransition.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
        slideInFromLeftTransition.fillMode = kCAFillModeRemoved
        
        // Add the animation to the View's layer
        self.layer.add(slideInFromLeftTransition, forKey: "slideInFromLeftTransition")
    }
    
    func rotate360Degrees(duration: CFTimeInterval = 1.0, completionDelegate: AnyObject? = nil, repeatCount: Float = 1) {
        let rotateAnimation = CABasicAnimation(keyPath: "transform.rotation.x")
        rotateAnimation.fromValue = 0.0
        rotateAnimation.toValue = CGFloat(Double.pi * 2)
        rotateAnimation.duration = duration
        rotateAnimation.repeatCount = repeatCount
        
        if let delegate: CAAnimationDelegate = completionDelegate as! CAAnimationDelegate? {
            rotateAnimation.delegate = delegate
        }
        self.layer.add(rotateAnimation, forKey: nil)
    }
    
}

extension UIButton {
    
    func setRoundCornerBorder() {
        self.layer.borderWidth = 0.8
        self.layer.borderColor = Colors.title.cgColor
        self.layer.cornerRadius = 5
    }
    
    /// Makes the ``imageView`` appear just to the right of the ``titleLabel``.
    func alignImageRight() {
        if let titleLabel = self.titleLabel, let imageView = self.imageView {
            // Force the label and image to resize.
            titleLabel.sizeToFit()
            imageView.sizeToFit()
            imageView.contentMode = .scaleAspectFit
            
            // Set the insets so that the title appears to the left and the image appears to the right.
            // Make the image appear slightly off the top/bottom edges of the button.
            self.titleEdgeInsets = UIEdgeInsets(top: 0, left: -1 * imageView.frame.size.width,
                                                bottom: 0, right: imageView.frame.size.width)
            self.imageEdgeInsets = UIEdgeInsets(top: 0, left: titleLabel.frame.size.width,
                                                bottom: 0, right: -1.3 * titleLabel.frame.size.width)
        }
    }
    
    func addGradient(colorTop: UIColor, colorBottom: UIColor) -> Void {
        
        let gradient: CAGradientLayer = CAGradientLayer()
        gradient.colors = [colorTop.cgColor, colorBottom.cgColor]
        gradient.startPoint = CGPoint(x: 0.0, y: 0.0)
        gradient.endPoint = CGPoint(x: 0.0, y: 1.0)
        self.clipsToBounds = true
        gradient.frame = self.bounds
        self.layer.insertSublayer(gradient, below: self.imageView?.layer)
    }
    
    func defaultGradient() -> Void {
//        let colorTop = UIColor.init(red: 0.18, green: 0.25, blue: 0.44, alpha: 1.0)
//        let colorBottom = UIColor.init(red: 0.01, green: 0.11, blue: 0.32, alpha: 1.0)
//        self.addGradient(colorTop: colorTop, colorBottom: colorBottom)
        self.setBackgroundImage(UIImage.init(named: "buttonGradient"), for: .normal)
        self.isUserInteractionEnabled = true
    }
    
    func noActionGradient() -> Void {
        self.setBackgroundImage(UIImage.init(named: "noActionGradient"), for: .normal)
        self.isUserInteractionEnabled = false
    }
    func addVibration()  {
        
        if Utils.isVibrationEnabled == true {
            AudioServicesPlaySystemSound(SystemSoundID(kSystemSoundID_Vibrate))
        }
    }
}

extension UISegmentedControl {
    func setSegmentStyle() {
        self.setBackgroundImage(UIImage(named: "segment_normal"), for: .normal, barMetrics: .default)
        self.setBackgroundImage(UIImage(named: "segment_selected"), for: .selected, barMetrics: .default)
        self.setDividerImage(imageWithColor(color: UIColor.init(red: 0.85, green: 0.85, blue: 0.85, alpha: 1.0)), forLeftSegmentState: .normal, rightSegmentState: .normal, barMetrics: .default)
        self.layer.borderWidth = 0.8
        self.layer.borderColor = UIColor.init(red: 0.85, green: 0.85, blue: 0.85, alpha: 1.0).cgColor
        
        let font = UIFont(name: AppFontName.bold, size: 14)
        let normalAttributes: NSDictionary = [
            NSAttributedStringKey.foregroundColor: UIColor.darkGray,
            NSAttributedStringKey.font: font!
        ]
        let selectedAttributes: NSDictionary = [
            NSAttributedStringKey.foregroundColor: UIColor.black,
            NSAttributedStringKey.font: font!
        ]
        
        setTitleTextAttributes(selectedAttributes as [NSObject : AnyObject], for: UIControlState.selected)
        setTitleTextAttributes(normalAttributes as [NSObject : AnyObject], for: UIControlState.normal)
    }
    
    private func imageWithColor(color: UIColor) -> UIImage {
        let rect = CGRect(x: 0.0, y: 0.0, width:  1.0, height: 1.0)
        UIGraphicsBeginImageContext(rect.size)
        let context = UIGraphicsGetCurrentContext()
        context!.setFillColor(color.cgColor);
        context!.fill(rect);
        let image = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        return image!
    }
}

extension UILabel {
    
    func setLineSpacing(lineSpacing: CGFloat = 0.0, lineHeightMultiple: CGFloat = 0.0) {
        
        guard let labelText = self.text else { return }
        
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = lineSpacing
        paragraphStyle.lineHeightMultiple = lineHeightMultiple
        
        let attributedString:NSMutableAttributedString
        if let labelattributedText = self.attributedText {
            attributedString = NSMutableAttributedString(attributedString: labelattributedText)
        } else {
            attributedString = NSMutableAttributedString(string: labelText)
        }
        
        // Line spacing attribute
        attributedString.addAttribute(NSAttributedStringKey.paragraphStyle, value:paragraphStyle, range:NSMakeRange(0, attributedString.length))
        
        self.attributedText = attributedString
    }
}


extension Int {
    func withCommas() -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = NumberFormatter.Style.decimal
        return numberFormatter.string(from: NSNumber(value:self))!
    }
}


extension String {
    
    func formatByCommasAfterThreeDigits() -> String {
        return self.inserting(separator: ",", every: 3)
    }
    func inserting(separator: String, every n: Int) -> String {
        var new:String = self.replacingOccurrences(of: ",", with: "")
        var result: String = ""
        let characters = Array(new.characters.reversed())
        stride(from: 0, to: characters.count, by: n).forEach {
            result += String(characters[$0..<min($0+n, characters.count)])
            if $0+n < characters.count {
                result += separator
            }
        }
        return String(result.characters.reversed())
    }
    
    func toCardExpiryDate() -> String
    {
        let dateFormatter = DateFormatter()
        //31/10/2018
        dateFormatter.dateFormat = "dd/MM/yyyy"
        let dateFromString : NSDate = dateFormatter.date(from: self)! as NSDate
        
        let date:Date = dateFromString as Date
        dateFormatter.dateFormat = "yy"
        let expYr = dateFormatter.string(from: date)
        dateFormatter.dateFormat = "MM"
        let expMon = dateFormatter.string(from: date)
        
        return "\(expMon)/\(expYr)"
    }
    
    var isValidPinNo: Bool {
        
        print(self)
        if self == "1234" {
            return true
        }
        return false
    }
    
    //To check text field or String is blank or not
    var isBlank: Bool {
        get {
            let trimmed = trimmingCharacters(in: CharacterSet.whitespaces)
            return trimmed.isEmpty
        }
    }
    
    //Validate Email
    var isEmail: Bool {
        do {
            let regex = try NSRegularExpression(pattern: "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}", options: .caseInsensitive)
            return regex.firstMatch(in: self, options: NSRegularExpression.MatchingOptions(rawValue: 0), range: NSMakeRange(0, self.characters.count)) != nil
        } catch {
            return false
        }
    }
    
    var isAlphanumeric: Bool {
        return !isEmpty && range(of: "[^a-zA-Z0-9]", options: .regularExpression) == nil
    }
    
    //validate Password
    var isValidPassword: Bool {
        if(self.characters.count >= 6 && self.characters.count <= 12){
          let passwordTest = NSPredicate(format: "SELF MATCHES %@", "^(?=.*\\d)(?=.*[a-zA-Z]).{6,}$")
            return passwordTest.evaluate(with: self)
        }
        return false
    }
    
    var isValidDOB: Bool {
        
        let dateFormatterGet = DateFormatter()
        dateFormatterGet.dateFormat = "dd/MM/yyyy"
        
        if (dateFormatterGet.date(from: self)) != nil {
            return true
        } else {
            return false
        }
    }
    
    func compareString(with: String) -> Bool {
        return String(format: self) == with
    }
    
    var isValidatePhoneNumber: Bool {
        if self.characters.count < 12 {
            return false
        }
        let charcterSet  = NSCharacterSet(charactersIn: "+0123456789").inverted
        let inputString = self.components(separatedBy: charcterSet)
        let filtered = inputString.joined(separator: "")
        return  self == filtered
    }
    
    var isValidateAccountNumber: Bool {
        if self.characters.count < 14 {
            return false
        }
        return  true
    }
}

extension UIApplication {
    
    class func topViewController(controller: UIViewController? = UIApplication.shared.keyWindow?.rootViewController) -> UIViewController? {
        if let navigationController = controller as? UINavigationController {
            return topViewController(controller: navigationController.visibleViewController)
        }
        if let tabController = controller as? UITabBarController {
            if let selected = tabController.selectedViewController {
                return topViewController(controller: selected)
            }
        }
        if let presented = controller?.presentedViewController {
            return topViewController(controller: presented)
        }
        return controller
    }
    
    class var versionString: String {
        get {
            if let bundleInfoDictionary = Bundle.main.infoDictionary {
                let buildVersionString = bundleInfoDictionary["CFBundleVersion"] as! String
                let marketingVersionString = bundleInfoDictionary["CFBundleShortVersionString"] as! String
                return marketingVersionString + " (\(buildVersionString))"
            } else {
                return "Unknown"
            }
        }
    }
    
    class var appName: String {
        get {
            if let bundleInfoDictionary = Bundle.main.infoDictionary {
                let name = bundleInfoDictionary["CFBundleName"] as! String
                return name
            } else {
                return "Unknown"
            }
        }
    }
}

extension Bundle {
    var versionNumber: String? {
        return infoDictionary?["CFBundleShortVersionString"] as? String
    }
    var buildNumber: String? {
        return infoDictionary?["CFBundleVersion"] as? String
    }
}


public extension UIDevice {
    
    var iPhone: Bool {
        return UIDevice().userInterfaceIdiom == .phone
    }
    
    enum ScreenType: String {
        case iPhone4
        case iPhone5
        case iPhone6
        case iPhone6Plus
        case iPhoneX
        case Unknown
    }
    
    var screenType: ScreenType {
        guard iPhone else { return .Unknown}
        switch UIScreen.main.nativeBounds.height {
        case 960:
            return .iPhone4
        case 1136:
            return .iPhone5
        case 1334:
            return .iPhone6
        case 2208:
            return .iPhone6Plus
        case 2436:
            return .iPhoneX
        default:
            return .Unknown
        }
    }
    
}

extension UITextView {
    func addDefaultStyle() {
        self.setBorderColor(width: 1.0, color: Colors.textFieldNormalBorder)
        self.layer.sublayerTransform = CATransform3DMakeTranslation(5, 0, 0);
    }
    func setBorderColor(width:CGFloat = 1.0, color: UIColor) -> Void {
        self.layer.borderColor = color.cgColor
        self.layer.borderWidth = width
        self.layer.masksToBounds = true;
    }
    
    
    func setCornerRadius(value: CGFloat) {
        self.layer.cornerRadius = value
        self.layer.borderWidth = 1.0
        self.layer.borderColor = UIColor.lightGray.cgColor
        self.layer.masksToBounds = true
    }
    
    func showErrorToolTip(message: String, title: String? = nil) -> Void {
        let popTip = UIToolTip(title: title, message: message)
        popTip.popColor = UIColor.red
        popTip.titleColor = UIColor.white
        popTip.textColor = UIColor.white
        popTip.presentAnimatedPointingAtView(self, inView: self.superview!, autodismissAtTime: 1.5)
    }
    
}

extension Formatter {
    static let withSeparator: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.groupingSeparator = ","
        formatter.numberStyle = .decimal
        return formatter
    }()
}

extension BinaryInteger {
    var formattedWithSeparator: String {
        return Formatter.withSeparator.string(for: self) ?? ""
    }
}

