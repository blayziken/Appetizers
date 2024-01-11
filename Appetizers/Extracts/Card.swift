//
//  Card.swift
//  Appetizers
//
//  Created by Blaze on 18/12/2023.
//

import SwiftUI

struct AppetizerCard: View {
    
    let appetizer: Appetizer
    
    var body: some View {
        HStack {
//            AppetizerRemoteImage(urlString: appetizer.imageURL)
//                .aspectRatio(contentMode: .fill)
//                .frame( width: 120, height: 90)
//                .cornerRadius(8)
//                 
            
            // NOTE: IF CACHING IS IMPORTANT, DON'T USE ASYNC IMAGE
            
            AsyncImage(url: URL(string: appetizer.imageURL)) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 120, height: 90)
                    .cornerRadius(8)
            } placeholder: {
                Image("no-image")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 120, height: 90)
                    .cornerRadius(8)
            }
            
            VStack(alignment: .leading, spacing:5) {
                Text(appetizer.name)
                    .font(.title3)
                    .fontWeight(.medium)
                    
                
                Text("$\(appetizer.price, specifier: "%.2f")")
                    .fontWeight(.semibold)
                    .foregroundColor(.secondary)
            }
            .padding(.leading)
        }
    }
}

struct AppetizerCard_Previews: PreviewProvider {
    static var previews: some View {
        AppetizerCard(appetizer: MockData.sample)
    }
}
