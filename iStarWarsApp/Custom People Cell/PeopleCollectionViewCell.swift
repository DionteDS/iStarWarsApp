//
//  PeopleCollectionViewCell.swift
//  iStarWarsApp
//
//  Created by Dionte Silmon on 2/11/20.
//  Copyright © 2020 Dionte Silmon. All rights reserved.
//

import UIKit

class PeopleCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var genderLbl: UILabel!
    @IBOutlet weak var birthYear: UILabel!
    @IBOutlet weak var heightLbl: UILabel!
    @IBOutlet weak var viewBg: UIView!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

}
