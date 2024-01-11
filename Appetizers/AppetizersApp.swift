//
//  AppetizersApp.swift
//  Appetizers
//
//  Created by Blaze on 16/12/2023.
//

import SwiftUI

@main
struct AppetizersApp: App {
    
    var order = Order()
    
    var body: some Scene {
        WindowGroup {
            AppetizerTabView()
                .environmentObject(order)
        }
    }
}
