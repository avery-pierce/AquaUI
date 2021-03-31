//
//  ColorExtension.swift
//  AquaUI
//
//  Created by Avery Pierce on 3/26/21.
//

import Foundation
import UIKit
import SwiftUI

extension Color {
    public func lighter(by amount: CGFloat = 0.2) -> Self { Self(UIColor(self).lighter(by: amount)) }
    public func darker(by amount: CGFloat = 0.2) -> Self { Self(UIColor(self).darker(by: amount)) }
    
    public func offset(hue: CGFloat = 0, saturation: CGFloat = 0, brightness: CGFloat = 0, alpha: CGFloat = 0) -> Self {
        Self(UIColor(self).offset(hue: hue, saturation: saturation, brightness: brightness, alpha: alpha))
    }
    public func scale(hue: CGFloat = 1, saturation: CGFloat = 1, brightness: CGFloat = 1, alpha: CGFloat = 1) -> Self {
        Self(UIColor(self).scale(hue: hue, saturation: saturation, brightness: brightness, alpha: alpha))
    }
}

extension UIColor {
    func mix(with color: UIColor, amount: CGFloat) -> Self {
        var red1: CGFloat = 0
        var green1: CGFloat = 0
        var blue1: CGFloat = 0
        var alpha1: CGFloat = 0
        
        var red2: CGFloat = 0
        var green2: CGFloat = 0
        var blue2: CGFloat = 0
        var alpha2: CGFloat = 0

        getRed(&red1, green: &green1, blue: &blue1, alpha: &alpha1)
        color.getRed(&red2, green: &green2, blue: &blue2, alpha: &alpha2)
        
        return Self(
            red: red1 * CGFloat(1.0 - amount) + red2 * amount,
            green: green1 * CGFloat(1.0 - amount) + green2 * amount,
            blue: blue1 * CGFloat(1.0 - amount) + blue2 * amount,
            alpha: alpha1
        )
    }
    
    public func offset(hue: CGFloat = 0, saturation: CGFloat = 0, brightness: CGFloat = 0, alpha: CGFloat = 0) -> Self {
        var h: CGFloat = 0, s: CGFloat = 0, b: CGFloat = 0, a: CGFloat = 0
        if self.getHue(&h, saturation: &s, brightness: &b, alpha: &a) {
            let resultH = (h + hue).constrainedTo(min: 0, max: 1)
            let resultS = (s + saturation).constrainedTo(min: 0, max: 1)
            let resultB = (b + brightness).constrainedTo(min: 0, max: 1)
            let resultA = (a + alpha).constrainedTo(min: 0, max: 1)
            return Self(hue: resultH, saturation: resultS, brightness: resultB, alpha: resultA)
        }
        return self
    }
    public func scale(hue: CGFloat = 1, saturation: CGFloat = 1, brightness: CGFloat = 1, alpha: CGFloat = 1) -> Self {
        var h: CGFloat = 0, s: CGFloat = 0, b: CGFloat = 0, a: CGFloat = 0
        if self.getHue(&h, saturation: &s, brightness: &b, alpha: &a) {
            let resultH = (h * hue).constrainedTo(min: 0, max: 1)
            let resultS = (s * saturation).constrainedTo(min: 0, max: 1)
            let resultB = (b * brightness).constrainedTo(min: 0, max: 1)
            let resultA = (a * alpha).constrainedTo(min: 0, max: 1)
            return Self(hue: resultH, saturation: resultS, brightness: resultB, alpha: resultA)
        }
        return self
    }
    
    func lighter(by amount: CGFloat = 0.2) -> Self { mix(with: .white, amount: amount) }
    func darker(by amount: CGFloat = 0.2) -> Self { mix(with: .black, amount: amount) }
}

extension Comparable {
    func constrainedTo(min: Self, max: Self) -> Self {
        if self < min {
            return min
        }
        if self > max {
            return max
        }
        return self
    }
}
