//
//  NetworkError.swift
//  Appetizers
//
//  Created by Blaze on 18/12/2023.
//

import Foundation

enum NetworkError: Error {
    case invalidURL  // Bad URL
    case invalidResponse // 404, 500 etc.
    case invalidData // Can't parse data
    case unableToComplete // General errors (connectivity) etc
}
