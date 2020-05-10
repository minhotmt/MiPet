//
//  AboutUsCell.swift
//  MiPet
//
//  Created by MinKo on 5/9/20.
//  Copyright © 2020 MinKo. All rights reserved.
//

import UIKit

class AboutUsCell: UITableViewCell {

    @IBOutlet weak var labelInfo: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setupView(info: String = "Meo meo"){
        labelInfo.text = info
    }
    
}
