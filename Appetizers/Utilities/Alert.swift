//
//  Alert.swift
//  Appetizers
//
//  Created by Blaze on 18/12/2023.
//

import SwiftUI

struct AlertItem: Identifiable {
    let id = UUID()
    let title: Text
    let message: Text
    let dismissButton: Alert.Button
}

struct AlertContext {
    static let invalidData = AlertItem(
        title: Text("Server Error"),
        message: Text("Data received from Server is invalid, please contaact support"),
        dismissButton: .default(Text("OK")))
    
    static let invalidResponse = AlertItem(
        title: Text("Server Error"),
        message: Text("Invalid Response from Server. Please try again later or contaact support"),
        dismissButton: .default(Text("OK")))
    
    static let invalidURL = AlertItem(
        title: Text("Server Error"),
        message: Text("There was an issue connecting to the Server. If this persists, please contact support"),
        dismissButton: .default(Text("OK")))
    
    static let unableToComplete = AlertItem(
        title: Text("Server Error"),
        message: Text("Unable to complete your request, please check your internet connection"),
        dismissButton: .default(Text("OK")))
    
    
}
