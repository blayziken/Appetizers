//
//  Date.swift
//  Appetizers
//
//  Created by Blaze on 19/12/2023.
//

import Foundation

extension Date {
    
    var eighteenYearsAgo: Date {
        Calendar.current.date(byAdding: .year, value: -18, to: Date())!
    }
    
    
    var oneHundredTenYearsAgo: Date {
        Calendar.current.date(byAdding: .year, value: -80, to: Date())!
    }
}
