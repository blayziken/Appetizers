//
//  AppetizerListView.swift
//  Appetizers
//
//  Created by Blaze on 16/12/2023.
//

import SwiftUI

struct AppetizerListView: View {
    
    @StateObject var appetizerListVM = AppetizerListViewModel()
    
    var body: some View {
        
        ZStack {
            NavigationView {
                List(appetizerListVM.appetizers) { appetizer in
                    AppetizerCard(appetizer: appetizer)
                }
                .navigationTitle("Appetizers")
            }
            .onAppear {
                appetizerListVM.getAppetizers()
            }
            
            if appetizerListVM.isLoading == true {
                LoadingView()
            }
            
        }
        .alert(item: $appetizerListVM.alertItem) { alertItem in
            Alert(
                title: alertItem.title,
                message: alertItem.message,
                dismissButton: alertItem.dismissButton
            )
        }
        
    }
    
    
}

struct AppetizerListView_Previews: PreviewProvider {
    static var previews: some View {
        AppetizerListView()
    }
}


