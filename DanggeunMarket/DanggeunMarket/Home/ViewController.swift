//
//  ViewController.swift
//  DanggeunMarket
//
//  Created by 양유진 on 2021/09/20.
//

import UIKit

class ViewController: UIViewController{

    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var searchButton: UIButton!
    @IBOutlet weak var tableView: UITableView!
    
    let p = product.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // simulator를 위한 로그아웃
        UserDefaultsKey.isLoggedIn = false
        
        // cell resource 파일 가져오기
        let HomeTableViewCellNib = UINib(nibName: String(describing: HomeTableViewCell.self), bundle: nil)
        
        // cell에 resource 등록
        self.tableView.register(HomeTableViewCellNib, forCellReuseIdentifier: "HomeTableViewCell")
        
        self.tableView.rowHeight = 160
//        self.tableView.estimatedRowHeight = 200
        
        // 아주 중요
        self.tableView.delegate = self
        self.tableView.dataSource = self

        // addButton UI Custom
        addButton.layer.cornerRadius = 0.5 * addButton.bounds.size.width
        addButton.backgroundColor = UIColor(red: 255/255, green: 138/255, blue: 61/255, alpha: 1)
        addButton.titleLabel?.textColor = .white
        setupNavigationItems()

    }
    
    // NavigatorBar Custom
    private func setupNavigationItems() {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "여의동"
        label.textColor = .black
        label.textAlignment = .left
        navigationItem.titleView = label
        if let navigationBar = navigationController?.navigationBar {
            label.widthAnchor.constraint(equalTo: navigationBar.widthAnchor, constant: -130).isActive = true
        }
    }

    @IBAction func clickToSearch(_ sender: Any) {
//        print("Clicked")
//        p.productArray.insert(productInfo(id: "민", productImage: UIImage(named: "xs.jpeg")! , productTitle: "아이폰 XS 64GB 스페이스 그레이 팔아요" , price: 320000, location: "양평동", info: "연락주세요.", date: "21년 9월 20일 2시 25분 55초"),at: 0)
//        tableView.reloadData()
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource{
    
    // 테이블 뷰 셀의 갯수
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return p.productArray.count
    }
    
    // 각 셀에 대한 설정
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HomeTableViewCell", for: indexPath) as! HomeTableViewCell
        
        cell.productImage.image = p.productArray[indexPath.row].productImage
        cell.productTitleLabel.text = p.productArray[indexPath.row].productTitle
        cell.locationLabel.text = p.productArray[indexPath.row].location
        cell.priceLabel.text = "\(p.productArray[indexPath.row].price)원"
        
        return cell
    }
    
}
