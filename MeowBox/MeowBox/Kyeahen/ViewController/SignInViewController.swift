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

class SignInViewController: UIViewController {
    
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
        
        
        //navigation bar title color
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor : #colorLiteral(red: 0.2980392157, green: 0.3058823529, blue: 0.3137254902, alpha: 1)]
        
        //navigation bar tint color
        self.navigationController?.navigationBar.barTintColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        
        
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
    
    //MARK: 회원가입 액션
    //TODO: 서버 통신
    @IBAction func SignInAction(_ sender: Any) {
        
        /***********************************************************************************************/
        
        let URL = "http://13.209.220.1:3000/"
        let body: [String: Any] = [
            "user_name" : gsno(nameTextField.text),
            "user_phone" : gsno(phoneTextField.text),
            "user_id" : gsno(emailTextField.text),
            "user_pwd" : gsno(pwdTextField.text),
            ]
        Alamofire.request(URL, method: .post, parameters: body, encoding: JSONEncoding.default, headers: nil).responseData(){ res in
            switch res.result{
            case .success:
                if let value = res.result.value{
                    if let message = JSON(value)["message"].string{
                        if message == "Successfully Sign Up"{ // 회원가입 성공
                            self.dismiss(animated: true, completion: nil)
                        }else if message == "Already Exists"{ // 중복 있음
                            let alertView = UIAlertController(title: "중복", message: "이미 존재하는 아이디입니다.", preferredStyle: .alert)
                            let ok = UIAlertAction(title: "확인", style: .default, handler: nil)
                            alertView.addAction(ok)
                            self.present(alertView, animated: true, completion: nil)
                        }
                    }
                }
                
                break
            case .failure(let err):
                print(err.localizedDescription)
                break
            }
        }
        
        /***********************************************************************************************/
        
    }
    
    
    //MARK: 회원가입창 나가기 액션
    @IBAction func dismissAction(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
}
