//
//  CategoryTableViewController.swift
//  DanggeunMarket
//
//  Created by 양유진 on 2021/09/25.
//

import UIKit

class CategoryTableViewController: UITableViewController {


    let category = ["디지털기기","생활가전","가구/인테리어","유아동","생활/가공식품","유아도서","스포츠/레저","여성잡화","여성의류","남성패션/잡화","게임/취미","뷰티/미용","반려동물용품","도서/티켓/음반","식물","기타 중고물품","삽니다"]
    
    override func viewDidLoad() {
        super.viewDidLoad()


    }


    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {

        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return category.count
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        cell.textLabel?.text = category[indexPath.row]
        return cell
    }

    override func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
 
        print(indexPath.row)

        print("pop")
    }
   
}
