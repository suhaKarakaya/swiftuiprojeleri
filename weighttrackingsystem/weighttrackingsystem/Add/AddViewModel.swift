//
//  AddViewModel.swift
//  weighttrackingsystem
//
//  Created by Süha Karakaya on 9.11.2023.
//

import Foundation
import UIKit
import CoreData

protocol AddViewModelInterface {
    func setButton(selectBtn: UIButton, unSelectBtn: UIButton)
    func controlData(_ data: CoreData, _ firstData: CoreData?)
}

class AddViewModel: AddViewModelInterface {
    func controlData(_ data: CoreData, _ firstData: CoreData?) {
        var coreData = data
        controlFlag = false
        if coreData.age == nil || coreData.age == "" {
            controlFlag = true
        }
        if coreData.current_weight == nil || coreData.current_weight == "" {
            controlFlag = true
        }
        if coreData.target_weight == nil || coreData.target_weight == "" {
            controlFlag = true
        }
        if coreData.size == nil || coreData.size == "" {
            controlFlag = true
        }
        if coreData.gender == .None {
            controlFlag = true
        }
        if controlFlag {
            //            alert basılacak
        } else {
            //            hesaplamalar yapılacak
            var mevcut = Double(coreData.current_weight!) ?? 0.0 // last data
            var hedef = Double(coreData.target_weight!) ?? 0.0 // last data
            var baslangic = Double(firstData?.current_weight! ?? "0.0") ?? 0.0 // first data
            var boy = Double(coreData.size!) ?? 0.0
            var yas = Double(coreData.age!) ?? 0.0
            if baslangic > hedef {
                coreData.changeRateValue(value: ((baslangic - mevcut) * 100) / (baslangic - hedef))// kilo verme yüzdesi
            } else {
                coreData.changeRateValue(value: ((mevcut - baslangic) * 100) / (hedef - baslangic))//kilo alma yüzdesi
            }
            //basal metabolism
            if coreData.gender == .Kadın {
                coreData.changeBMRValue(value: String(format: "%.2f", 655.10 + (9.56 * baslangic) + (1.85 * boy - (4.68 * yas))))
            } else {
                coreData.changeBMRValue(value: String(format: "%.2f", 66.47 + (13.75 * baslangic) + (5 * boy - (6.76 * yas))))
            }
            //vki
            coreData.changeVKIValue(value: String(format: "%.2f", baslangic / ((boy / 100.0 ) * (boy / 100.0 ))))
            
            //ideal kilo
            if coreData.gender == .Kadın {
                coreData.changeIdealKgValue(value: String(format: "%.2f", 45.5 + (2.3 *  (boy * 0.3937 - 60))))
            } else {
                coreData.changeIdealKgValue(value: String(format: "%.2f", 50 + (2.3 * (boy * 0.3937 - 60))))
            }
            //durum
            var tempVki = Double(coreData.vki ?? "") ?? 0.0
            if tempVki > 18 && tempVki < 25 {
                coreData.changeStatusValue(value: .Normal)
            } else if tempVki > 25 && tempVki < 35 {
                coreData.changeStatusValue(value: .First)
            } else if tempVki > 35 && tempVki < 40 {
                coreData.changeStatusValue(value: .Second)
            } else if tempVki > 40 {
                coreData.changeStatusValue(value: .Weak)
            } else {
                coreData.changeStatusValue(value: .None)
            }
            coreData.setStartWeightValue(value: "85")
            coreData.setUUIDValue()
            setCoreData(coreData)
            
            
            
            
        }
    }
    
    func setButton(selectBtn: UIButton, unSelectBtn: UIButton) {
        selectBtn.tintColor = ._green
        selectBtn.setImage(UIImage(systemName: "circle.inset.filled"), for: .normal)
        unSelectBtn.tintColor = ._red
        unSelectBtn.setImage(UIImage(systemName: "circlebadge"), for: .normal)
    }
    
    private var controlFlag = false
    weak var view: AddViewControllerInterFace?
    
    
    private func setCoreData(_ data: CoreData){
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        let saveData = NSEntityDescription.insertNewObject(forEntityName: "WeightTrackingSystemData", into: context)
        
        saveData.setValue(data.age, forKey: "age")
        saveData.setValue(data.bmr, forKey: "bmr")
        saveData.setValue(data.current_weight, forKey: "current_weight")
        saveData.setValue(data.date, forKey: "date")
        saveData.setValue(data.gender?.rawValue, forKey: "gender")
        saveData.setValue(data.idealKg, forKey: "idealKg")
        saveData.setValue(data.rate, forKey: "rate")
        saveData.setValue(data.size, forKey: "size")
        saveData.setValue(data.status?.rawValue, forKey: "status")
        saveData.setValue(data.target_weight, forKey: "target_weight")
        saveData.setValue(data.uid, forKey: "uid")
        saveData.setValue(data.vki, forKey: "vki")
        saveData.setValue(data.startWeight, forKey: "startWeight")
        
        do {
            try context.save()
            debugPrint("Succes")
        } catch {
            debugPrint("Error")
        }
//        finish
    }
    
}
