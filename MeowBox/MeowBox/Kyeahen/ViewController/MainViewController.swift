//
//  MainViewController.swift
//  MeowBox
//
//  Created by 김예은 on 2018. 7. 1..
//  Copyright © 2018년 yeen. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    @IBOutlet weak var leadingC: NSLayoutConstraint!
    @IBOutlet weak var trailingC: NSLayoutConstraint!
    @IBOutlet weak var MainView: UIView!
    @IBOutlet weak var barButton: UIBarButtonItem!
    
    var sideBarIsVisible = false //메뉴 상태 여부
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setNavigationBar()
        self.navigationItem.backBarButtonItem = barButton
        // Do any additional setup after loading the view, typically from a nib.
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
    
    //MARK: 사이드 바
    @IBAction func barButtonAction(_ sender: Any) {
        
        if !sideBarIsVisible { //메뉴 보여줘야함
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
    
    //MARK: 사이드 바 내에 있는 BackBtn 액션
    @IBAction func sideBarBackAction(_ sender: Any) {
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
    
    //MARK: 로그인 액션
    @IBAction func loginAction(_ sender: Any) {
        
        let loginNaviVC = UIStoryboard(name: "Sign", bundle: nil).instantiateViewController(withIdentifier: "LoginNaviVC")
        
        self.present(loginNaviVC, animated: true, completion: nil)
    }
    
    //MARK: 홈 액션(기준)
    @IBAction func homeAction(_ sender: Any) {
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
    
    //MARK: 마이페이지 액션
    @IBAction func myPageAction(_ sender: Any) {
        let myPageNaviVC = UIStoryboard(name: "MyPage", bundle: nil).instantiateViewController(withIdentifier: "MyPageNaviVC")
        
        self.present(myPageNaviVC, animated: true, completion: nil)
    }
    
}

