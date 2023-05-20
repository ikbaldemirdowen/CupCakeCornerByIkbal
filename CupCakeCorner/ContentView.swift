//
//  ContentView.swift
//  CupCakeCorner
//
//  Created by Ikbal Demirdoven on 2023-05-17.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(alignment: .leading)
        {
            AsyncImage(url: URL(string: "https://hws.dev/img/bad.png"))
            { phase in
                phase
                    .resizable()
                    .scaledToFit()
                
            } placeholder: {
                ProgressView()
            }
            .frame(width: 200, height: 200)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
