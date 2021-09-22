//
//  DetailViewController.swift
//  DanggeunMarket
//
//  Created by 양유진 on 2021/09/22.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var profileImg: UIImageView!
    var index = 0

    override func viewDidLoad() {
        super.viewDidLoad()
//        
//        self.navigationController?.navigationBar.backItem?.titleView?.tintColor = .black
        
        print(index)
        
        profileImg.layer.cornerRadius = profileImg.frame.height/2
        profileImg.clipsToBounds = true

    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.tabBarController?.tabBar.isHidden = true
    }

}
