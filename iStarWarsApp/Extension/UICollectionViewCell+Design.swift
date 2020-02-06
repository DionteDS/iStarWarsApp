//
//  UICollectionView+Design.swift
//  iStarWarsApp
//
//  Created by Dionte Silmon on 2/6/20.
//  Copyright © 2020 Dionte Silmon. All rights reserved.
//

import Foundation
import UIKit

extension UICollectionViewCell {
    
    func designBorderBackground(radius: CGFloat = 10, borderColor: UIColor = .black, shadowColor: UIColor = .black) {
        
        // Create the border
        contentView.layer.cornerRadius = radius
        contentView.layer.borderWidth = 2
        contentView.layer.borderColor = borderColor.cgColor
        contentView.layer.masksToBounds = true
        
        
        // Create the shadow affects
        layer.shadowColor = shadowColor.cgColor
        layer.shadowOffset = CGSize(width: 3, height: 3)
        layer.shadowRadius = 5
        layer.shadowOpacity = 1
        layer.masksToBounds = false
        layer.shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: radius).cgPath
        layer.cornerRadius = radius
        
    }
    
}
