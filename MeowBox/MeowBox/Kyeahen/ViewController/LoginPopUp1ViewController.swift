//
//  LoginPopUp1ViewController.swift
//  MeowBox
//
//  Created by 김예은 on 2018. 7. 4..
//  Copyright © 2018년 yeen. All rights reserved.
//

import UIKit

class LoginPopUp1ViewController: UIViewController {

    @IBOutlet weak var popupTextView: UITextView!
    @IBOutlet weak var popupView: UIView!
    @IBOutlet weak var closeBtn: UIButton!
    @IBOutlet weak var loginBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.showAnimate()
        
        popupTextView.text = "미유박스를 주문하기 위해\n먼저 로그인을 해주세요!"
        
        popupView.layer.cornerRadius = 5
        
        closeBtn.clipsToBounds = true
        closeBtn.layer.cornerRadius = 5
        closeBtn.layer.maskedCorners = [.layerMinXMaxYCorner]
        
        loginBtn.clipsToBounds = true
        loginBtn.layer.cornerRadius = 5
        loginBtn.layer.maskedCorners = [.layerMaxXMaxYCorner]

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func showAnimate()
    {
        self.view.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
        self.view.alpha = 0.0;
        UIView.animate(withDuration: 0.25, animations: {
            self.view.alpha = 1.0
            self.view.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
        });
    }
    
    func removeAnimate()
    {
        UIView.animate(withDuration: 0.25, animations: {
            self.view.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
            self.view.alpha = 0.0;
        }, completion:{(finished : Bool)  in
            if (finished)
            {
                self.view.removeFromSuperview()
            }
        });
    }
    
    //MARK: 로그인하기 액션
    @IBAction func loginAction(_ sender: Any) {
        let loginNaviVC = UIStoryboard(name: "Sign", bundle: nil).instantiateViewController(withIdentifier: "LoginNaviVC")
        
        self.present(loginNaviVC, animated: true, completion: nil)
    }
    
    //MARK: 취소하기 액션
    @IBAction func closeAction(_ sender: Any) {
        self.removeAnimate()
    }
    
}
