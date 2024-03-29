//
//  LoadingView.swift
//  Appetizers
//
//  Created by Blaze on 19/12/2023.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {
        ZStack {
            Color(.systemBackground)
                .edgesIgnoringSafeArea(.all)
            
            ProgressView()
//                .controlSize(.large)
                .scaleEffect(2)
                .tint(.brandPrimary)
        }
    }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView()
    }
}
