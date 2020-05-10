//
//  HomeVC.swift
//  MiPet
//
//  Created by MinKo on 5/9/20.
//  Copyright © 2020 MinKo. All rights reserved.
//

import UIKit
import MXParallaxHeader
import RealmSwift

class HomeVC: UIViewController {

    @IBOutlet weak var header: UIView!
    @IBOutlet weak var tableview: UITableView!
    
    let listCategory: [String] = ["Các giống mèo", "Các bệnh lý thường gặp", "Lưu ý khi phối mèo", "Cách cho mèo ăn"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
    }
    
    func setupTableView(){
        tableview.delegate = self
        tableview.dataSource = self
        let headerView = UIImageView()
        headerView.image = UIImage(named: "cat_beauty")
        headerView.contentMode = .scaleAspectFill
        tableview.parallaxHeader.view = headerView
        tableview.parallaxHeader.height = 200
        tableview.parallaxHeader.mode = .fill
        tableview.parallaxHeader.minimumHeight = 20
        tableview.register(UINib(nibName: "CategoryCell", bundle: nil), forCellReuseIdentifier: "CategoryCell")
    }
}

extension HomeVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return listCategory.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryCell", for: indexPath) as! CategoryCell
        cell.viewController = self
        cell.didSelectReadMore = { [weak self] type in
            let vc = ListMenuVC()
            vc.typeMenu = type
            vc.titleLabel = self?.listCategory[indexPath.section] ?? ""
            vc.modalPresentationStyle = .fullScreen
            self?.present(vc, animated: true, completion: nil)
        }
        switch indexPath.section {
        case 0:
            cell.setupView(label: listCategory[indexPath.section], typeMenu : .TypeCat)
        case 1:
            cell.setupView(label: listCategory[indexPath.section], typeMenu : .Healthy)
        case 2:
            cell.setupView(label: listCategory[indexPath.section], typeMenu : .Matching)
        default:
            cell.setupView(label: listCategory[indexPath.section], typeMenu : .Eat)
        }
        return cell
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView.contentOffset.y >= -87 {
            UIView.animate(withDuration: 0.5) {
                self.header.alpha = 1
            }
        } else {
            UIView.animate(withDuration: 0.5) {
                self.header.alpha = 0
            }
        }
    }

}

extension HomeVC {
    public static func readJson(type: TypeMenu) -> [Any]{
        if let path = Bundle.main.path(forResource: "database", ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                let typecat = try JSONDecoder().decode(TypeCatAll.self, from: data).typecat
                let healthys = try JSONDecoder().decode(TypeHealthy.self, from: data).healthys
                let mathings = try JSONDecoder().decode(TypeMatching.self, from: data).matching
                let eats = try JSONDecoder().decode(TypeEat.self, from: data).eat
                switch type {
                case .TypeCat:
                    return typecat
                case .Healthy:
                    return healthys
                case .Matching:
                    return mathings
                case .Eat:
                    return eats
                }
            } catch {
                print("error read format data")
            }
        }
        return []
    }
}
