//
//  User.swift
//  Appetizers
//
//  Created by Süha Karakaya on 2.02.2024.
//

import Foundation

struct User: Codable {
    var firstName       = ""
    var lastName        = ""
    var email           = ""
    var birthdate       = Date()
    var extraNapkins    = false
    var frequentRefills = false
}
