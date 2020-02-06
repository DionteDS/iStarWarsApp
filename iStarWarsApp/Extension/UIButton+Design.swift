//
//  UIButton+Design.swift
//  iStarWarsApp
//
//  Created by Dionte Silmon on 2/5/20.
//  Copyright © 2020 Dionte Silmon. All rights reserved.
//

import Foundation
import UIKit

extension UIButton {
    
    func designButton(borderWidth: CGFloat = 1, borderColor: UIColor = .black) {
        layer.cornerRadius = frame.height / 2
        clipsToBounds = true
        
        layer.borderWidth = borderWidth
        layer.borderColor = borderColor.cgColor
    }
    
    // Add puluse affect to the log in button
    func pulse() {
        
        let pulse = CASpringAnimation(keyPath: "transform.scale")
        pulse.duration = 0.5
        pulse.fromValue = 0.95
        pulse.toValue = 1.0
        pulse.autoreverses = true
        pulse.repeatCount = 1
        pulse.initialVelocity = 0.5
        pulse.damping = 1.0
        
        layer.add(pulse, forKey: nil)
    }
    
}
