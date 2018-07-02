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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //navigation bar title color
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor : #colorLiteral(red: 0.2980392157, green: 0.3058823529, blue: 0.3137254902, alpha: 1)]

        emptyCheck(tf: emailTextField, iv: emailImageView, icon1: #imageLiteral(resourceName: "email-icon-pink"), icon2: #imageLiteral(resourceName: "email-icon-gray"))
        emptyCheck(tf: pwdTextField, iv: pwdImageView, icon1: #imageLiteral(resourceName: "password-icon-pink"), icon2: #imageLiteral(resourceName: "password-icon-gray"))
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func emptyCheck(tf: UITextField, iv: UIImageView ,icon1: UIImage, icon2: UIImage) {
        if tf.text == ""{
            iv.image = icon2
        }
        
       // tf.addTarget(self, action:d Selector(("textChanged:")), for: .editingChanged)
    }
    
    //MARK: 뒤로가기 액션
    @IBAction func dismissAction(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    //MARK: 회원가입 액션
    @IBAction func signInAction(_ sender: Any) {
        let signInNaviVC = UIStoryboard(name: "Sign", bundle: nil).instantiateViewController(withIdentifier: "SignInNaviVC")
        
        self.present(signInNaviVC, animated: true, completion: nil)
    }
    
}

//extension UITextField {
//    func modifyClearButton(with image : UIImage) {
//        let icon = UIImage()
//
//
//        clearButton.setImage(image, for: .normal)
//        clearButton.frame = CGRect(x: 0, y: 0, width: 15, height: 15)
//        clearButton.contentMode = .scaleAspectFit
//        clearButton.addTarget(self, action: #selector(UITextField.clear(_:)), for: .touchUpInside)
//        rightView = clearButton
//        rightViewMode = .whileEditing
//    }
//
//    func clear(_ sender : AnyObject) {
//        self.text = ""
//        sendActions(for: .editingChanged)
//    }
//}
