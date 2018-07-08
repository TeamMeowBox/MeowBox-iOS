//
//  WithdrawalPopUpViewController.swift
//  MeowBox
//
//  Created by 김예은 on 2018. 7. 4..
//  Copyright © 2018년 yeen. All rights reserved.
//

import UIKit

class WithdrawalPopUpViewController: UIViewController {
    
    @IBOutlet weak var withdrawalView: UIView!
    @IBOutlet weak var withdrawalTextView: UITextView!
    @IBOutlet weak var closeBtn: UIButton!
    @IBOutlet weak var okBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.showAnimate()
        
        withdrawalTextView.text = "회원 탈퇴시 모든 데이터가 소멸됩니다.\n정말 탈퇴하시겠습니까?"
        
        withdrawalView.layer.cornerRadius = 5
        
        closeBtn.clipsToBounds = true
        closeBtn.layer.cornerRadius = 5
    
        closeBtn.layer.maskedCorners = [.layerMinXMaxYCorner]
        
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
    
    //MARK: 취소하기 액션
    @IBAction func closeAction(_ sender: Any) {
        self.removeAnimate()
    }
    
    //MARK: 확인하기 액션
    //TODO: 회원탈퇴 서버 통신
    @IBAction func okAction(_ sender: Any) {
        //회원탈퇴 요청
        leave()
        
    }
    
    func leave(){
        SignService.leave(){message in
            if message == "success"{
                let withdrawalPopUp = UIStoryboard(name: "MyPage", bundle: nil).instantiateViewController(withIdentifier: WithdrawalSucessPopUpViewController.reuseIdentifier) as! WithdrawalSucessPopUpViewController
                
                self.addChildViewController(withdrawalPopUp)
                withdrawalPopUp.view.frame = self.view.frame
                self.view.addSubview(withdrawalPopUp.view)
                
                withdrawalPopUp.didMove(toParentViewController: self)
            }
        }
    }
    
    
    

}
