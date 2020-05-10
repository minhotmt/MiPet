//
//  NewsVC.swift
//  MiPet
//
//  Created by MinhNV-GD on 5/29/20.
//  Copyright © 2020 MinKo. All rights reserved.
//

import UIKit

class NewsVC: UIViewController {

    @IBOutlet weak var webView: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initWeb()
    }
    
    func initWeb(){
       let url = URL(string: "https://kenh14.vn/meo-con.html")!
        webView.loadRequest(URLRequest(url: url))
    }

}
