//
//  CategoryViewController.swift
//  DanggeunMarket
//
//  Created by 양유진 on 2021/09/25.
//

import UIKit

class CategoryViewController: UIViewController, UITableViewDelegate,UITableViewDataSource {


    let category = ["디지털기기","생활가전","가구/인테리어","유아동","생활/가공식품","유아도서","스포츠/레저","여성잡화","여성의류","남성패션/잡화","게임/취미","뷰티/미용","반려동물용품","도서/티켓/음반","식물","기타 중고물품","삽니다"]
    
    var completionHandler : ((String) -> (Void))?
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return category.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell =
            tableView.dequeueReusableCell(
                withIdentifier: "myCell",
                for: indexPath
            )
        
        cell.textLabel!.text = category[indexPath.row]
        
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("why")
        print(indexPath.row)
        completionHandler?(category[indexPath.row])
        self.navigationController?.popViewController(animated: true)
    }
}
