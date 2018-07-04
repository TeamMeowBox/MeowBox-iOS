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
    @IBOutlet weak var hiddenLeadingC: NSLayoutConstraint!
    @IBOutlet weak var hiddenTrailingC: NSLayoutConstraint!
    
    
    @IBOutlet weak var myPageView: UIView!
    @IBOutlet weak var barButton: UIBarButtonItem!
    @IBOutlet weak var hiddenImageView: UIImageView!
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var sideBarProfileImageView: UIImageView!
    
    var sideBarIsVisible = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        hiddenImageView.isHidden = true
        
        self.navigationItem.backBarButtonItem = barButton
        
        //navigation bar title&left bar item color
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor : #colorLiteral(red: 0.2980392157, green: 0.3058823529, blue: 0.3137254902, alpha: 1)]
        self.navigationController?.navigationBar.tintColor = #colorLiteral(red: 0.2980392157, green: 0.3058823529, blue: 0.3137254902, alpha: 1)
        
        //navigation bar tint color
        self.navigationController?.navigationBar.barTintColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        
        //프로필 이미지 동그랗게
        profileImageView.layer.masksToBounds = true
        profileImageView.layer.cornerRadius = profileImageView.layer.frame.width/2
    
        sideBarProfileImageView.layer.masksToBounds = true
        sideBarProfileImageView.layer.cornerRadius = sideBarProfileImageView.layer.frame.width/2

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
            
            hiddenImageView.isHidden = false
            hiddenLeadingC.constant = 258
            hiddenTrailingC.constant = -258
            
            leadingC.constant = 258
            trailingC.constant = -258
            
            sideBarIsVisible = true
            self.navigationItem.leftBarButtonItem = nil
            self.navigationItem.title = nil
            
            setNavigationBar()
            
        }
        
        UIView.animate(withDuration: 0.3, delay: 0.0, options: .curveEaseIn, animations: {
            self.view.layoutIfNeeded()
        }) { (animationComplete) in
            print("The animation is complete!")
        }
    }
    
    //MARK: 사이드 바 내에 있는 BackBtn 액션
    @IBAction func sideBarBackAction(_ sender: Any) {
        hiddenImageView.isHidden = true
        hiddenLeadingC.constant = 0
        hiddenTrailingC.constant = 0
        leadingC.constant = 0
        trailingC.constant = 0
        
        sideBarIsVisible = false
        
        UIView.animate(withDuration: 0.3, delay: 0.0, options: .curveEaseIn, animations: {
            self.view.layoutIfNeeded()
        }) { (animationComplete) in
            print("SideBar close")
        }

        //네비게이션바 투명 복원
        self.navigationController?.navigationBar.shadowImage = UIColor( red: CGFloat(112/255.0), green: CGFloat(112/255.0), blue: CGFloat(112/255.0), alpha: CGFloat(0.2) ).as1ptImage()
        self.navigationController?.navigationBar.barTintColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
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
        
        //네비게이션바 투명 복원
        self.navigationController?.navigationBar.shadowImage = UIColor( red: CGFloat(112/255.0), green: CGFloat(112/255.0), blue: CGFloat(112/255.0), alpha: CGFloat(0.2) )
            .as1ptImage()
        self.navigationController?.navigationBar.barTintColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        self.navigationItem.leftBarButtonItem = self.barButton
        self.navigationItem.title = self.title
    }
    
    //MARK: 내 계정 설정 액션
    @IBAction func myAccountSettingAction(_ sender: Any) {
        let myAccountNaviVC = UIStoryboard(name: "MyPage", bundle: nil).instantiateViewController(withIdentifier: "MyAccountNaviVC")
        
        self.present(myAccountNaviVC, animated: true, completion: nil)
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

//navigation bar bottom line color 지정해주기 위함.
extension UIColor {
    
    /// Converts this `UIColor` instance to a 1x1 `UIImage` instance and returns it.
    ///
    /// - Returns: `self` as a 1x1 `UIImage`.
    func as1ptImage() -> UIImage {
        UIGraphicsBeginImageContext(CGSize(width: 1, height: 1))
        setFill()
        UIGraphicsGetCurrentContext()?.fill(CGRect(x: 0, y: 0, width: 1, height: 1))
        let image = UIGraphicsGetImageFromCurrentImageContext() ?? UIImage()
        UIGraphicsEndImageContext()
        return image
    }
}
