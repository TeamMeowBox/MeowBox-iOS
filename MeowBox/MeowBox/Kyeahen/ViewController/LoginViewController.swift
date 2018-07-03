//
//  LoginViewController.swift
//  MeowBox
//
//  Created by 김예은 on 2018. 7. 2..
//  Copyright © 2018년 yeen. All rights reserved.
//

import UIKit

//TODO: 이미지뷰 로고
//TODO: 입력 내용 채워지면 아이콘들 핑크색 아이콘으로 변경
class LoginViewController: UIViewController {
    
    @IBOutlet weak var emailImageView: UIImageView!
    @IBOutlet weak var pwdImageView: UIImageView!
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var pwdTextField: UITextField!
    
    @IBOutlet weak var loginBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        //navigation bar title color
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor : #colorLiteral(red: 0.2980392157, green: 0.3058823529, blue: 0.3137254902, alpha: 1)]
        
        //navigation bar tint color
        self.navigationController?.navigationBar.barTintColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        
        loginBtn.isUserInteractionEnabled = false

        //textfield 채워지면 아이콘 변경
        emailTextField.addTarget(self, action: #selector(emptyEmailCheck), for: .editingChanged)
        pwdTextField.addTarget(self, action: #selector(emptyPwdCheck), for: .editingChanged)
        
        //textfield 채워지면 로그인 버튼 변경
        emailTextField.addTarget(self, action: #selector(emptyCheck), for: .editingChanged)
        pwdTextField.addTarget(self, action: #selector(emptyCheck), for: .editingChanged)
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?){
        
        self.view.endEditing(true)
    }
    
    //MARK: 이메일 공백 체크 함수
    @objc func emptyEmailCheck() {
        
        if emailTextField.text == ""{
            emailImageView.image = #imageLiteral(resourceName: "email-icon-gray")
        }
        else {
            emailImageView.image = #imageLiteral(resourceName: "email-icon-pink.png")
        }
    }
    
    //MARK: 비밀번호 공백 체크 함수
    @objc func emptyPwdCheck() {
        
        if pwdTextField.text == ""{
            pwdImageView.image = #imageLiteral(resourceName: "password-icon-gray")
        }
        else {
            pwdImageView.image = #imageLiteral(resourceName: "password-icon-pink")
        }
    }
    
    @objc func emptyCheck() {
        if pwdTextField.text == "" || emailTextField.text == "" {
            loginBtn.setImage(#imageLiteral(resourceName: "login-btn-gray"), for: UIControlState.normal)
            loginBtn.isUserInteractionEnabled = false
        }
        else {
            loginBtn.setImage(#imageLiteral(resourceName: "login-btn-pink"), for: UIControlState.normal)
            loginBtn.isUserInteractionEnabled = true
        }
    }
    
    //MARK: 뒤로가기 액션
    @IBAction func dismissAction(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    //MARK: 로그인 액션
    //TODO: 로그인 서버 통신
    @IBAction func loginAction(_ sender: Any) {
        
    }
    
    //MARK: 회원가입 액션
    @IBAction func signInAction(_ sender: Any) {
        let signInNaviVC = UIStoryboard(name: "Sign", bundle: nil).instantiateViewController(withIdentifier: "SignInNaviVC")
        
        self.present(signInNaviVC, animated: true, completion: nil)
    }
    
}

