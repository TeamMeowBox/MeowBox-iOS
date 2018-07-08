//
//  SignInViewController.swift
//  MeowBox
//
//  Created by 김예은 on 2018. 7. 2..
//  Copyright © 2018년 yeen. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class SignInViewController: UIViewController, APIService {
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var phoneTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var pwdTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //textfield boder color, width
        self.nameTextField.layer.borderColor = #colorLiteral(red: 0.6, green: 0.6, blue: 0.6, alpha: 1)
        self.nameTextField.layer.borderWidth = 1
        
        self.phoneTextField.layer.borderColor = #colorLiteral(red: 0.6, green: 0.6, blue: 0.6, alpha: 1)
        self.phoneTextField.layer.borderWidth = 1
        
        self.emailTextField.layer.borderColor = #colorLiteral(red: 0.6, green: 0.6, blue: 0.6, alpha: 1)
        self.emailTextField.layer.borderWidth = 1
        
        self.pwdTextField.layer.borderColor = #colorLiteral(red: 0.6, green: 0.6, blue: 0.6, alpha: 1)
        self.pwdTextField.layer.borderWidth = 1
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?){
        
        self.view.endEditing(true)
    }
    
    //MARK: 필수 항목 공백 체크 함수
    func emptyCheck() {
        if nameTextField.text == "" || phoneTextField.text == "" || emailTextField.text == "" || pwdTextField.text == "" {
            //팝업 및 버튼
        }
        else {
            
        }
    }
    
    func signup(){
        SignService.signup(email: gsno(emailTextField.text), pwd: gsno(pwdTextField.text), name: gsno(nameTextField.text), phone_number: gsno(phoneTextField.text)){ message in
            if message == "success"{
                self.dismiss(animated: true, completion: nil)
            }else if message == "exist_id"{
                let alertView = UIAlertController(title: "중복", message: "이미 존재하는 아이디입니다.", preferredStyle: .alert)
                let ok = UIAlertAction(title: "확인", style: .default, handler: nil)
                alertView.addAction(ok)
                self.present(alertView, animated: true, completion: nil)
            }
        }
    }
    
    //MARK: 회원가입 액션
    //TODO: 서버 통신
    @IBAction func SignInAction(_ sender: Any) {
        
        signup()
        
    }
    
    
    //MARK: 회원가입창 나가기 액션
    @IBAction func dismissAction(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
}
