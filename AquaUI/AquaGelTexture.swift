//
//  AquaGelTexture.swift
//  AquaUI
//
//  Created by Avery Pierce on 3/31/21.
//

import SwiftUI

struct AquaGelTexture: View {
    let primary: Bool
    init(primary: Bool = false) {
        self.primary = primary
    }
    
    var body: some View {
        ZStack {
            backgroundColor
            LinearGradient(
                gradient: Gradient(colors: [
                    backgroundColor
                        .offset(brightness: -0.5)
                        .scale(saturation: 4),
                    backgroundColor.opacity(0.4),
                    backgroundColor.offset(saturation: -0.5, brightness: 0.9)
                ]),
                startPoint: .top,
                endPoint: .bottom
            )
            RadialGradient(
                gradient: Gradient(colors: [
                                    backgroundColor
                                        .offset(brightness: -1)
                                        .scale(saturation: 4),
                                    .clear]),
                center: .bottom,
                startRadius: 60,
                endRadius: 45
            )
            .padding(.bottom, -20)
            .blur(radius: 3)
            
            VStack {
                RoundedRectangle(cornerRadius: 3)
                    .fill(backgroundColor.offset(saturation: -0.8, brightness: 0.2).opacity(0.8))
                    .padding(.top, 1)
                    .padding(.horizontal, 5.5)
                    .frame(height: 7)
                    .blur(radius: 1.0)
                Spacer()
            }
        }
    }
    
    var backgroundColor: Color {
        primary ? Color.accentColor : Color(white: 0.8, opacity: 1.0)
    }
}

struct AquaGelTexture_Previews: PreviewProvider {
    static var previews: some View {
        AquaGelTexture(primary: true)
            .frame(width: 80, height: 20, alignment: .center)
            .mask(RoundedRectangle(cornerRadius: 25.0))
            .shadow(color: .black, radius: 2, x: 0.0, y: 1.0)
            .padding()
            .previewLayout(.sizeThatFits)
    }
}
