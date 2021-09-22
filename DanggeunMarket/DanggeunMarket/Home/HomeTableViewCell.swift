//
//  HomeTableViewCell.swift
//  DanggeunMarket
//
//  Created by 양유진 on 2021/09/21.
//

import Foundation
import UIKit

class HomeTableViewCell: UITableViewCell{
    

    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var productTitleLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    // cell이 랜더링될 때
    override func awakeFromNib() {
        super.awakeFromNib()
        
        productImage.layer.cornerRadius = productImage.frame.width/15
        productImage.clipsToBounds = true
        print("HomeTableViewCell - awakeFromeNib() called")
        
    }
}
