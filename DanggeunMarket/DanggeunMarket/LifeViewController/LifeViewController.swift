//
//  LifeViewController.swift
//  DanggeunMarket
//
//  Created by 양유진 on 2021/09/30.
//

import UIKit

class LifeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let contentArray = ["공군회관 앞에 타코야끼차 오늘 오나요?","주말에 카페에서 공부하시거나 자기계발 하시는 분 계신가요?\n혼자 카페에서 개인업무하려니 심심하기도해서요~\n편하게 댓글달아주세요.", "여의도 차로 5분거리 물건 옮겨주실 분 구해요.\n목화아파트에서 진주아파트 거리인데 승용차가 소형이라 옮길 짐 한개가 안들어가서요. 연락주시면 감사하겠습니다~", "대방동~신길동에서 지갑 주우신 분 없을까요... 성대 학생증 안에 있고 사례하겠습니다.", "영등포 지하상가 메이마르 옷가게 아시는 분 계신가요? 해당 제품 있는지 궁금해서 여쭤봐요.", "노량진역 근처에 뛸만한 곳 있을까요? 같이 뛰실 분도 구해요."]
    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        let LifeTableViewCellNib = UINib(nibName: "LifeTableViewCell", bundle: nil)
        self.tableView.register(LifeTableViewCellNib, forCellReuseIdentifier: "LifeTableViewCell")
        
        self.tableView.rowHeight = UITableView.automaticDimension
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
    
        // 테이블뷰 구분선 통일
        tableView.separatorInset.right = 0
        tableView.separatorInset.left = -20
    }
    

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.contentArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "LifeTableViewCell", for: indexPath) as! LifeTableViewCell
        cell.contentlabel.text = contentArray[indexPath.row]
        let style = NSMutableParagraphStyle()
        style.lineSpacing = 6
        let attributes: [NSAttributedString.Key: Any] = [
            .font: UIFont.systemFont(ofSize: 16, weight: .regular),
            .foregroundColor: UIColor.black,
            .paragraphStyle: style
        ]
        cell.contentlabel.attributedText = NSAttributedString(string: contentArray[indexPath.row], attributes: attributes)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}
