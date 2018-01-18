//
//  TextField.swift
//  TDCustomButton
//
//  Created by Apple on 18/01/18.
//  Copyright © 2018 Apple. All rights reserved.
//

import UIKit

class TextField: UIView {

//    @IBOutlet weak var widthConstraint: NSLayoutConstraint!
//
//    @IBOutlet weak var textField: UITextField?
//
//    @IBOutlet weak var label: UILabel?
//
//    var clickAction: PerformClickAction!
//
//    var view: UIView!
//
//    public var buttonViewType: UIButtonType = .primary
//
//    public var roundCorner: UIRectCorner = []
//
//    public var cornerRadius: CGFloat = 0.0
//
//    public var borderWidth: CGFloat = 0
//
//    public var borderColor: UIColor?
//
//    public var buttonTitleColor: UIColor?
//
//    public var buttonTitleFont: UIFont = UIFont.systemFont(ofSize: 18)
//
//    public var topBorderWidth: CGFloat = 0 {
//        didSet{
//            removeborder(tag: 101)
//            let line = UIView(frame: CGRect(x: 0.0, y: 0.0, width: bounds.width, height: topBorderWidth))
//            line.translatesAutoresizingMaskIntoConstraints = false
//            line.backgroundColor = borderColor
//            line.tag = 101
//            self.addSubview(line)
//            line.constrainEqualWidths(self)
//
//        }
//    }
//
//    public var leftBorderWidth: CGFloat = 0 {
//        didSet{
//            removeborder(tag: 102)
//            let line = UIView(frame: CGRect(x: 0.0, y: 0.0, width: leftBorderWidth, height: bounds.height))
//            line.translatesAutoresizingMaskIntoConstraints = false
//            line.backgroundColor = borderColor
//            line.tag = 102
//            self.addSubview(line)
//            line.constrainEqualWidths(self)
//        }
//    }
//
//    public var bottomBorderWidth: CGFloat = 0 {
//        didSet{
//            removeborder(tag: 103)
//            let line = UIView(frame: CGRect(x: 0.0, y: bounds.height - bottomBorderWidth, width: bounds.width, height: bottomBorderWidth))
//            line.translatesAutoresizingMaskIntoConstraints = false
//            line.backgroundColor = borderColor
//            line.tag = 103
//            self.addSubview(line)
//            line.constrainEqualWidths(self)
//
//        }
//    }
//
//    public var rightBorderWidth: CGFloat = 0 {
//        didSet{
//            removeborder(tag: 104)
//            let line = UIView(frame: CGRect(x: bounds.width - rightBorderWidth, y: 0.0, width: rightBorderWidth, height: bounds.height))
//            line.translatesAutoresizingMaskIntoConstraints = false
//            line.backgroundColor = borderColor
//            line.tag = 104
//            self.addSubview(line)
//            line.constrainEqualWidths(self)
//        }
//    }
//
//
////    required public init?(coder aDecoder: NSCoder) {
////        super.init(coder: aDecoder)
////        //        guard let buttonView = CoreUIPod.bundle.loadNibNamed(String(describing: type(of: self)),
////        //                                                             owner: self,
////        //                                                             options: nil)?[0] as? UIView else { return }
////
////        let buttonView = Bundle.main.loadNibNamed("TextField", owner: self, options: nil)?[0] as! UIView
////
////        view = buttonView
////        buttonView.frame = self.bounds
////        buttonView.autoresizingMask = [UIViewAutoresizing.flexibleWidth, UIViewAutoresizing.flexibleHeight]
////        self.addSubview(buttonView)
////        self.setNeedsDisplay()
////    }
////    override init(frame: CGRect) {
////        super.init(frame: frame)
////        //        guard let buttonView = CoreUIPod.bundle.loadNibNamed(String(describing: type(of: self)),
////        //                                                             owner: self,
////        //                                                             options: nil)?[0] as? UIView else { return }
////
////        let buttonView = Bundle.main.loadNibNamed("TextField", owner: self, options: nil)?[0] as! UIView
////        view = buttonView
////        buttonView.frame = self.bounds
////        buttonView.autoresizingMask = [UIViewAutoresizing.flexibleWidth, UIViewAutoresizing.flexibleHeight]
////        self.addSubview(buttonView)
////        self.setNeedsDisplay()
////    }
//
//
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//        commonInit()
//    }
//
//    required init?(coder aDecoder: NSCoder) {
//        super.init(coder: aDecoder)
//        commonInit()
//    }
//
//    private func commonInit() {
//        let buttonView = Bundle.main.loadNibNamed("TextField", owner: self, options: nil)?[0] as! UIView
//        view = buttonView
//        buttonView.frame = self.bounds
//        buttonView.autoresizingMask = [UIViewAutoresizing.flexibleWidth, UIViewAutoresizing.flexibleHeight]
//        self.addSubview(buttonView)
////        self.setNeedsDisplay()
//    }
//
//
//
//
//    func addTarget(action: @escaping PerformClickAction) {
//        self.clickAction = action
//    }
//
//    @IBAction func buttonPressed(_ sender: Any) {
//        if self.clickAction != nil {
//            self.clickAction(self)
//        }
//    }
//
//    override public func layoutSubviews() {
//        self.setNeedsDisplay()
//    }
//
//    override public func draw(_ rect: CGRect) {
//        self.view.layer.borderWidth = self.borderWidth
//        self.view.layer.borderColor = self.borderColor?.cgColor
//
//        if self.roundCorner == .allCorners {
//            self.view.layer.cornerRadius = self.cornerRadius
//        } else {
//            let path = UIBezierPath(roundedRect: self.bounds,
//                                    byRoundingCorners: self.roundCorner,
//                                    cornerRadii:CGSize(width: self.cornerRadius, height: cornerRadius))
//
//            let mask = CAShapeLayer()
//            mask.path = path.cgPath
//            self.view.layer.mask = mask
//        }
//        self.view.layer.masksToBounds = true
//        self.view.clipsToBounds = true
//
//    }
//
//    func removeborder(tag: Int) {
//        for view in self.subviews {
//            if view.tag == tag  {
//                view.removeFromSuperview()
//            }
//
//        }
//    }
}
