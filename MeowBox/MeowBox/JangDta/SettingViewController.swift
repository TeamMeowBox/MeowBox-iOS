//
//  SettingViewController.swift
//  MeowBox
//
//  Created by 장한솔 on 2018. 7. 3..
//  Copyright © 2018년 yeen. All rights reserved.
//

import UIKit

class SettingViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func dismissAction(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    //MARK: 로그아웃 액션
    @IBAction func logoutAction(_ sender: Any) {
        
        let logoutPopUp = UIStoryboard(name: "MyPage", bundle: nil).instantiateViewController(withIdentifier: LogoutPopUpViewController.reuseIdentifier) as! LogoutPopUpViewController
        
        self.addChildViewController(logoutPopUp)
        logoutPopUp.view.frame = self.view.frame
        self.view.addSubview(logoutPopUp.view)
    
        logoutPopUp.didMove(toParentViewController: self)
        
    }
    
    //MARK: 회원탈퇴 액션
    @IBAction func withdrawalAction(_ sender: Any) {
        
        let withdrawalPopUp = UIStoryboard(name: "MyPage", bundle: nil).instantiateViewController(withIdentifier: WithdrawalPopUpViewController.reuseIdentifier) as! WithdrawalPopUpViewController
        
        self.addChildViewController(withdrawalPopUp)
        withdrawalPopUp.view.frame = self.view.frame
        self.view.addSubview(withdrawalPopUp.view)
        
        withdrawalPopUp.didMove(toParentViewController: self)
        
    }
    
    
}
