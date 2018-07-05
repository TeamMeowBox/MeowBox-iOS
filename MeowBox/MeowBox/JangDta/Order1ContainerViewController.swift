//
//  Order1ContainerViewController.swift
//  MeowBox
//
//  Created by 장한솔 on 2018. 7. 4..
//  Copyright © 2018년 yeen. All rights reserved.
//

import UIKit

class Order1ContainerViewController: UIViewController {
    
    @IBOutlet weak var barBtn: UIBarButtonItem!
    
    @IBOutlet weak var container: UIView!
    @IBOutlet weak var hiddenImageView: UIImageView!
    
    @IBOutlet weak var leadingC: NSLayoutConstraint!
    @IBOutlet weak var trailingC: NSLayoutConstraint!
    @IBOutlet weak var hiddenLeadingC: NSLayoutConstraint!
    @IBOutlet weak var hiddenTrailingC: NSLayoutConstraint!
    
    @IBOutlet weak var profileImageView: UIImageView!
    
    var sideBarIsVisible = false
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.backBarButtonItem = barBtn
        hiddenImageView.isHidden = true
        
        //navigation bar title&left bar item color
    self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor : #colorLiteral(red: 0.2980392157, green: 0.3058823529, blue: 0.3137254902, alpha: 1)]
        self.navigationController?.navigationBar.tintColor = #colorLiteral(red: 0.2980392157, green: 0.3058823529, blue: 0.3137254902, alpha: 1)
        
        //프로필 이미지 동그랗게
        profileImageView.layer.masksToBounds = true
        profileImageView.layer.cornerRadius = profileImageView.layer.frame.width/2
        
        add(asChildViewController: withInfoVC1)
        
    }
    
    private lazy var withInfoVC1: OrderWithInfoViewController = {
        var viewController = UIStoryboard(name: "Order", bundle: nil).instantiateViewController(withIdentifier: "OrderWithInfoViewController") as! OrderWithInfoViewController
        viewController.parentVC = self
        self.addChildViewController(viewController)
        return viewController
    }()
    
    private lazy var withInfoVC2: OrderWithInfo2ViewController = {
        var viewController = UIStoryboard(name: "Order", bundle: nil).instantiateViewController(withIdentifier: "OrderWithInfo2ViewController") as! OrderWithInfo2ViewController
        viewController.parentVC = self
        self.addChildViewController(viewController)
        return viewController
    }()
    
    private lazy var withInfoVC3: OrderWithInfo3ViewController = {
        var viewController = UIStoryboard(name: "Order", bundle: nil).instantiateViewController(withIdentifier: "OrderWithInfo3ViewController") as! OrderWithInfo3ViewController
        viewController.parentVC = self
        self.addChildViewController(viewController)
        return viewController
    }()
    
    private lazy var withInfoVC4: OrderWithInfo4ViewController = {
        var viewController = UIStoryboard(name: "Order", bundle: nil).instantiateViewController(withIdentifier: "OrderWithInfo4ViewController") as! OrderWithInfo4ViewController
        viewController.parentVC = self
        self.addChildViewController(viewController)
        return viewController
    }()
    
    private lazy var withInfoVC5: OrderCompleteViewController = {
        var viewController = UIStoryboard(name: "Order", bundle: nil).instantiateViewController(withIdentifier: "OrderCompleteViewController") as! OrderCompleteViewController
        viewController.parentVC = self
        self.addChildViewController(viewController)
        return viewController
    }()
    
    func changeVC(num : Int){
        switch num {
        case 1:
            add(asChildViewController: withInfoVC1)
            break
        case 2:
            add(asChildViewController: withInfoVC2)
            withInfoVC2.scrollView.setContentOffset(.zero, animated: true)
            break
        case 3:
            add(asChildViewController: withInfoVC3)
            withInfoVC3.scrollView.setContentOffset(.zero, animated: true)
            break
        case 4:
            add(asChildViewController: withInfoVC4)
            withInfoVC4.scrollView.setContentOffset(.zero, animated: true)
            break
        case 5:
            add(asChildViewController: withInfoVC5)
            break
        default:
            add(asChildViewController: withInfoVC1)
            break
        }
    }
    
    private func add(asChildViewController viewController: UIViewController) {
        
        // Add Child View as Subview
        container.addSubview(viewController.view)
        
        // Configure Child View
        viewController.view.frame = container.bounds
        viewController.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        // Notify Child View Controller
        viewController.didMove(toParentViewController: self)
    }
    
    private func remove(asChildViewController viewController: UIViewController) {
        // Notify Child View Controller
        viewController.willMove(toParentViewController: nil)
        
        // Remove Child View From Superview
        viewController.view.removeFromSuperview()
        
        // Notify Child View Controller
        viewController.removeFromParentViewController()
    }
    
    //MARK: 네비게이션 바 투명하게 하는 함수
    func setNavigationBar() {
        let bar: UINavigationBar! = self.navigationController?.navigationBar
        
        bar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        bar.shadowImage = UIImage()
        bar.backgroundColor = UIColor.clear
    }
    
    @IBAction func sideBarAction(_ sender: Any) {
        
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
    
    @IBAction func sideBarBackBtnAction(_ sender: Any) {
        
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
        self.navigationItem.leftBarButtonItem = self.barBtn
        self.navigationItem.title = "주문하기"
    }
    
    //MARK: 로그인 액션
    @IBAction func loginAction(_ sender: Any) {
        
        let loginNaviVC = UIStoryboard(name: "Sign", bundle: nil).instantiateViewController(withIdentifier: "LoginNaviVC")
        
        self.present(loginNaviVC, animated: true, completion: nil)
    }
    
    //MARK: 홈 액션
    @IBAction func homeAcion(_ sender: Any) {
        
        let mainNaviVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "MainNaviVC")
        
        self.present(mainNaviVC, animated: true, completion: nil)
    }
    
    //MARK: 주문하기 액션(기준)
    @IBAction func orderAction(_ sender: Any) {
        
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
            self.navigationItem.leftBarButtonItem = self.barBtn
            self.navigationItem.title = "주문하기"
    }
    
    //MARK: 마이페이지 액션
    @IBAction func myPageAction(_ sender: Any) {
        
        let myPageNaviVC = UIStoryboard(name: "MyPage", bundle: nil).instantiateViewController(withIdentifier: "MyPageNaviVC")
        
        self.present(myPageNaviVC, animated: true, completion: nil)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?){
        self.view.endEditing(true)
    }
    
    
    
}
