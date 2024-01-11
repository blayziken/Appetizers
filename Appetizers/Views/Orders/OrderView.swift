//
//  OrderView.swift
//  Appetizers
//
//  Created by Blaze on 16/12/2023.
//

import SwiftUI

struct OrderView: View {
    
    @EnvironmentObject var order: Order
    
    var body: some View {
        NavigationView {
            ZStack {
                VStack{
                    List {
                        ForEach(order.items) { appetizer in
                            AppetizerCard(appetizer: appetizer)
                                .listRowSeparator(.hidden)

                        }
                        .onDelete(perform: order.deleteItems)
                    }
                    .listStyle(PlainListStyle())
                    
                    Spacer()
                    
                    Button {
                        
                    }label: {
                        
                        Text("$\(order.totalPrice, specifier: "%.2f") - Place Order")
                    }
                    .buttonStyle(.borderedProminent)
                    .controlSize(.large)
                    .padding(.bottom, 30)
                    
                }
                
                if(order.items.isEmpty) {
                    EmptyState(imageName: "empty-order",
                               message: "You have no items in your order.\nPlease add an appetizer!")
                }
            }
            .navigationTitle("Orders 📋")
        }
        
    }
}

struct OrderView_Previews: PreviewProvider {
    static var previews: some View {
        OrderView()
            .environmentObject(Order())
    }
}
