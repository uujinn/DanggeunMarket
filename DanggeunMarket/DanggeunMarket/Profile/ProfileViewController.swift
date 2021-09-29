//
//  ProfileViewController.swift
//  DanggeunMarket
//
//  Created by 양유진 on 2021/09/30.
//

import UIKit

class ProfileViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var profileView: UIView!
    @IBOutlet weak var IDLabel: UILabel!
    @IBOutlet weak var LocationLabel: UILabel!
    @IBOutlet weak var profileImg: UIImageView!
    @IBOutlet weak var tableView: UITableView!
    
    let cellIdentifier: String = "myCell"

    let first: [String] = ["내 동네 설정", "동네 인증하기", "키워드 알림", "모아보기", "관심 카테고리 설정"]
    let second: [String] = ["동네생활 글", "동네생활 댓글", "동네 생활 주제 목록"]
    let third: [String] = ["비즈프로필 만들기", "동네홍보 글", "지역광고"]
    let fourth: [String] = ["친구초대", "당근마켓 공유", "공지사항", "자주 묻는 질문", "앱 설정"]
    override func viewDidLoad() {
        setView()

        
        self.tableView.delegate = self
        self.tableView.dataSource = self
    }
    
    func setView(){
        profileView.layer.borderColor = UIColor(red: 0.5, green: 0.5, blue: 0.5, alpha: 0.5).cgColor
        profileView.layer.borderWidth = 0.3
        profileImg.layer.cornerRadius = profileImg.frame.height / 2
        profileImg.layer.masksToBounds = true
        profileImg.layer.borderWidth = 0
        
        IDLabel.text = UserDefaults.standard.value(forKey: "ID") as! String
        LocationLabel.text = UserDefaults.standard.value(forKey: "Location") as! String
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 4  // 두개의 섹션을 사용할 것
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {  // 각 섹션마다 다른 갯수를 돌려줄 것
        case 0:  // tableView의 section은 0부터 시작
            return first.count  // 한글 array의 갯수만큼 돌려줌
        case 1:
            return second.count  // 영어 array의 갯수만큼 돌려줌
        case 2:
            return third.count
        case 3:
            return fourth.count
        default:
            return 0
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: self.cellIdentifier, for: indexPath)
        var text: String = ""
        
        if indexPath.section == 0 {
            text = first[indexPath.row]
        }else if indexPath.section == 1{
            text = second[indexPath.row]
        }else if indexPath.section == 2{
            text = third[indexPath.row]
        }else if indexPath.section == 3{
            text = fourth[indexPath.row]
        }
//        indexPath.section == 0 ? first[indexPath.row] : second[indexPath.row]
        cell.textLabel?.text = text  // 셀에 표현될 데이터

        return cell
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return ""
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {

        return section == 0 ? 15 : 5
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        // footer 영역 크기 = 12 (마지막 section의 footer 크기는 0)

        return section == 3 ? 0 : 12
    }
    
}
