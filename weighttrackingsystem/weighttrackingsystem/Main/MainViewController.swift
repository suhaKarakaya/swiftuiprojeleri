//
//  ViewController.swift
//  weighttrackingsystem
//
//  Created by Süha Karakaya on 9.11.2023.
//

import UIKit
import Lottie
import CoreData

protocol MainViewControllerInterFace: AnyObject {
}

class MainViewController: UIViewController {
    
    @IBOutlet weak var labelTargetKg: UILabel!
    @IBOutlet weak var labelAvailableKg: UILabel!
    @IBOutlet weak var labelStartKg: UILabel!
    @IBOutlet weak var labelIdealKgValue: UILabel!
    @IBOutlet weak var labelIdealKgKey: UILabel!
    @IBOutlet weak var labelBMRValue: UILabel!
    @IBOutlet weak var labelBMRKey: UILabel!
    @IBOutlet weak var labelChart: UILabel!
    @IBOutlet weak var viewChart: CircleBar!
    @IBOutlet weak var labelStatusValue: UILabel!
    @IBOutlet weak var labelStatusKey: UILabel!
    @IBOutlet weak var labelVKIValue: UILabel!
    @IBOutlet weak var labelVKIKey: UILabel!
    @IBOutlet weak var btnChat: UIButton!
    @IBOutlet weak var btnAddData: UIButton!
    
    private let animationView: LottieAnimationView = {
        let lottieAnimationView = LottieAnimationView(name: "splashanimation")
        lottieAnimationView.backgroundColor = UIColor.init(named: "_green")
        return lottieAnimationView
    }()
    
    private lazy var viewModel = MainViewModel()
    var list = [CoreData]()
    var _data: CoreData?

    override func viewDidLoad() {
        super.viewDidLoad()
        generateSplashScreen()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        getCoreData()
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    @IBAction func btnAddDataAction(_ sender: Any) {
        performSegue(withIdentifier: "toAddVC", sender: list.last)
    }
    
    @IBAction func btnChatAction(_ sender: Any) {
        performSegue(withIdentifier: "toChatVC", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toAddVC" {
            let destinationVC = segue.destination as! AddViewController
            destinationVC.segueData = sender as? CoreData
        }
    }
    
    func getCoreData(){
        list = []
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        let context = appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "WeightTrackingSystemData")
        fetchRequest.returnsObjectsAsFaults = false
        
        do {
            let results = try context.fetch(fetchRequest)
            if results.isEmpty {
//                performSegue(withIdentifier: "toSecondVC", sender: true)
            } else {
                for result in results as! [NSManagedObject] {
                    var _age: String = ""
                    var _bmr: String = ""
                    var _current_weight: String = ""
                    var _date: Date? = nil
                    var _gender: Gender? = .None
                    var _idealKg: String = ""
                    var _rate: Double = 0.0
                    var _size: String = ""
                    var _status: Status = .None
                    var _target_weight: String = ""
                    var _uid: UUID? = nil
                    var _vki: String = ""
                    var _startWeight: String = ""
                    
                    if let age = result.value(forKey: "age") as? String {
                        _age = age
                    }
                    if let age = result.value(forKey: "bmr") as? String {
                        _bmr = age
                    }
                    if let age = result.value(forKey: "current_weight") as? String {
                        _current_weight = age
                    }
                    if let age = result.value(forKey: "date") as? Date {
                        _date = age
                    }
                    if let age = result.value(forKey: "gender") as? Int16 {
                        _gender?.addValue(val: Int16(age) ?? 0)
                    }
                    if let age = result.value(forKey: "idealKg") as? String {
                        _idealKg = age
                    }
                    if let age = result.value(forKey: "rate") as? Double {
                        _rate = age
                    }
                    if let age = result.value(forKey: "size") as? String {
                        _size = age
                    }
                    if let age = result.value(forKey: "status") as? String {
                        _status.addValue(val: age)
                    }
                    if let age = result.value(forKey: "target_weight") as? String {
                        _target_weight = age
                    }
                    if let age = result.value(forKey: "uid") as? UUID {
                        _uid = age
                    }
                    if let age = result.value(forKey: "vki") as? String {
                        _vki = age
                    }
                    if let age = result.value(forKey: "startWeight") as? String {
                        _startWeight = age
                    }
                    list.append(CoreData.init(age: _age, bmr: _bmr, current_weight: _current_weight, date: _date, gender: _gender, idealKg: _idealKg, rate: _rate, size: _size, status: _status, target_weight: _target_weight, uid: _uid, vki: _vki, startWeight: _startWeight))
                }
                var ready = list.sorted(by: { $0.date?.compare($1.date ?? Date()) == .orderedDescending })
                self.createCircularChart(value: Double(Double(list.first?.rate ?? 0) / 100), color: list.first?.rate == 100 ? ._green : ._red)
            }
        } catch {
            
        }
    }
}


extension MainViewController {
   func createCircularChart(value: Double, color: UIColor) {
       labelChart.text = String(format: "%%%d", 42)
       labelChart.textColor = color
       viewChart.lineColor = color
       viewChart.value = value
       viewChart.progressAnimation(duration: 0.5)
   }
    func generateSplashScreen(){
        // 1
        view.addSubview(animationView)
        
        // 2
        animationView.frame = view.bounds
        animationView.center = view.center
        animationView.alpha = 1
        
        // 3
        animationView.play { _ in
            UIView.animate(withDuration: 0.3, animations: {
                self.animationView.alpha = 0
            }, completion: { _ in
                self.animationView.isHidden = true
                self.animationView.removeFromSuperview()
            })
        }
    }
}
