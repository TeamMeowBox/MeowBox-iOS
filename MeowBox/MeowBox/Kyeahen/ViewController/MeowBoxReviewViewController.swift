//
//  MeowBoxReviewViewController.swift
//  MeowBox
//
//  Created by 김예은 on 2018. 7. 7..
//  Copyright © 2018년 yeen. All rights reserved.
//

import UIKit
import Kingfisher

class MeowBoxReviewViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var leadingC: NSLayoutConstraint!
    @IBOutlet weak var trailingC: NSLayoutConstraint!
    @IBOutlet weak var hiddenLeadingC: NSLayoutConstraint!
    @IBOutlet weak var hiddenTrailingC: NSLayoutConstraint!
    @IBOutlet weak var hiddenImageView: UIImageView!
    
    @IBOutlet weak var barButton: UIBarButtonItem!
    @IBOutlet weak var profileImageView: UIImageView!
    
    @IBOutlet weak var reviewTableView: UITableView!
    @IBOutlet weak var reviewHeaderImageView: UIImageView!
    @IBOutlet var reviewView: UIView!
    @IBOutlet weak var loginInfoLabel: UILabel!
    
    var sideBarIsVisible = false
    
    let logo : UIImage = UIImage(named: "meowbox-logo-pink.png")!
    let logoImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 128, height: 21))
    let userDefault = UserDefaults.standard
    
    var reviews: Review?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        reviewInit()
        loginCheck()
        profileImageCheck()
        
        //tableview
        reviewTableView.delegate = self
        reviewTableView.dataSource = self
        
        //sidebar
        hiddenImageView.isHidden = true
        
        self.navigationItem.backBarButtonItem = barButton
        self.navigationItem.titleView = logoImageView
        
        //navigation bar titleview
        logoImageView.contentMode = .scaleAspectFit
        logoImageView.image = logo
        navigationItem.titleView = logoImageView
        
        //프로필 이미지 동그랗게
        profileImageView.layer.masksToBounds = true
        profileImageView.layer.cornerRadius = profileImageView.layer.frame.width/2
        profileImageView.kf.setImage(with: URL(string: gsno(userDefault.string(forKey: "image_profile"))), placeholder: UIImage())
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        reviewInit()
        loginCheck()
        profileImageCheck()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: 프로필 이미지 체크 함수
    func profileImageCheck() {
        let pImage = gsno(userDefault.string(forKey: "image_profile"))
        if pImage == "" {
            profileImageView.image = #imageLiteral(resourceName: "sidebar-default-img")
        }
    }
    
    
    //MARK: 로그인 체크 함수
    func loginCheck() {
        
        let name = gsno(userDefault.string(forKey: "name"))
        if name == "" {
            loginInfoLabel.text = "로그인이 필요합니다."
        }
        else {
            loginInfoLabel.text = "안녕하세요, \(name)님"
        }
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
            
            hiddenImageView.isHidden = false

            hiddenLeadingC.constant = 258
            hiddenTrailingC.constant = -258
            leadingC.constant = 258
            trailingC.constant = -258
            
            setNavigationBar()
            
            sideBarIsVisible = true
        
            reviewView.isUserInteractionEnabled = false
            self.navigationItem.leftBarButtonItem = nil
            self.navigationItem.titleView = nil
            
        }
        
        UIView.animate(withDuration: 0.3, delay: 0.0, options: .curveEaseIn, animations: {
            self.view.layoutIfNeeded()
        }) { (animationComplete) in
            print("The animation is complete!")
        }
    }
    
    //MARK: 사이드바 Back 액션
    @IBAction func sideBarBackAction(_ sender: Any) {
        
        hiddenImageView.isHidden = true

        hiddenLeadingC.constant = 0
        hiddenTrailingC.constant = 0
        leadingC.constant = 0
        trailingC.constant = 0
        
        sideBarIsVisible = false
        reviewView.isUserInteractionEnabled = true
        
        UIView.animate(withDuration: 0.3, delay: 0.0, options: .curveEaseIn, animations: {
            self.view.layoutIfNeeded()
        }) { (animationComplete) in
            print("SideBar close")
        }
        
        //네비게이션바 투명 복원
        self.navigationController?.navigationBar.shadowImage = UIColor( red: CGFloat(112/255.0), green: CGFloat(112/255.0), blue: CGFloat(112/255.0), alpha: CGFloat(0.2) ).as1ptImage()
        self.navigationController?.navigationBar.barTintColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        self.navigationItem.leftBarButtonItem = self.barButton
        self.navigationItem.titleView = logoImageView
        
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
        
        hiddenImageView.isHidden = true
        
        hiddenLeadingC.constant = 0
        hiddenTrailingC.constant = 0
        leadingC.constant = 0
        trailingC.constant = 0
        
        sideBarIsVisible = false
        reviewView.isUserInteractionEnabled = true
        
        UIView.animate(withDuration: 0.3, delay: 0.0, options: .curveEaseIn, animations: {
            self.view.layoutIfNeeded()
        }) { (animationComplete) in
            print("SideBar close")
        }
        
        //네비게이션바 투명 복원
        self.navigationController?.navigationBar.shadowImage = UIColor( red: CGFloat(112/255.0), green: CGFloat(112/255.0), blue: CGFloat(112/255.0), alpha: CGFloat(0.2) ).as1ptImage()
        self.navigationController?.navigationBar.barTintColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        self.navigationItem.leftBarButtonItem = self.barButton
        self.navigationItem.titleView = logoImageView
        
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
    
//MRAK: TableView
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    //섹션에 몇개의 데이터를 보여줄 것인지
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    //로우에 어떤 데이터를 보여줄건지
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row == 0 {
        
            let cell = tableView.dequeueReusableCell(withIdentifier: "MeowBoxReviewTableViewCell", for: indexPath) as! MeowBoxReviewTableViewCell
            
            cell.reviewBackgroundImageView.image = #imageLiteral(resourceName: "birthday-background-img")
            cell.reviewTitleLabel.text = reviews?.birthday.title
            cell.reviewintroLabel.text = reviews?.birthday.comment
            cell.reviewCollectionView.tag = indexPath.row
            cell.reviews = self.reviews

            return cell
            
        }
        else if indexPath.row == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "MeowBoxReviewTableViewCell", for: indexPath) as! MeowBoxReviewTableViewCell
            
            cell.reviewBackgroundImageView.backgroundColor = #colorLiteral(red: 0.8980392157, green: 0.7058823529, blue: 0.7019607843, alpha: 1)
            cell.reviewTitleLabel.text = reviews?.best_image_7.title
            cell.reviewintroLabel.text = reviews?.best_image_7.comment
            cell.reviewCollectionView.tag = indexPath.row
            
            return cell
        }
        else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "MeowBoxReviewTableViewCell", for: indexPath) as! MeowBoxReviewTableViewCell
            
            cell.reviewBackgroundImageView.backgroundColor = #colorLiteral(red: 0.8980392157, green: 0.7058823529, blue: 0.7019607843, alpha: 1)
            cell.reviewTitleLabel.text = reviews?.best_image_6.title
            cell.reviewintroLabel.text = reviews?.best_image_6.comment
            cell.reviewCollectionView.tag = indexPath.row
            
            return cell
        }
    }
    
    //MARK: 리뷰 통신
    func reviewInit() {
        ReviewService.reviewInit { (reviewData) in
            self.reviews = reviewData
            self.reviewTableView.reloadData()
        }
    }

    
    //MARK: 맨 위로 가기 액션
    @IBAction func topAction(_ sender: Any) {
        reviewTableView.setContentOffset(.zero, animated:true)
    }
    
    
    
}
