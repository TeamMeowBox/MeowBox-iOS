//
//  LoginViewController.swift
//  MeowBox
//
//  Created by 김예은 on 2018. 7. 2..
//  Copyright © 2018년 yeen. All rights reserved.
//

import UIKit

//TODO: 이미지뷰 로고 및 텍스트 필드 아이콘 넣기
//TODO: 네비게이션바 투명한거 불투명으로 바꾸기
class LoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func signInAction(_ sender: Any) {
        let signInNaviVC = UIStoryboard(name: "Sign", bundle: nil).instantiateViewController(withIdentifier: "SignInNaviVC")
        
        self.present(signInNaviVC, animated: true, completion: nil)
    }
    
}
