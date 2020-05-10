//
//  ItemCell.swift
//  MiPet
//
//  Created by MinKo on 5/9/20.
//  Copyright © 2020 MinKo. All rights reserved.
//

import UIKit

class ItemCell: UICollectionViewCell {

    @IBOutlet weak var imageItem: UIImageView!
    @IBOutlet weak var labelItem: UILabel!
    @IBOutlet weak var viewContentDtail: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        viewContentDtail.radiusAndShawDown()
    }
    
    func setupView(label: String = "", image: UIImage? = UIImage(named: "header_cat")){
        labelItem.text = label
        imageItem.image = image
    }
    
    func setTypesCat(type: TypeCats){
        labelItem.text = type.name
        imageItem.image = UIImage(named: "\(type.thumnail)")
    }

    func setHealthyCat(type: Healthy){
        labelItem.text = type.name
        imageItem.image = UIImage(named: "\(type.thumnail)")
    }

    func setMatching(type: MatchingCat){
        labelItem.text = type.name
        imageItem.image = UIImage(named: "\(type.thumnail)")
    }

    func setEat(type: Eat){
        labelItem.text = type.name
        imageItem.image = UIImage(named: "\(type.thumnail)")
    }

}
