//
//  AddViewController.swift
//  DanggeunMarket
//
//  Created by 양유진 on 2021/09/23.
//

import UIKit

class AddViewController: UIViewController, UITextViewDelegate{

    @IBOutlet weak var albumBtn: UIButton!
    @IBOutlet weak var productImg: UIImageView!
    @IBOutlet weak var infoTextField: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()

        albumBtn.layer.borderColor = UIColor.gray.cgColor
        albumBtn.layer.borderWidth = 0.3
        albumBtn.layer.cornerRadius = 5
        

        infoTextField.delegate = self
        infoTextField.isScrollEnabled = false
        textViewDidChange(infoTextField)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.tabBarController?.tabBar.isHidden = true
    }
    
    func textViewDidChange(_ textView: UITextView) {

        let size = CGSize(width: view.frame.width, height: .infinity)
        let estimatedSize = textView.sizeThatFits(size)
        textView.constraints.forEach { (constraint) in
            if constraint.firstAttribute == .height {
                constraint.constant = estimatedSize.height
            }
        }
    }
    
}

