//
//  InformationVC.swift
//  MiPet
//
//  Created by MinKo on 5/9/20.
//  Copyright © 2020 MinKo. All rights reserved.
//

import UIKit
import MXParallaxHeader

class InformationVC: UIViewController {

    @IBOutlet weak var tableview: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
    }
    
    
    func setupTableView(){
        tableview.delegate = self
        tableview.dataSource = self
        let headerView = UIImageView()
        headerView.image = UIImage(named: "header_cat")
        headerView.contentMode = .scaleAspectFill
        tableview.parallaxHeader.view = headerView
        tableview.parallaxHeader.height = 250
        tableview.parallaxHeader.mode = .fill
        tableview.parallaxHeader.minimumHeight = 20
        tableview.register(UINib(nibName: "AboutUsCell", bundle: nil), forCellReuseIdentifier: "AboutUsCell")
        
    }
}

extension InformationVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AboutUsCell", for: indexPath) as! AboutUsCell
        cell.setupView(info: "Ứng dụng là cẩm nang chăm sóc những chú mèo của bạn\nỨng dụng gốm thông tin :\nCác bệnh lí phổ biến và cách chữa\nCác nhận biết, bảng màu các loại mèo\nCách phối giống phổ biến\nCác cách cho ăn bình thường và khi bầu, mèo con, mèo trưởng thành, mèo bầu, tiêm vắc xin\n\nSinh Viên thực tập: Nguyễn Văn Minh\n MSV: 1553659\n Lớp: 59PM1\nNguồn tham khảo thông tin: \n https://meowwoof.vn \n http://pet247.vn ")
        return cell
    }
}
