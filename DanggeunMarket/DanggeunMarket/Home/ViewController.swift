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
    

    struct productInfo{
        var id: String
        var productImage: UIImage
        var productTitle: String = ""
        var price: Int = 0
        var location: String = ""
        var info: String = ""
        var date: String = ""
//        init?(string: String){
//            let df = DateFormatter()
//            let date = Date()
//            df.dateStyle = .medium
//            df.timeStyle = .medium
//            df.locale = Locale(identifier: "ko_KR")
//            df.dateFormat = "YY년 M월 d일 h시 mm분 ss초"
//            print(df.string(from: date))
//        }
    }
    
    var productArray: [productInfo] = [
        productInfo(id: "화이팅", productImage: UIImage(named: "kal.jpg")! , productTitle: "칼하트 후드집업" , price: 40000, location: "당산동", info: "사이즈는 XL입니다. 상태는 최상입니다.", date: "21년 9월 20일 2시 20분 41초"),
        productInfo(id: "야니", productImage: UIImage(named: "tumb.jpg")! , productTitle: "스타벅스 텀블러 (미사용)" , price: 50000, location: "여의도동", info: "스타벅스 미니 콜라보 투고 텀블러입니다.", date: "21년 9월 20일 2시 20분 41초"),
        productInfo(id: "민", productImage: UIImage(named: "xs.jpeg")! , productTitle: "아이폰 XS 64GB 스페이스 그레이 팔아요" , price: 320000, location: "양평동", info: "연락주세요.", date: "21년 9월 20일 2시 25분 55초"),
        productInfo(id: "도비", productImage: UIImage(named: "ably.jpg")! , productTitle: "에이블리 얇은 크롭 가디건" , price: 7000, location: "구로구", info: "여름 옷 정리하려고 팔아요! 원가 14800원입니다!", date: "21년 9월 20일 2시 20분 41초"),
        productInfo(id: "영화보러갈꺼야", productImage: UIImage(named: "key.jpg")! , productTitle: "로지텍 블루투스 키보드 k480" , price: 20000, location: "동작구 신대방제1동", info: "이틀사용했고 이상없습니다", date: "21년 9월 20일 2시 20분 41초")
    ]
    
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
        
        print(productArray.count)
        
//        //In ViewDidLoad
//        conversationTableView.transform = CGAffineTransform(rotationAngle: -(CGFloat)(Double.pi));
//
//        //In cellForRowAtIndexPath
//        cell.transform = CGAffineTransform(rotationAngle: CGFloat(Double.pi));
        
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
        print("Clicked")
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource{
    
    // 테이블 뷰 셀의 갯수
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.productArray.count
    }
    
    // 각 셀에 대한 설정
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HomeTableViewCell", for: indexPath) as! HomeTableViewCell
        
        cell.productImage.image = productArray[indexPath.row].productImage
        cell.productTitleLabel.text = productArray[indexPath.row].productTitle
        cell.locationLabel.text = productArray[indexPath.row].location
        cell.priceLabel.text = "\(productArray[indexPath.row].price)원"
        
        return cell
    }
    
}
