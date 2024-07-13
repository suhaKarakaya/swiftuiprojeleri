//
//  CoreData.swift
//  weighttrackingsystem
//
//  Created by Süha Karakaya on 10.11.2023.
//

import Foundation

struct ll {
    let age: String
    var bmr: String
    let current_weight: String
    let date: Date
    let gender: Int16
    var idealKg: String
    var rate: Double
    let size: String
    var status: String
    let target_weight: String
    var uid: UUID
    var vki: String
    var startWeight: String
}

struct CoreData {
    let age: String?
    var bmr: String?
    let current_weight: String?
    let date: Date?
    let gender: Gender?
    var idealKg: String?
    var rate: Double?
    let size: String?
    var status: Status?
    let target_weight: String?
    var uid: UUID?
    var vki: String?
    var startWeight: String?
    
    init(age: String?, bmr: String?, current_weight: String?, date: Date?, gender: Gender?, idealKg: String?, rate: Double?, size: String?, status: Status?, target_weight: String?, uid: UUID?, vki: String?, startWeight: String?) {
        self.age = age
        self.bmr = bmr
        self.current_weight = current_weight
        self.date = date
        self.gender = gender
        self.idealKg = idealKg
        self.rate = rate
        self.size = size
        self.status = status
        self.target_weight = target_weight
        self.uid = uid
        self.vki = vki
        self.startWeight = startWeight
    }
    
    mutating func changeRateValue(value: Double) {
        rate = value
    }
    mutating func changeBMRValue(value: String) {
        bmr = value
    }
    mutating func changeVKIValue(value: String) {
        vki = value
    }
    mutating func changeIdealKgValue(value: String) {
        idealKg = value
    }
    mutating func changeStatusValue(value: Status) {
        status = value
    }
    mutating func setUUIDValue() {
        uid = UUID()
    }
    mutating func setStartWeightValue(value: String) {
        startWeight = value
    }
    
}

enum Gender: Int16 {
    case None = 0
    case Erkek = 1
    case Kadın = 2
    
    mutating func addValue(val: Int16) {
        switch val {
        case 0:
            self = .None
        case 1:
            self = .Erkek
        case 2:
            self = .Kadın
        default:
            self = .None
        }
    }
}

enum Status: String {
    case None = ""
    case Normal = "Normal"
    case First = "First"
    case Second = "Second"
    case Weak = "Weak"
    
    mutating func addValue(val: String) {
        switch val {
        case "":
            self = .None
        case "Normal":
            self = .Normal
        case "First":
            self = .First
        case "Second":
            self = .Second
        case "Weak":
            self = .Weak
        default:
            self = .None
        }
    }
    
}
