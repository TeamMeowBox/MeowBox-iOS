//
//  StoryViewController.swift
//  MeowBox
//
//  Created by 김예은 on 2018. 7. 12..
//  Copyright © 2018년 yeen. All rights reserved.
//

import UIKit

class StoryViewController: UIViewController {
    
    @IBOutlet weak var barButton: UIBarButtonItem!
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var sideBarBackBtn: UIButton!
    @IBOutlet weak var loginStatusLabel: UILabel!
    
    let userDefault = UserDefaults.standard
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: 사이드 바
    @IBAction func barButtonAction(_ sender: Any) {
        
//        if !sideBarIsVisible { //메뉴 보여줘야함
//
//            hiddenImageView.isHidden = false
//
//            hiddenLeadingC.constant = 258
//            hiddenTrailingC.constant = -258
//            leadingC.constant = 258
//            trailingC.constant = -258
//
//            sideBarIsVisible = true
//            self.navigationItem.leftBarButtonItem = nil
//            self.navigationItem.titleView = nil
//
//            bottomBtnView.isUserInteractionEnabled = false
//            MainView.isUserInteractionEnabled = false
//
//
//        }
//
//        UIView.animate(withDuration: 0.3, delay: 0.0, options: .curveEaseIn, animations: {
//            self.view.layoutIfNeeded()
//        }) { (animationComplete) in
//            print("The animation is complete!")
//        }
    }
    
    //MARK: 사이드 바 내에 있는 BackBtn 액션
    @IBAction func sideBarBackAction(_ sender: Any) {
        
//        hiddenImageView.isHidden = true
//
//        hiddenLeadingC.constant = 0
//        hiddenTrailingC.constant = 0
//        leadingC.constant = 0
//        trailingC.constant = 0
//
//        sideBarIsVisible = false
//
//        bottomBtnView.isUserInteractionEnabled = true
//        MainView.isUserInteractionEnabled = true
//
//
//        UIView.animate(withDuration: 0.3, delay: 0.0, options: .curveEaseIn, animations: {
//            self.view.layoutIfNeeded()
//        }) { (animationComplete) in
//            print("SideBar close")
//        }
//
//        //네비게이션바 복원
//        self.navigationItem.leftBarButtonItem = self.barButton
//        self.navigationItem.titleView = self.logoImageView
    }
    
    //MARK: 로그인 액션
    @IBAction func loginAction(_ sender: Any) {
        
        guard let hasToken = userDefault.string(forKey: "token") else { return }
        
        print("hasToken: "+hasToken)
        if hasToken == ""{
            let loginNaviVC = UIStoryboard(name: "Sign", bundle: nil).instantiateViewController(withIdentifier: "LoginNaviVC")
            
            self.present(loginNaviVC, animated: true, completion: nil)
        }else{
            let popUPVC = UIStoryboard(name: "Sign", bundle: nil).instantiateViewController(withIdentifier: "LoginMainPopUpViewController") as! LoginMainPopUpViewController
            self.addChildViewController(popUPVC)
            popUPVC.view.frame = self.view.frame
            self.view.addSubview(popUPVC.view)
            popUPVC.didMove(toParentViewController: self)
        }
        
        
    }
    
    //MARK: 홈 액션(기준)
    @IBAction func homeAction(_ sender: Any) {
        let mainNaviVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "MainNaviVC")
        
        self.present(mainNaviVC, animated: true, completion: nil)
        
    }
    
    //MARK: 미유박스 이야기 액션
    @IBAction func storyAction(_ sender: Any) {
        
//        hiddenImageView.isHidden = true
//
//        hiddenLeadingC.constant = 0
//        hiddenTrailingC.constant = 0
//        leadingC.constant = 0
//        trailingC.constant = 0
//
//        sideBarIsVisible = false
//
//        bottomBtnView.isUserInteractionEnabled = true
//        MainView.isUserInteractionEnabled = true
//
//        UIView.animate(withDuration: 0.3, delay: 0.0, options: .curveEaseIn, animations: {
//            self.view.layoutIfNeeded()
//        }) { (animationComplete) in
//            print("SideBar close")
//        }
//
//        //네비게이션바 복원
//        self.navigationItem.leftBarButtonItem = self.barButton
//        self.navigationItem.titleView = self.logoImageView

        
    }
    
    //MARK: 생일축하해!박스 액션
    @IBAction func birthBoxAction(_ sender: Any) {
        
    }
    
    //MARK: 주문하기 액션
    //TODO: 팝업 예외 처리
    @IBAction func orderAction(_ sender: Any) {
        
        if userDefault.string(forKey: "token") != ""{ // 로그인이 되어 있다면
            let orderNaviVC = UIStoryboard(name: "Order", bundle: nil).instantiateViewController(withIdentifier: "OrderWithInfoNavigationController")
            
            self.present(orderNaviVC, animated: true, completion: nil)
            
            
        }else{ // 로그인 안 된 상태
            let popUPVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "LoginPopUp1ViewController") as! LoginPopUp1ViewController
            self.addChildViewController(popUPVC)
            popUPVC.view.frame = self.view.frame
            self.view.addSubview(popUPVC.view)
            popUPVC.didMove(toParentViewController: self)
        }
        
    }
    
    //MARK: 집사들의 후기 액션
    @IBAction func reviewAction(_ sender: Any) {
        
        let reviewNaviVC = UIStoryboard(name: "MeowBox", bundle: nil).instantiateViewController(withIdentifier: "ReviewNaviVC")
        
        self.present(reviewNaviVC, animated: true, completion: nil)
    }
    
    //MARK: 마이페이지 액션
    @IBAction func myPageAction(_ sender: Any) {
        
        if userDefault.string(forKey: "token") != ""{ // 로그인이 되어 있다면
            let myPageNaviVC = UIStoryboard(name: "MyPage", bundle: nil).instantiateViewController(withIdentifier: "MyPageNaviVC")
            
            self.present(myPageNaviVC, animated: true, completion: nil)
            
        }else{ // 로그인 안 된 상태
            let popUPVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: MyPagePopUpViewController.reuseIdentifier) as! MyPagePopUpViewController
            self.addChildViewController(popUPVC)
            popUPVC.view.frame = self.view.frame
            self.view.addSubview(popUPVC.view)
            popUPVC.didMove(toParentViewController: self)
        }
    }
    
    
    

}
