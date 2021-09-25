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
    @IBOutlet weak var categoryBtn: UIButton!
    @IBOutlet weak var infoTextField: UITextView!
    
    let location = UserDefaults.standard.value(forKey: "Location") as! String
    let userID = UserDefaults.standard.value(forKey: "ID") as! String
    let p = product.shared
    var cate: String = "카테고리 선택"
    let imagePicker = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        infoTextField.delegate = self
        infoTextField.isScrollEnabled = false

        priceTextField.addLeftPadding()
        titleTextField.addLeftPadding()

        buttonCustom(btn: albumBtn)
        textViewCustom(tv: infoTextField)
        placeholderSetting()
        
        // imagepicker 속성 지정
        self.imagePicker.sourceType = .photoLibrary // 앨범에서 가져옴
        self.imagePicker.allowsEditing = true // 수정 가능 여부
        self.imagePicker.delegate = self // picker delegate
        
     
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.tabBarController?.tabBar.isHidden = true
        print("viewwillAppear() \(cate)")
        categoryBtn.setTitle(cate, for: .normal)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        print(categoryBtn.titleLabel?.text ?? " ")

    }
    
    // 사진 선택 버튼
    @IBAction func clickToSelectPhoto(_ sender: Any) {
        self.present(self.imagePicker, animated: true)
    }
    
    
    // 완료 버튼
    @IBAction func completedAdd(_ sender: Any) {
        p.productArray.insert(productInfo(id: userID, productImage: productImg.image!, productTitle: titleTextField.text ?? "0", price: Int(priceTextField.text!)!, location: location, info: infoTextField.text, category: cate), at: 0)
    
        self.navigationController?.popViewController(animated: true)
    }
    
    // 카테고리 선택
    @IBAction func clickToCategory(_ sender: Any) {
        guard let cvc = self.storyboard?.instantiateViewController(identifier: "CVC") as? CategoryViewController else { return }
        cvc.completioHandler = {
            msg in
//            print("messgae : \(msg)")
            self.cate = msg

        }
        self.navigationController?.pushViewController(cvc, animated: true)
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
        btn.layer.borderColor = UIColor(red: 0.5, green: 0.5, blue: 0.5, alpha: 0.5).cgColor
        btn.layer.borderWidth = 0.5
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

extension AddViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        var newImage: UIImage? = nil // update 할 이미지
        
        if let possibleImage = info[UIImagePickerController.InfoKey.editedImage] as? UIImage {
            newImage = possibleImage // 수정된 이미지가 있을 경우
        } else if let possibleImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            newImage = possibleImage // 원본 이미지가 있을 경우
        }
        
        self.productImg.image = newImage // 받아온 이미지를 update
        
        picker.dismiss(animated: true, completion: nil) // picker를 닫아줌
        
    }
}
