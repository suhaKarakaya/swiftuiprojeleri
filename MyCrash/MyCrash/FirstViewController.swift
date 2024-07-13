//
//  ViewController.swift
//  MyCrash
//
//  Created by Süha Karakaya on 3.08.2023.
//

import UIKit

class FirstViewController: UIViewController {
    @IBOutlet weak var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        label.text = "FirstViewController"
        CrashManager.shared.addLog(message: "FirstViewController")
    }
    
    
    @IBAction func nextButton(_ sender: Any) {
        let destinationVC = self.storyboard?.instantiateViewController(withIdentifier: "SecondViewController") as! SecondViewController
        var data = Ogrenci(isim: "suha", yas: 28)
        destinationVC.moveData = data
        self.show(destinationVC, sender: nil)
    }
    
}

