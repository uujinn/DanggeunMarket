//
//  ViewController.swift
//  DanggeunMarket
//
//  Created by 양유진 on 2021/09/20.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var topView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // simulator를 위한 로그아웃
        UserDefaultsKey.isLoggedIn = false
        
        // addButton UI Custom
        addButton.layer.cornerRadius = 0.5 * addButton.bounds.size.width
        addButton.backgroundColor = UIColor(red: 255/255, green: 138/255, blue: 61/255, alpha: 1)
        addButton.titleLabel?.textColor = .white
    }


}

