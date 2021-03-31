//
//  AquaButton.swift
//  AquaUI
//
//  Created by Avery Pierce on 3/26/21.
//

import SwiftUI

struct AquaButton: View {
    let primary: Bool
    let text: LocalizedStringKey
    
    init(primary: Bool = false, text: LocalizedStringKey) {
        self.primary = primary
        self.text = text
    }
    
    var body: some View {
        Text(text)
            .font(Font.system(size: 13.0).weight(.medium))
            .shadow(color: Color.black.opacity(0.4), radius: 1, y:2)
            .padding(.vertical, 2)
            .padding(.horizontal)
            .frame(minWidth: 70.0)
            .background(AquaGelTexture(primary: primary))
            .mask(RoundedRectangle(cornerRadius: 25.0))
            .shadow(color: .black, radius: 2, x: 0.0, y: 1.0)
    }
}

struct AquaButton_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            HStack {
                Image("SaveButtonOriginal").padding(.top, 1)
                AquaButton(primary: true, text: "Save")
            }
            HStack {
                Image("CancelButtonOriginal").padding(.top, 2)
                AquaButton(text: "Cancel")
            }
        }
        .padding()
        .background(AquaStripeBackground())
        .previewLayout(.sizeThatFits)
        .accentColor(Color.blue.offset(saturation: -0.5, brightness: 0.1))
    }
}

let lucida = UIFont(name: "Lucida Grande", size: 10.0)
