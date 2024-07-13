//
//  SecondViewController.swift
//  weighttrackingsystem
//
//  Created by Süha Karakaya on 9.11.2023.
//

import UIKit

class SecondViewController: UIViewController,KeyboardProtocol {

    override func viewDidLoad() {
        super.viewDidLoad()
        hideKeyboardWhenTappedAround()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationItem.hidesBackButton = true
        navigationItem.leftBarButtonItem = UIBarButtonItem.menuButton(self, action: #selector(_dismiss), imageName: UIImage(named: "_back")!.withRenderingMode(.alwaysOriginal))
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    @objc func _dismiss() {
        navigationController?.popViewController(animated: true)
    }
}
