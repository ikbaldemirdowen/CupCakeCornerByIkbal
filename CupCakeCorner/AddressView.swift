//
//  AddressView.swift
//  CupCakeCorner
//
//  Created by Ikbal Demirdoven on 2023-05-20.
//

import SwiftUI

struct AddressView: View {
    @ObservedObject var order : Order
    var body: some View {
        Form
        {
            Section
            {
                TextField("Name", text: $order.name)
                TextField("Street Address", text: $order.streetName)
                TextField("City", text: $order.city)
                TextField("Zip", text: $order.zip)
            }
            
            Section
            {
                NavigationLink
                {
                    CheckoutView(order: order)
                } label: {
                    Text("Checkout")
                }
                .disabled(!order.hasValidAddress)
            }
        }
        .navigationTitle("Delivery Details")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct AddressView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack
        {
            AddressView(order: Order())
        }
    }
}
