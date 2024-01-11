//
//  User.swift
//  Appetizers
//
//  Created by Blaze on 28/12/2023.
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
