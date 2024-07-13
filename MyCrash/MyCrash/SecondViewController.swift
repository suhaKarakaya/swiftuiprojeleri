//
//  SecondViewController.swift
//  MyCrash
//
//  Created by Süha Karakaya on 3.08.2023.
//

import UIKit

class SecondViewController: UIViewController {
    @IBOutlet weak var label: UILabel!
    var moveData: Ogrenci?
    override func viewDidLoad() {
        super.viewDidLoad()
        label.text = "SecondViewController"
//        CrashManager.shared.addLog(message: "SecondViewController")
        
        CrashManager.shared.addLog(message: moveData?.toJsonString ?? "")
    }
    

    @IBAction func backButton(_ sender: Any) {
        dismiss(animated: true)
    }
    

    @IBAction func nextButton(_ sender: Any) {
        let destinationVC = self.storyboard?.instantiateViewController(withIdentifier: "ThirdViewController") as! ThirdViewController
        self.show(destinationVC, sender: nil)
    }
}
