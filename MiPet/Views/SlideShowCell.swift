//
//  SlideShowCell.swift
//  MiPet
//
//  Created by MinKo on 5/27/20.
//  Copyright © 2020 MinKo. All rights reserved.
//

import UIKit
import ImageSlideshow

class SlideShowCell: UITableViewCell {
    
    weak var viewController: UIViewController? = nil
    
    @IBOutlet weak var slideshow: ImageSlideshow!
    
    var listImage: [String] = [] {
        didSet {
            var arrImage: [BundleImageSource] = []
            for item in listImage {
                let buddle = BundleImageSource(imageString: item)
                arrImage.append(buddle)
            }
            slideshow.setImageInputs(arrImage)
        }
    }
    
//    var localSource = [BundleImageSource(imageString: "aln_1"), BundleImageSource(imageString: "aln_2"), BundleImageSource(imageString: "aln_3"), BundleImageSource(imageString: "aln_4")]
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        initView()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func initView(){
        slideshow.slideshowInterval = 5.0
        slideshow.pageIndicatorPosition = .init(horizontal: .center, vertical: .under)
        slideshow.contentScaleMode = UIViewContentMode.scaleAspectFill
        let pageControl = UIPageControl()
        pageControl.currentPageIndicatorTintColor = UIColor.lightGray
        pageControl.pageIndicatorTintColor = UIColor.black
        slideshow.pageIndicator = pageControl
        slideshow.activityIndicator = DefaultActivityIndicator()
//        var arrImage: [BundleImageSource] = []
//        for item in listImage {
//            let buddle = BundleImageSource(imageString: item)
//            arrImage.append(buddle)
//        }
//        slideshow.setImageInputs(arrImage)
//        slideshow.setImageInputs(localSource)
        let recognizer = UITapGestureRecognizer(target: self, action: #selector(SlideShowCell.didTap))
        slideshow.addGestureRecognizer(recognizer)
    }
    
    @objc func didTap() {
        let fullScreenController = slideshow.presentFullScreenController(from: viewController!)
        fullScreenController.slideshow.activityIndicator = DefaultActivityIndicator(style: .white, color: nil)
    }
}

extension SlideShowCell: ImageSlideshowDelegate {
    func imageSlideshow(_ imageSlideshow: ImageSlideshow, didChangeCurrentPageTo page: Int) {
        print("current page:", page)
    }
}
