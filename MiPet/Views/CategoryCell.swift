//
//  CategoryCell.swift
//  MiPet
//
//  Created by MinKo on 5/10/20.
//  Copyright © 2020 MinKo. All rights reserved.
//

import UIKit


class CategoryCell: UITableViewCell {
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var header: HeaderView!
    
    var listTypeCat: [TypeCats] = []
    var healthys: [Healthy] = []
    var matchings: [MatchingCat] = []
    var eats: [Eat] = []
    weak var viewController : UIViewController?
    
    var typeMenu: TypeMenu = .TypeCat {
        didSet {
            getData()
            collectionView.reloadData()
        }
    }
    
    var didSelectItem: ((String)->())?
    var didSelectReadMore: ((TypeMenu)->())?
    
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
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        selectionStyle = .none
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setupTableView()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    func setupView(label: String = "", typeMenu: TypeMenu = .TypeCat){
        self.header.title = label
        self.typeMenu = typeMenu
        self.collectionView.reloadData()
    }
    
    func setupTableView(){
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UINib(nibName: "ItemCell", bundle: nil), forCellWithReuseIdentifier: "ItemCell")
        header.delegateReadMore = { [weak self] in
            self?.didSelectReadMore?(self?.typeMenu ?? .TypeCat)
        }
    }
    
}

extension CategoryCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch typeMenu {
        case .TypeCat:
            return listTypeCat.count
        case .Healthy:
            return healthys.count
        case .Matching:
            return matchings.count
        case .Eat:
            return eats.count
        }
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ItemCell", for: indexPath) as! ItemCell
        switch typeMenu {
        case .TypeCat:
            cell.setTypesCat(type: listTypeCat[indexPath.row])
        case .Healthy:
            cell.setHealthyCat(type: healthys[indexPath.row])
        case .Matching:
            cell.setMatching(type: matchings[indexPath.row])
        case .Eat:
            cell.setEat(type: eats[indexPath.row])
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 90, height: 150)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = DetaiInfomationVC()
        vc.modalPresentationStyle = .fullScreen
        guard let viewController = viewController else {
            return
        }
        switch typeMenu {
        case .TypeCat:
            vc.typeMenu = .TypeCat
            vc.model = listTypeCat[indexPath.row]
            vc.titleCat = listTypeCat[indexPath.row].name
        case .Healthy:
            vc.typeMenu = .Healthy
            vc.model = healthys[indexPath.row]
            vc.titleCat = healthys[indexPath.row].name
        case .Matching:
            vc.typeMenu = .Matching
            vc.model = matchings[indexPath.row]
            vc.titleCat = matchings[indexPath.row].name
        case .Eat:
            vc.typeMenu = .Eat
            vc.model = eats[indexPath.row]
            vc.titleCat = eats[indexPath.row].name
        }
        viewController.present(vc, animated: true, completion: nil)
    }
}
