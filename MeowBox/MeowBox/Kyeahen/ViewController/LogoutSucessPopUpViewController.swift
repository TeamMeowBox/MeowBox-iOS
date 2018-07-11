//
//  LogoutSucessPopUpViewController.swift
//  MeowBox
//
//  Created by 김예은 on 2018. 7. 4..
//  Copyright © 2018년 yeen. All rights reserved.
//

import UIKit

class LogoutSucessPopUpViewController: UIViewController {

    @IBOutlet weak var logoutSucessTextView: UITextView!
    @IBOutlet weak var logoutSucessView: UIView!
    
    @IBOutlet weak var logoutSucessBtn: UIButton!
    
    let userdefault = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.showAnimate()
        
        logoutSucessTextView.text = "다음에 또 봐요!\n미유박스 또 찾아주세요."
    
        logoutSucessView.layer.cornerRadius = 5
        
        logoutSucessBtn.clipsToBounds = true
        logoutSucessBtn.layer.cornerRadius = 5
        logoutSucessBtn.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMaxYCorner]

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
    
    func remove_pref(remove_key : String){
        UserDefaults.standard.removeObject(forKey: remove_key)
        UserDefaults.standard.synchronize()
    }

    
    //MARK: 확인하기 액션
    @IBAction func sucessAction(_ sender: Any) {
        let mainNaviVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "MainNaviVC")
        remove_pref(remove_key: "name")
        remove_pref(remove_key: "image_profile")
        self.present(mainNaviVC, animated: true, completion: nil)
    }

}
