//
//  WithdrawalSucessPopUpViewController.swift
//  MeowBox
//
//  Created by 김예은 on 2018. 7. 4..
//  Copyright © 2018년 yeen. All rights reserved.
//

import UIKit

class WithdrawalSucessPopUpViewController: UIViewController {


    @IBOutlet weak var withdrawalSucessTextView: UITextView!
    
    @IBOutlet weak var withdrawalSucessView: UIView!
    
    @IBOutlet weak var okBtn: UIButton!
    
    let userDefault = UserDefaults.standard
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.showAnimate()
        withdrawalSucessTextView.text = "다음에 또 미유박스를\n찾아주세요:)"

        withdrawalSucessView.layer.cornerRadius = 5
        
        okBtn.clipsToBounds = true
        okBtn.layer.cornerRadius = 5
        okBtn.layer.maskedCorners = [.layerMaxXMaxYCorner]
        
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
    
    //MARK: 확인 하기 액션
    @IBAction func okAction(_ sender: Any) {
        userDefault.set("", forKey: "token")
        let mainNaviVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "MainNaviVC")
        
        remove_pref(remove_key: "name")
        remove_pref(remove_key: "image_profile")
        
        self.present(mainNaviVC, animated: true, completion: nil)
    }
    
}
