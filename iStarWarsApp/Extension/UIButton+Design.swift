//
//  UIButton+Design.swift
//  iStarWarsApp
//
//  Created by Dionte Silmon on 2/5/20.
//  Copyright © 2020 Dionte Silmon. All rights reserved.
//

import UIKit

extension UIButton {
    
    func designButton(borderWidth: CGFloat = 1, borderColor: UIColor = .black) {
        layer.cornerRadius = frame.height / 2
        clipsToBounds = true
        
        layer.borderWidth = borderWidth
        layer.borderColor = borderColor.cgColor
    }
    
}
