//
//  LoginViewController.swift
//  DanggeunMarket
//
//  Created by 양유진 on 2021/09/20.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var idTextField: UITextField!
    @IBOutlet weak var pwTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        loginButton.backgroundColor = UIColor(red: 255/255, green: 138/255, blue: 61/255, alpha: 1)
        loginButton.layer.cornerRadius = 10

        
    }
    
    @IBAction func ClickToLogin(_ sender: Any) {
        UserDefaultsKey.isLoggedIn = true
        let vc = storyboard?.instantiateViewController(withIdentifier: "MainVC") as! ViewController
        let nav = UINavigationController(rootViewController: vc)
        nav.modalPresentationStyle = .fullScreen 
        self.present(nav, animated: true, completion: nil)
    }
    


}

