//
//  CustomButton.swift
//  iStarWarsApp
//
//  Created by Dionte Silmon on 2/5/20.
//  Copyright © 2020 Dionte Silmon. All rights reserved.
//

import UIKit

class CustomButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setRadiusAndShadow()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setRadiusAndShadow()
    }
    
    func setRadiusAndShadow() {
        
        layer.cornerRadius = frame.height / 2
        clipsToBounds = true
        layer.masksToBounds = false
        layer.shadowRadius = 5
        layer.shadowOpacity = 1
        layer.shadowOffset = CGSize(width: 3, height: 3)
        layer.shadowColor = UIColor.init(red: 255/255, green: 250/255, blue: 140/255, alpha: 1).cgColor
        
    }
    
}
