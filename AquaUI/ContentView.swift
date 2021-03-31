//
//  ContentView.swift
//  AquaUI
//
//  Created by Avery Pierce on 3/26/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("Hello, Aqua!")
            Spacer()
            HStack(spacing: 14) {
                Spacer()
                AquaButton(text: "Cancel")
                AquaButton(primary: true, text: "OK")
            }
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(AquaStripeBackground().ignoresSafeArea())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .accentColor(.aqua)
    }
}
