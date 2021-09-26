//
//  SearchViewController.swift
//  DanggeunMarket
//
//  Created by 양유진 on 2021/09/26.
//

import UIKit

class SearchViewController: UIViewController{
    

    @IBOutlet weak var tableView: UITableView!
    
    let p = product.shared
    var filteredArr: [String] = []
    var titleArr: [String] = []
    var imgArr: [UIImage] = []
    var locationArr: [String] = []
    var priceArr: [Int] = []
    var idx = 0
    
    var isFiltering: Bool {
        let searchController = self.navigationItem.searchController
        let isActive = searchController?.isActive ?? false
        let isSearchBarHasText = searchController?.searchBar.text?.isEmpty == false
        return isActive && isSearchBarHasText
    }
    
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

        for i in 0..<p.productArray.count{
            titleArr.append(p.productArray[i].productTitle)
            imgArr.append(p.productArray[i].productImage)
            locationArr.append(p.productArray[i].location)
            priceArr.append(p.productArray[i].price)
        }
        
        setupSearchController()
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let detailVC = segue.destination as? DetailViewController else {return}
        for i in 0..<titleArr.count{
            if self.isFiltering && titleArr[i] == filteredArr[tableView.indexPathForSelectedRow!.row]{ // 검색한 상태
                idx = i
                print(i)
            } else if !self.isFiltering{ // 검색 안한 상태
                idx = tableView.indexPathForSelectedRow!.row
            }
        }
        print("idx: \(idx)")
        detailVC.index = idx
    }
    
    func setupSearchController() {
        let searchController = UISearchController(searchResultsController: nil)
        searchController.searchBar.placeholder = "원하시는 상품을 검색해보세요."
        searchController.hidesNavigationBarDuringPresentation = false
        
        searchController.searchResultsUpdater = self
        
        self.navigationItem.searchController = searchController
        self.navigationItem.title = "검색"
        self.navigationItem.hidesSearchBarWhenScrolling = false
    }

}

extension SearchViewController: UISearchResultsUpdating {
    
    func updateSearchResults(for searchController: UISearchController) {
        guard let text = searchController.searchBar.text?.lowercased() else { return }
        self.filteredArr = self.titleArr.filter { $0.lowercased().contains(text) }
        self.tableView.reloadData()
    }
}

extension SearchViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return self.arr.count
        return self.isFiltering ? self.filteredArr.count : self.titleArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HomeTableViewCell", for: indexPath) as! HomeTableViewCell
        
        if self.isFiltering{
            cell.productTitleLabel.text = filteredArr[indexPath.row]
            for i in 0..<titleArr.count{
                if titleArr[i] == filteredArr[indexPath.row]{
                    idx = i
                }
            }
            cell.productImage.image = imgArr[idx]
            cell.locationLabel.text = locationArr[idx]
            cell.priceLabel.text = "\(priceArr[idx])원"
        }else{
            cell.productImage.image = p.productArray[indexPath.row].productImage
            cell.productTitleLabel.text = p.productArray[indexPath.row].productTitle
            cell.locationLabel.text = p.productArray[indexPath.row].location
            cell.priceLabel.text = "\(p.productArray[indexPath.row].price)원"
        }

        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "showSearch", sender: self)
    }
}
