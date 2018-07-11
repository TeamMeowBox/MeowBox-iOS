//
//  MyPagePopUpViewController.swift
//  MeowBox
//
//  Created by 김예은 on 2018. 7. 12..
//  Copyright © 2018년 yeen. All rights reserved.
//

import UIKit

class MyPagePopUpViewController: UIViewController {
    
    @IBOutlet weak var popView: UIView!
    @IBOutlet weak var cancelBtn: UIButton!
    @IBOutlet weak var loginBtn: UIButton!
    @IBOutlet weak var textView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        showAnimate()
        
        popView.layer.cornerRadius = 5
        
        cancelBtn.clipsToBounds = true
        cancelBtn.layer.cornerRadius = 5
        cancelBtn.layer.maskedCorners = [.layerMinXMaxYCorner]
        
        loginBtn.clipsToBounds = true
        loginBtn.layer.cornerRadius = 5
        loginBtn.layer.maskedCorners = [.layerMaxXMaxYCorner]
        
        textView.text =
        """
        미유박스와 함께 하기 위해
        먼저 로그인을 해주세요!
        """

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
    
    //MARK: 창닫기 액션
    @IBAction func closeAction(_ sender: Any) {
        
        removeAnimate()
    }
    
    //MRKK: 로그인 화면 액션
    @IBAction func loginAction(_ sender: Any) {
        
        let loginNaviVC = UIStoryboard(name: "Sign", bundle: nil).instantiateViewController(withIdentifier: "LoginNaviVC")
        
        self.present(loginNaviVC, animated: true, completion: nil)
    }
    
    
}
