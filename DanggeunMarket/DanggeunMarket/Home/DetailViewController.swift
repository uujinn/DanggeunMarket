//
//  DetailViewController.swift
//  DanggeunMarket
//
//  Created by 양유진 on 2021/09/22.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var productImg: UIImageView!
    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var profileImg: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var infoLabel: UILabel!
    @IBOutlet weak var topView: UIView!
    @IBOutlet weak var bottomView: UIView!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var chatButton: UIButton!
    
    var index = 0
    let p = product.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setView()
        
        profileImg.layer.cornerRadius = profileImg.frame.height/2
        profileImg.clipsToBounds = true
        
        //        self.navigationController!.navigationBar.setBackgroundImage(UIImage(), for: .default)
        //         self.navigationController!.navigationBar.shadowImage = UIImage()
        //         self.navigationController!.navigationBar.isTranslucent = true
                

    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.tabBarController?.tabBar.isHidden = true
    }

    func setView(){
        topView.layer.borderColor = UIColor(red: 0.5, green: 0.5, blue: 0.5, alpha: 0.5).cgColor
        topView.layer.borderWidth = 0.3
        bottomView.layer.borderColor = UIColor(red: 0.5, green: 0.5, blue: 0.5, alpha: 0.5).cgColor
        bottomView.layer.borderWidth = 0.3
        
        // infoLabel Custom
        infoLabel.numberOfLines = 0

        let font = UIFont.systemFont(ofSize: 16, weight: .regular)
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = 6
        
        // 한글 줄바꿈 적용
        if #available(iOS 14.0, *) {
            paragraphStyle.lineBreakStrategy = .hangulWordPriority
        }
                
        let attributes: [NSAttributedString.Key: Any] = [
            .font: font,
            .foregroundColor: UIColor.black,
            .paragraphStyle: paragraphStyle
        ]
        infoLabel.attributedText = NSAttributedString(string: p.productArray[index].info, attributes: attributes)
        
        // Custom UIButton
        chatButton.backgroundColor = UIColor(red: 255/255, green: 138/255, blue: 61/255, alpha: 1)
        chatButton.layer.cornerRadius = 5
        
        productImg.image = p.productArray[index].productImage
        idLabel.text = p.productArray[index].id
        locationLabel.text = p.productArray[index].location
        titleLabel.text = p.productArray[index].productTitle
        infoLabel.text = p.productArray[index].info
        priceLabel.text = "\(p.productArray[index].price)원"
    }
    
}
