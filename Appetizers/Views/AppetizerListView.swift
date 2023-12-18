//
//  AppetizerListView.swift
//  Appetizers
//
//  Created by Blaze on 16/12/2023.
//

import SwiftUI

struct AppetizerListView: View {
    var body: some View {
        NavigationView {
            List(MockData.appetizers) { appetizer in
//                Text(appetizer.name)
               AppetizerCard(appetizer: appetizer)
            }
                .navigationTitle("Appetizers")

        }
    }
}

struct AppetizerListView_Previews: PreviewProvider {
    static var previews: some View {
        AppetizerListView()
    }
}


