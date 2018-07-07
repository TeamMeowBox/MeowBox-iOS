//
//  SettingViewController.swift
//  MeowBox
//
//  Created by 장한솔 on 2018. 7. 3..
//  Copyright © 2018년 yeen. All rights reserved.
//

import UIKit

class SettingViewController: UIViewController {

    @IBOutlet weak var ToSView: UIView!
    @IBOutlet weak var noticeView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let gesture = UITapGestureRecognizer(target: self, action:  #selector(self.TosCheckAction))
        self.ToSView.addGestureRecognizer(gesture)
        
        let gesture2 = UITapGestureRecognizer(target: self, action:  #selector(noticeAction))
        self.noticeView.addGestureRecognizer(gesture2)

    }
    
    @objc func noticeAction(){
        let noticeNavi = UIStoryboard(name: "Mypage2", bundle: nil).instantiateViewController(withIdentifier: "noticeNavi")
        self.present(noticeNavi, animated: true, completion: nil)
    }

    
    @objc func TosCheckAction(sender : UITapGestureRecognizer) {
        let ToSNaviVC = UIStoryboard(name: "MyPage", bundle: nil).instantiateViewController(withIdentifier: "ToSNaviVC")
        self.present(ToSNaviVC, animated: true, completion: nil)
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
