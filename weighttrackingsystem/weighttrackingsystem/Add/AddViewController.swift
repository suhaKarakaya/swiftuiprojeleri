//
//  AddViewController.swift
//  weighttrackingsystem
//
//  Created by Süha Karakaya on 9.11.2023.
//

import UIKit

protocol AddViewControllerInterFace: AnyObject {
}

class AddViewController: SecondViewController {
    
    @IBOutlet weak var btnMan: UIButton!
    @IBOutlet weak var btnWoman: UIButton!
    @IBOutlet weak var tfHeight: UITextField!
    @IBOutlet weak var tfTargetKg: UITextField!
    @IBOutlet weak var tfAvaibleKg: UITextField!
    @IBOutlet weak var tfAge: UITextField!
    
    private lazy var viewModel = AddViewModel()
    private var gender: Gender = .None
    var segueData: CoreData?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.view = self
        
    }
    @IBAction func btnWomanAction(_ sender: Any) {
        gender = .Kadın
        viewModel.setButton(selectBtn: btnWoman, unSelectBtn: btnMan)
    }
    @IBAction func btnManAction(_ sender: Any) {
        gender = .Erkek
        viewModel.setButton(selectBtn: btnMan, unSelectBtn: btnWoman)
    }
    @IBAction func btnSaveAction(_ sender: Any) {
        var data = CoreData(age: tfAge.text, bmr: nil, current_weight: tfAvaibleKg.text, date: Date(), gender: gender, idealKg: nil, rate: nil, size: tfHeight.text, status: nil, target_weight: tfTargetKg.text, uid: nil, vki: nil, startWeight: nil)
        viewModel.controlData(data, segueData)
    }
    
    
    
    
}

extension AddViewController: AddViewControllerInterFace {

}

