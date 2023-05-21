//
//  ContentView.swift
//  CupCakeCorner
//
//  Created by Ikbal Demirdoven on 2023-05-17.
//

import SwiftUI

struct ContentView: View {
    @StateObject var order = Order()
    var body: some View {
        NavigationStack
        {
            Form
            {
                Section
                {
                    Picker("Select your cake type", selection: $order.type)
                    {
                        ForEach(Order.types.indices, id: \.self)
                        {
                            Text(Order.types[$0])
                        }
                    }
                    Stepper("Number of cakes : \(order.quantity)", value: $order.quantity, in: 2...20)
                }
                
                Section
                {
                    Toggle("Any special requests?", isOn: $order.speacialRequestEnabled.animation())
                    if order.speacialRequestEnabled
                    {
                        Toggle("Add extra sprinkles", isOn: $order.addSprinkles)
                        Toggle("Add extra frosting", isOn: $order.extraFrosting)
                    }
                }
                
                Section
                {
                    NavigationLink
                    {
                        AddressView(order: order)
                    } label: {
                        Text("Delivery Details")
                    }
                }
            }
            .navigationTitle("CupCake Corner")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
