//
//  LocationTableViewCell.swift
//  DanggeunMarket
//
//  Created by 양유진 on 2021/09/30.
//

import UIKit

class LifeTableViewCell: UITableViewCell {
    
    @IBOutlet weak var contentlabel: UILabel!
    override class func awakeFromNib() {
        super.awakeFromNib()
        
        print("awakeFromNib()")
    }
    
}
