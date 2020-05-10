//
//  HeaderView.swift
//  MiPet
//
//  Created by MinKo on 5/10/20.
//  Copyright © 2020 MinKo. All rights reserved.
//

import UIKit

class HeaderView: UIView {
    
    @IBOutlet var contentView: UIView!
    @IBOutlet weak var labelTitle: UILabel!
    
    var delegateReadMore: (()->())?
    
    var title: String = "" {
        didSet{
            labelTitle.text = title
        }
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        initSubviews()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initSubviews()
    }
    
     func initSubviews() {
        let nib = UINib(nibName: "HeaderView", bundle: nil)
        nib.instantiate(withOwner: self, options: nil)
        contentView.frame = bounds
        addSubview(contentView)
    }
    

    @IBAction func readMore(_ sender: Any) {
        delegateReadMore?()
    }
    
    func setupTitle(title: String = ""){
        labelTitle.text = title
    }

}
