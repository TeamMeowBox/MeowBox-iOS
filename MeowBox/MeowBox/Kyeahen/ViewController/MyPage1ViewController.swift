//
//  MyPage1ViewController.swift
//  MeowBox
//
//  Created by 김예은 on 2018. 7. 3..
//  Copyright © 2018년 yeen. All rights reserved.
//

import UIKit

class MyPage1ViewController: UIViewController {

    @IBOutlet weak var leadingC: NSLayoutConstraint!
    @IBOutlet weak var trailingC: NSLayoutConstraint!
    @IBOutlet weak var myPageView: UIView!
    @IBOutlet weak var barButton: UIBarButtonItem!

    
    var sideBarIsVisible = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.backBarButtonItem = barButton
        
        //navigation bar title&left bar item color
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor : #colorLiteral(red: 0.2980392157, green: 0.3058823529, blue: 0.3137254902, alpha: 1)]
        self.navigationController?.navigationBar.tintColor = #colorLiteral(red: 0.2980392157, green: 0.3058823529, blue: 0.3137254902, alpha: 1)

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
    
    //MARK: 사이드 바
    @IBAction func barButtonAction(_ sender: Any) {
        if !sideBarIsVisible { //메뉴 보여줘야함
            leadingC.constant = 258
            trailingC.constant = -258
            
            sideBarIsVisible = true
            self.navigationItem.leftBarButtonItem = nil
            self.navigationItem.title = nil
            
        }
        else { //메뉴 숨겨야함
            leadingC.constant = 0
            trailingC.constant = 0
            
            sideBarIsVisible = false
            self.navigationItem.leftBarButtonItem = self.barButton
            self.navigationItem.title = title
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
        
        self.navigationItem.leftBarButtonItem = self.barButton
        self.navigationItem.title = self.title
    }
    
    //MARK: 로그인 액션 - 사이드바
    @IBAction func loginAction(_ sender: Any) {
        
        let loginNaviVC = UIStoryboard(name: "Sign", bundle: nil).instantiateViewController(withIdentifier: "LoginNaviVC")
        
        self.present(loginNaviVC, animated: true, completion: nil)
    }
    
    //MARK: 홈 액션 - 사이드바
    @IBAction func homeAction(_ sender: Any) {
        let mainNaviVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "MainNaviVC")
        
        self.present(mainNaviVC, animated: true, completion: nil)
    }
    
    //MARK: 주문하기 액션 - 사이드바
    @IBAction func orderAction(_ sender: Any) {
        
        let orderNaviVC = UIStoryboard(name: "Order", bundle: nil).instantiateViewController(withIdentifier: "OrderWithInfoNavigationController")
        
        self.present(orderNaviVC, animated: true, completion: nil)
    }
    
    //MARK: 마이페이지 액션(기준) - 사이드바
    @IBAction func myPageAction(_ sender: Any) {
        leadingC.constant = 0
        trailingC.constant = 0
        
        
        sideBarIsVisible = false
        
        UIView.animate(withDuration: 0.3, delay: 0.0, options: .curveEaseIn, animations: {
            self.view.layoutIfNeeded()
        }) { (animationComplete) in
            print("SideBar close")
        }
        
        self.navigationItem.leftBarButtonItem = self.barButton
        self.navigationItem.title = self.title
    }
    
    //MARK: 미유박스에 제안 액션
    @IBAction func sugesstAction(_ sender: Any) {
        
        let suggestNaviVC = UIStoryboard(name: "Mypage2", bundle: nil).instantiateViewController(withIdentifier: "suggestionNavi")
        
        self.present(suggestNaviVC, animated: true, completion: nil)
    }
    
    //MARK: 자주묻는 질문 액션
    @IBAction func questionAction(_ sender: Any) {
        
        let questionNaviVC = UIStoryboard(name: "Mypage2", bundle: nil).instantiateViewController(withIdentifier: "questionNavi")
        
        self.present(questionNaviVC, animated: true, completion: nil)
        
    }
    
    //MARK: 설정 액션
    @IBAction func settingAction(_ sender: Any) {
        
        let settionNaviVC = UIStoryboard(name: "Mypage2", bundle: nil).instantiateViewController(withIdentifier: "settingNavi")
        
        self.present(settionNaviVC, animated: true, completion: nil)
        
    }
    
    
}
