//
//  SearchViewController.swift
//  DanggeunMarket
//
//  Created by 양유진 on 2021/09/26.
//

import UIKit

class SearchViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    let p = product.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
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

        setupSearchController()
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let detailVC = segue.destination as? DetailViewController else {return}
        detailVC.index = tableView.indexPathForSelectedRow!.row
    }
    
    func setupSearchController() {
        let searchController = UISearchController(searchResultsController: nil)
        searchController.searchBar.placeholder = "원하시는 상품을 검색해보세요."
        searchController.hidesNavigationBarDuringPresentation = false
        
        self.navigationItem.searchController = searchController
        self.navigationItem.title = "근처에서 검색"
        self.navigationItem.hidesSearchBarWhenScrolling = false
    }

}
extension SearchViewController: UITableViewDelegate, UITableViewDataSource{
    
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
        performSegue(withIdentifier: "showSearch", sender: self)
    }
    
}
