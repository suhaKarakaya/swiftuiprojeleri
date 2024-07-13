//
//  UIViewController+Extension.swift
//  weighttrackingsystem
//
//  Created by Süha Karakaya on 9.11.2023.
//

import UIKit

protocol KeyboardProtocol {
    func hideKeyboardWhenTappedAround()
}

extension UIViewController {
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}

extension KeyboardProtocol where Self: UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }

}
