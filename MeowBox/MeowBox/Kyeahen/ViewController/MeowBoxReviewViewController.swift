//
//  MeowBoxReviewViewController.swift
//  MeowBox
//
//  Created by 김예은 on 2018. 7. 7..
//  Copyright © 2018년 yeen. All rights reserved.
//

import UIKit

class MeowBoxReviewViewController: UIViewController {
    
    @IBOutlet weak var leadingC: NSLayoutConstraint!
    @IBOutlet weak var trailingC: NSLayoutConstraint!
    
    @IBOutlet weak var barButton: UIBarButtonItem!
    @IBOutlet weak var profileImageView: UIImageView!
    
    var sideBarIsVisible = false

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        hiddenImageView.isHidden = true
        setNavigationBar()
        self.navigationItem.backBarButtonItem = barButton
        
        //프로필 이미지 동그랗게
        profileImageView.layer.masksToBounds = true
        profileImageView.layer.cornerRadius = profileImageView.layer.frame.width/2

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: 네비게이션 바 투명하게 하는 함수
    func setNavigationBar() {
        let bar: UINavigationBar! = self.navigationController?.navigationBar
        
        bar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        
        bar.shadowImage = UIImage()
        bar.backgroundColor = UIColor.clear
    }
    
    //MARK: 사이드바 액션
    @IBAction func sideBarAction(_ sender: Any) {
        
        if !sideBarIsVisible { //메뉴 보여줘야함
            
//            hiddenImageView.isHidden = false
//
//            hiddenLeadingC.constant = 258
//            hiddenTrailingC.constant = -258
            leadingC.constant = 258
            trailingC.constant = -258
            
            sideBarIsVisible = true
            self.navigationItem.leftBarButtonItem = nil
            self.navigationItem.title = nil
            
        }
        
        UIView.animate(withDuration: 0.3, delay: 0.0, options: .curveEaseIn, animations: {
            self.view.layoutIfNeeded()
        }) { (animationComplete) in
            print("The animation is complete!")
        }
    }
    
    //MARK: 사이드바 Back 액션
    @IBAction func sideBarBackAction(_ sender: Any) {
        
//        hiddenImageView.isHidden = true
//
//        hiddenLeadingC.constant = 0
//        hiddenTrailingC.constant = 0
        leadingC.constant = 0
        trailingC.constant = 0
        
        sideBarIsVisible = false
        
        UIView.animate(withDuration: 0.3, delay: 0.0, options: .curveEaseIn, animations: {
            self.view.layoutIfNeeded()
        }) { (animationComplete) in
            print("SideBar close")
        }
        
        //네비게이션바 복원
        self.navigationItem.leftBarButtonItem = self.barButton
        self.navigationItem.title = "MEOW BOX"
        
    }
    
    
    
    //MARK: 로그인 액션
    @IBAction func loginAction(_ sender: Any) {
        
        let loginNaviVC = UIStoryboard(name: "Sign", bundle: nil).instantiateViewController(withIdentifier: "LoginNaviVC")
        
        self.present(loginNaviVC, animated: true, completion: nil)
    }
    
    //MARK: 홈 액션
    @IBAction func homeAction(_ sender: Any) {
        let mainNaviVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "MainNaviVC")
        
        self.present(mainNaviVC, animated: true, completion: nil)
    }
    
    //MARK: 미유박스 이야기 액션
    @IBAction func storyAction(_ sender: Any) {
    }
    
    //MARK: 생일축하해!박스 액션
    @IBAction func birthBoxAction(_ sender: Any) {
    }
    
    //MARK: 주문하기 액션
    //TODO: 팝업 예외 처리
    @IBAction func orderAction(_ sender: Any) {
        
        //if 로그인이 안되어있다면
        //        let popUPVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "AlertViewController") as! AlertViewController
        //        self.addChildViewController(popUPVC)
        //        popUPVC.view.frame = self.view.frame
        //        self.view.addSubview(popUPVC.view)
        //        popUPVC.didMove(toParentViewController: self)
        
        let orderNaviVC = UIStoryboard(name: "Order", bundle: nil).instantiateViewController(withIdentifier: "OrderWithInfoNavigationController")
        
        self.present(orderNaviVC, animated: true, completion: nil)
    }
    
    //MARK: 집사들의 후기 액션
    @IBAction func reviewAction(_ sender: Any) {
        
        //        hiddenImageView.isHidden = true
        //
        //        hiddenLeadingC.constant = 0
        //        hiddenTrailingC.constant = 0
        leadingC.constant = 0
        trailingC.constant = 0
        
        sideBarIsVisible = false
        
        UIView.animate(withDuration: 0.3, delay: 0.0, options: .curveEaseIn, animations: {
            self.view.layoutIfNeeded()
        }) { (animationComplete) in
            print("SideBar close")
        }
        
        //네비게이션바 복원
        self.navigationItem.leftBarButtonItem = self.barButton
        self.navigationItem.title = self.title
        
    }
    
    //MARK: 마이페이지 액션
    @IBAction func myPageAction(_ sender: Any) {
        let myPageNaviVC = UIStoryboard(name: "MyPage", bundle: nil).instantiateViewController(withIdentifier: "MyPageNaviVC")
        
        self.present(myPageNaviVC, animated: true, completion: nil)
    }
    
    
}
