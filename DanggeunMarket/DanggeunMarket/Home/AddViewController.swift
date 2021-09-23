//
//  AddViewController.swift
//  DanggeunMarket
//
//  Created by 양유진 on 2021/09/23.
//

import UIKit

class AddViewController: UIViewController, UITextViewDelegate{

    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var albumBtn: UIButton!
    @IBOutlet weak var priceTextField: UITextField!
    @IBOutlet weak var productImg: UIImageView!
    @IBOutlet weak var infoTextField: UITextView!
    
    let p = product.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()

        infoTextField.delegate = self
        infoTextField.isScrollEnabled = false

        priceTextField.addLeftPadding()
        titleTextField.addLeftPadding()
        
        textViewCustom(tv: infoTextField)
            
        
        placeholderSetting()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.tabBarController?.tabBar.isHidden = true
    }
    
    // 완료 버튼
    @IBAction func completedAdd(_ sender: Any) {
        print("goback")
        self.navigationController?.popViewController(animated: true)
    }
    
    
    // Placeholder 설정
    func placeholderSetting() {
 
        infoTextField.delegate = self
        infoTextField.text = "여의동에 올릴 게시글 내용을 작성해주세요.(가품 및 판매금지품목은 게시가 제한될 수 있어요."
        infoTextField.textColor = UIColor.lightGray

    }
    
    
    // TextView Place Holder
    func textViewDidBeginEditing(_ textView: UITextView) {

        if infoTextField.textColor == UIColor.lightGray {
            infoTextField.text = nil
            infoTextField.textColor = UIColor.black
        }

    }
    
    // TextView Place Holder
    func textViewDidEndEditing(_ textView: UITextView) {

        if infoTextField.text.isEmpty {
            infoTextField.text = "여의동에 올릴 게시글 내용을 작성해주세요.(가품 및 판매금지품목은 게시가 제한될 수 있어요."
            infoTextField.textColor = UIColor.lightGray
        }

    }
    
    func textViewCustom(tv: UITextView){
        // 텍스트뷰 배경 white로 고정
        tv.backgroundColor = UIColor.white
        
        // 텍스트뷰 Padding
        tv.textContainerInset = UIEdgeInsets(top: 25, left: 15, bottom: 15, right: 15);
    }
    
    func viewCustom(view: AnyObject){
        view.layer.borderColor = UIColor(red: 0.5, green: 0.5, blue: 0.5, alpha: 0.2).cgColor
        view.layer.borderWidth = 0.5
    }
    
    func buttonCustom(btn: UIButton){
        btn.layer.borderColor = UIColor(red: 0.5, green: 0.5, blue: 0.5, alpha: 0.2).cgColor
        btn.layer.borderWidth = 0.3
        btn.layer.cornerRadius = 5
    }
}

extension UITextField {
  func addLeftPadding() {
    let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: self.frame.height))
    self.leftView = paddingView
    self.leftViewMode = ViewMode.always
  }
}
