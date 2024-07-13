//
//  ThirdViewController.swift
//  MyCrash
//
//  Created by Süha Karakaya on 3.08.2023.
//

import UIKit

class ThirdViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        label.text = "ThirdViewController"
        CrashManager.shared.addLog(message: "ThirdViewController")
    }
    

    @IBAction func backButton(_ sender: Any) {
        dismiss(animated: true)
    }
    
    @IBAction func nextButton(_ sender: Any) {
        let numbers = [0]
        let _ = numbers[1]
        let destinationVC = self.storyboard?.instantiateViewController(withIdentifier: "FourthViewController") as! FourthViewController
        self.show(destinationVC, sender: nil)
    }
}
