//
//  AquaStripeBackground.swift
//  AquaUI
//
//  Created by Avery Pierce on 3/31/21.
//

import SwiftUI

struct AquaStripeBackground: View {
    var body: some View {
        Image("AquaBackground").resizable(resizingMode: .tile)
    }
}

struct AquaStripeBackground_Previews: PreviewProvider {
    static var previews: some View {
        AquaStripeBackground()
            .previewLayout(.sizeThatFits)
            .frame(width: 100, height: 100, alignment: .center)
    }
}
