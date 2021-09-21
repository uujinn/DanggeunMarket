//
//  LoginViewController.swift
//  DanggeunMarket
//
//  Created by 양유진 on 2021/09/20.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var idTextField: UITextField!
    @IBOutlet weak var pwTextField: UITextField!
    @IBOutlet var textFields: [UITextField]!
    
    weak var activeField: UITextField?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Custom UIButton
        loginButton.backgroundColor = UIColor(red: 255/255, green: 138/255, blue: 61/255, alpha: 1)
        loginButton.layer.cornerRadius = 10
        
        for textField in textFields{
            textField.delegate = self
        }
        
        // Keyboard 가림 방지
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardAppear), name: UIResponder.keyboardDidShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardDisappear), name: UIResponder.keyboardWillHideNotification, object: nil)
        
        // 뷰 누르면 키보드 내려감
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(viewTapped))
        tapGestureRecognizer.numberOfTapsRequired = 1
        tapGestureRecognizer.isEnabled = true
        scrollView.addGestureRecognizer(tapGestureRecognizer)

        
    }
    
    @IBAction func ClickToLogin(_ sender: Any) {
        UserDefaultsKey.isLoggedIn = true
        let vc = storyboard?.instantiateViewController(withIdentifier: "TC") as! UITabBarController
        let nav = UINavigationController(rootViewController: vc)
        nav.modalPresentationStyle = .fullScreen 
        self.present(nav, animated: true, completion: nil)
    }
    
    @objc func viewTapped() {
         if let activatedField = activeField {
             activatedField.resignFirstResponder()
         }
     }

     @objc func keyboardDisappear(notification: Notification) {
        // UIResponder.keyboardWillHideNotification 을 NotificationCenter에서 감지했을 때 수행할 메소드 내용 (키보드가 사라질 예정이다.)\
        let contentInsets = UIEdgeInsets.zero
        scrollView.contentInset = contentInsets
        scrollView.verticalScrollIndicatorInsets = contentInsets
     }
    
    @objc func keyboardAppear(notification: Notification) {
        guard let activeField = activeField,
              let userInfo = notification.userInfo,
              let keyboardFrame = userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect else {return}
    
        let contentInsets = UIEdgeInsets(top: 0.0, left: 0.0, bottom: keyboardFrame.height-5, right: 0.0)
        scrollView.contentInset = contentInsets
        scrollView.verticalScrollIndicatorInsets = contentInsets
        let activeRect = activeField.convert(activeField.bounds, to: scrollView)
        scrollView.scrollRectToVisible(activeRect, animated: true)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let activatedField = activeField {
                activatedField.resignFirstResponder()
        }
    }
}

extension LoginViewController: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        activeField = nil
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        activeField = textField
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}

