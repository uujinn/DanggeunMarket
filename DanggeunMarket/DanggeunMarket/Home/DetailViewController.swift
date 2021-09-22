//
//  DetailViewController.swift
//  DanggeunMarket
//
//  Created by 양유진 on 2021/09/22.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var profileImg: UIImageView!
    let index = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        profileImg.layer.cornerRadius = profileImg.frame.height/2
        profileImg.clipsToBounds = true
        profileImg.layer.borderColor = UIColor.gray
        profileImg.layer.borderWidth = 1
    }
    


}
