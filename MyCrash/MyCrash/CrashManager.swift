//
//  CrashManager.swift
//  MyCrash
//
//  Created by Süha Karakaya on 3.08.2023.
//

import Foundation
import FirebaseCrashlytics

final class CrashManager {
    static let shared = CrashManager()
    private init () {}
    
    func setUserId(userId: String) {
        Crashlytics.crashlytics().setUserID(userId)
    }
    
    func addLog(message: String) {
        Crashlytics.crashlytics().log(message)
        Crashlytics.crashlytics().setUserID("kamil")
    }
    
    
    

    
}
