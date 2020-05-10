//
//  ListMenuVC.swift
//  MiPet
//
//  Created by MinKo on 5/24/20.
//  Copyright © 2020 MinKo. All rights reserved.
//

import UIKit

class ListMenuVC: UIViewController {

    @IBOutlet weak var collectionItem: UICollectionView!
    @IBOutlet weak var headerView: UIView!
    @IBOutlet weak var labelTitle: UILabel!
    
    var typeMenu: TypeMenu = .TypeCat {
        didSet {
            getData()
            if let collectionItem = collectionItem {
                collectionItem.reloadData()
            }
        }
    }
    
    var listTypeCat: [TypeCats] = []
    var healthys: [Healthy] = []
    var matchings: [MatchingCat] = []
    var eats: [Eat] = []
    var titleLabel: String = ""
    
    func getData(){
        switch typeMenu {
        case .TypeCat:
            listTypeCat = HomeVC.readJson(type: .TypeCat) as! [TypeCats]
        case .Healthy:
            healthys = HomeVC.readJson(type: .Healthy) as! [Healthy]
        case .Matching:
            matchings = HomeVC.readJson(type: .Matching) as! [MatchingCat]
        case .Eat:
            eats = HomeVC.readJson(type: .Eat) as! [Eat]
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initCollectionView()
    }
    
    func initCollectionView(){
        collectionItem.delegate = self
        collectionItem.dataSource = self
        collectionItem.register(UINib(nibName: "ItemCell", bundle: nil), forCellWithReuseIdentifier: "ItemCell")
        labelTitle.text = titleLabel
    }
    
    @IBAction func backAction(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}

extension ListMenuVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch typeMenu {
        case .TypeCat:
            return listTypeCat.count
        case .Eat:
            return eats.count
        case .Matching:
            return matchings.count
        case .Healthy:
            return healthys.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ItemCell", for: indexPath) as! ItemCell
        switch typeMenu {
        case .TypeCat:
            cell.setTypesCat(type: listTypeCat[indexPath.row])
        case .Eat:
            cell.setEat(type: eats[indexPath.row])
        case .Matching:
            cell.setMatching(type: matchings[indexPath.row])
        case .Healthy:
            cell.setHealthyCat(type: healthys[indexPath.row])
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = DetaiInfomationVC()
        vc.typeMenu = typeMenu
        switch typeMenu {
        case .TypeCat:
            vc.model = listTypeCat[indexPath.row]
            vc.titleCat = listTypeCat[indexPath.row].name
        case .Eat:
            vc.model = eats[indexPath.row]
            vc.titleCat = eats[indexPath.row].name
        case .Matching:
            vc.model = matchings[indexPath.row]
            vc.titleCat = matchings[indexPath.row].name
        case .Healthy:
            vc.model = healthys[indexPath.row]
            vc.titleCat = healthys[indexPath.row].name
        }
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true, completion: nil)
    }
        
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (UIScreen.main.bounds.width - 50) / 3, height: 150)
    }
    
}
