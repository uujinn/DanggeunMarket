//
//  ViewController.swift
//  DanggeunMarket
//
//  Created by 양유진 on 2021/09/20.
//

import UIKit
import DropDown

class ViewController: UIViewController{

    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var searchButton: UIButton!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var locationBtn: UIButton!
    
    let p = product.shared
    let dropDown = DropDown()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // simulator를 위한 로그아웃
        UserDefaultsKey.isLoggedIn = false

        dropdownset()
        
        // location Button
        locationBtn.frame = CGRect(x: 0, y: 0, width: 70, height: 50)
        
        // cell resource 파일 가져오기
        let HomeTableViewCellNib = UINib(nibName: String(describing: HomeTableViewCell.self), bundle: nil)
        
        // cell에 resource 등록
        self.tableView.register(HomeTableViewCellNib, forCellReuseIdentifier: "HomeTableViewCell")
        
        self.tableView.rowHeight = 160
        
        // 아주 중요
        self.tableView.delegate = self
        self.tableView.dataSource = self

        // 테이블뷰 구분선 통일
        tableView.separatorInset.right = 20
        tableView.separatorInset.left = 20
        
        // addButton UI Custom
        addButton.layer.cornerRadius = 0.5 * addButton.bounds.size.width
        addButton.backgroundColor = UIColor(red: 255/255, green: 138/255, blue: 61/255, alpha: 1)
        addButton.titleLabel?.textColor = .white
        
        // refreshControl()
        tableView.refreshControl = UIRefreshControl()
        tableView.refreshControl?.addTarget(self, action: #selector(didPullToRefresh), for: .valueChanged)

        UserDefaults.standard.set("여의동", forKey: "Location")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.tabBarController?.tabBar.isHidden = false
        print("viewwillAppear")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        print(p.productArray[0])
        print("viewDidAppear")
//        tableView.reloadData()
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let detailVC = segue.destination as? DetailViewController else {return}
        detailVC.index = tableView.indexPathForSelectedRow!.row
    }
    
    @objc private func didPullToRefresh(){
        print("start refresh")
        
        DispatchQueue.main.async {
            self.tableView.reloadData()
            self.tableView.refreshControl?.endRefreshing()
        }
    }
    
    // Dropdown 구현
    func dropdownset(){
        dropDown.dataSource = ["여의동","형곡1동","내 동네 설정하기"]
        dropDown.anchorView = locationBtn
        dropDown.bottomOffset = CGPoint(x: 0, y:(dropDown.anchorView?.plainView.bounds.height)!)
        dropDown.width = 200
        dropDown.textColor = UIColor.black
        dropDown.backgroundColor = UIColor.white
        dropDown.cornerRadius = 5
        dropDown.dismissMode = .onTap
        dropDown.dimmedBackgroundColor = UIColor(red: 0.5, green: 0.5, blue: 0.5, alpha: 0.5)
        dropDown.selectionAction = { [unowned self] (index: Int, item: String) in
            print("선택한 아이템 : \(item)")
            print("인덱스 : \(index)")
            locationBtn.setTitle("\(item)", for: .normal)
            self.dropDown.clearSelection()
            UserDefaults.standard.set("\(item)", forKey: "Location")
        }
    }

    @IBAction func openDropDown(_ sender: Any) {
        dropDown.show()
    }
    
    @IBAction func clickToadd(_ sender: Any) {
        performSegue(withIdentifier: "showAdd", sender: self)
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
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        performSegue(withIdentifier: "showDetail", sender: self)
//        self.navigationController!.pushViewController(detailVC, animated: true)
    }
    
}
