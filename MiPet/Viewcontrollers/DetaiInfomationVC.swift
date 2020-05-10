//
//  DetaiInfomationVC.swift
//  MiPet
//
//  Created by MinKo on 5/9/20.
//  Copyright © 2020 MinKo. All rights reserved.
//

import UIKit
import MXParallaxHeader

class DetaiInfomationVC: UIViewController {
    
    @IBOutlet weak var tableview: UITableView!
    @IBOutlet weak var labelTitle: UILabel!
    
    var typeMenu: TypeMenu = .TypeCat
    var model: Any? {
        didSet {
            guard let tableview = tableview  else {
                return
            }
            tableview.reloadData()
        }
    }
    
    var titleCat: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
    }
    
    
    @IBAction func closeAction(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    func setupTableView(){
        tableview.delegate = self
        tableview.dataSource = self
        tableview.register(UINib(nibName: "AboutUsCell", bundle: nil), forCellReuseIdentifier: "AboutUsCell")
        tableview.register(UINib(nibName: "SlideShowCell", bundle: nil), forCellReuseIdentifier: "SlideShowCell")
        labelTitle.text = titleCat
    }
    
}

extension DetaiInfomationVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AboutUsCell", for: indexPath) as! AboutUsCell
        let slidesCell = tableView.dequeueReusableCell(withIdentifier: "SlideShowCell", for: indexPath) as! SlideShowCell
        if indexPath.row == 0 {
            slidesCell.viewController = self
            switch typeMenu {
            case .TypeCat:
                if let model = model {
                    let data = model as! TypeCats
                    slidesCell.listImage = data.image
                }
            case .Healthy:
                if let model = model {
                    let data = model as! Healthy
                    slidesCell.listImage = data.image
                }
            case .Matching:
                if let model = model {
                    let data = model as! MatchingCat
                    slidesCell.listImage = data.image
                }
            case .Eat:
                if let model = model {
                    let data = model as! Eat
                    slidesCell.listImage = data.image
                }
            }
            return slidesCell
        } else if indexPath.row == 1 {
            switch typeMenu {
            case .TypeCat:
                if let model = model {
                    let data = model as! TypeCats
                    cell.setupView(info: data.title )
                }
            case .Healthy:
                if let model = model {
                    let data = model as! Healthy
                    cell.setupView(info: data.bieuhien )
                }
            case .Matching:
                if let model = model {
                    let data = model as! MatchingCat
                    cell.setupView(info: data.how )
                }
            case .Eat:
                if let model = model {
                    let data = model as! Eat
                    cell.setupView(info: data.how )
                }
            }
        } else {
            switch typeMenu {
            case .TypeCat:
                if let model = model {
                    let data = model as! TypeCats
                    cell.setupView(info: data.descripton)
                }
            case .Healthy:
                if let model = model {
                    let data = model as! Healthy
                    cell.setupView(info: data.fix )
                }
            default:
                break
            }
            
        }
        return cell
    }
}
