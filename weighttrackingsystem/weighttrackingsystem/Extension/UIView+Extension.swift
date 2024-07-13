//
//  UIView+Extension.swift
//  weighttrackingsystem
//
//  Created by Süha Karakaya on 9.11.2023.
//

import UIKit

extension UIView {
    
    @IBInspectable var borderRadius: CGFloat {
        get{
            return self.borderRadius
        }
        set {
            self.layer.cornerRadius = newValue
        }
    }
    
    @IBInspectable var borderWith: Int {
        get{
            return self.borderWith
        }
        set {
            self.layer.borderWidth = CGFloat(newValue)
        }
    }
    
    @IBInspectable var bordercolor: UIColor {
        get{
            return self.bordercolor
        }
        set {
            self.layer.borderColor = newValue.cgColor
        }
    }
}
