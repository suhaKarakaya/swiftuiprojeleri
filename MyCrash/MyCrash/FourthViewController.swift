//
//  FourthViewController.swift
//  MyCrash
//
//  Created by Süha Karakaya on 3.08.2023.
//

import UIKit

class FourthViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        label.text = "FourthViewController"
        CrashManager.shared.addLog(message: "FourthViewController")
    }
    

    @IBAction func BackButton(_ sender: Any) {
        let numbers = [0]
        let _ = numbers[1]
//        dismiss(animated: true)
    }
    
}
