//
//  UIToast.swift
//  Orient
//
//  Created by Apple on 15/11/17.
//  Copyright © 2017 Apple. All rights reserved.
//

import Foundation
import UIKit

class UIToast {
    
    let toastLabel: UILabel!
    let toastDuration = 2.0
    let toastFadeDuration = 2.0
    let initialAlpha = 0.9
    let cornerRadius = 3
    let noOfLines = 0
    
    init(with message:String) {
        let count = UIApplication.shared.windows.count
        let keyWindow = UIApplication.shared.windows[count-1]
        toastLabel = UILabel(frame: CGRect(x: 0 , y: 0, width: keyWindow.frame.width, height: 0))
        toastLabel.backgroundColor = UIColor.init(white: 0, alpha: 0.7)
        toastLabel.textColor = UIColor.white
        toastLabel.font = UIFont.systemFont(ofSize: 14)
        toastLabel.textAlignment = NSTextAlignment.center;
        toastLabel.text = message
        toastLabel.adjustsFontSizeToFitWidth = false
        toastLabel.alpha = CGFloat(initialAlpha)
        toastLabel.layer.cornerRadius = CGFloat(cornerRadius)
        toastLabel.numberOfLines = noOfLines
        toastLabel.lineBreakMode = .byWordWrapping
        toastLabel.clipsToBounds  =  true
        keyWindow.addSubview(toastLabel)
        toastLabel.sizeToFit()
        
        toastLabel.frame = CGRect( x: toastLabel.frame.minX, y: toastLabel.frame.minY - 20, width: toastLabel.frame.width + 20,height: toastLabel.frame.height + 8)
    }
    
    func show(){
        let count = UIApplication.shared.windows.count
        let keyWindow = UIApplication.shared.windows[count-1]
        toastLabel.center = keyWindow.center
        UIView.animate(withDuration: toastFadeDuration, delay:toastDuration, options: UIViewAnimationOptions.curveEaseOut, animations: {
            self.toastLabel.alpha = 0.0
        }, completion: { (true) in
            self.toastLabel.removeFromSuperview()
        })
    }
    
}
