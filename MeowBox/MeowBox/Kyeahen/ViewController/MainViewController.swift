//
//  MainViewController.swift
//  MeowBox
//
//  Created by 김예은 on 2018. 7. 1..
//  Copyright © 2018년 yeen. All rights reserved.
//

import UIKit
import Lottie
import Kingfisher

class MainViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    
    let imageArr = [#imageLiteral(resourceName: "home-package-box-img"),#imageLiteral(resourceName: "home-package-box-detail-img"),#imageLiteral(resourceName: "home-birthday-box-img"),#imageLiteral(resourceName: "home-birthday-box-detail-img"),#imageLiteral(resourceName: "home-coming-soon-img")]
    let userDefault = UserDefaults.standard
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var pageControl: UIPageControl!
    
    @IBOutlet weak var leadingC: NSLayoutConstraint!
    @IBOutlet weak var trailingC: NSLayoutConstraint!
    @IBOutlet weak var hiddenLeadingC: NSLayoutConstraint!
    @IBOutlet weak var hiddenTrailingC: NSLayoutConstraint!
    
    @IBOutlet weak var hiddenImageView: UIImageView!
    @IBOutlet weak var MainView: UIView!
    @IBOutlet weak var barButton: UIBarButtonItem!
    
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var bottomBtnView: UIView!
    @IBOutlet weak var loginInfoLabel: UILabel!
    
    var sideBarIsVisible = false //메뉴 상태 여부
    var panGestureRecognizer: UIPanGestureRecognizer!
    
    let logo : UIImage = UIImage(named: "meowbox-logo-pink.png")!
    let logoImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 128, height: 21))
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.barButton.tintColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        print(userDefault.string(forKey: "cat_idx"))
        print(gsno(userDefault.string(forKey: "image_profile")))
        userDefault.set("yes", forKey: "amIfirst")
        
        loginCheck()
        profileImageCheck()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.decelerationRate = UIScrollViewDecelerationRateFast
        
        //navigation bar titleview
        logoImageView.contentMode = .scaleAspectFit
        logoImageView.image = logo
        navigationItem.titleView = logoImageView
        
        hiddenImageView.isHidden = true
        setNavigationBar()
        self.navigationItem.backBarButtonItem = barButton
        self.navigationItem.titleView = logoImageView
        
        //프로필 이미지 동그랗게
        profileImage.layer.masksToBounds = true
        profileImage.layer.cornerRadius = profileImage.layer.frame.width/2
        profileImage.kf.setImage(with: URL(string: gsno(userDefault.string(forKey: "image_profile"))), placeholder: UIImage())
        
        //bottomView click litener
        let gesture = UITapGestureRecognizer(target: self, action:  #selector(self.bottomViewAction))
        self.bottomBtnView.addGestureRecognizer(gesture)
        
        //bottomView conerRadius
        bottomBtnView.clipsToBounds = true
        bottomBtnView.layer.cornerRadius = 5
        bottomBtnView.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        
        //bottomview shadow
        bottomBtnView.layer.shadowColor = #colorLiteral(red: 0.8392156863, green: 0.8392156863, blue: 0.8392156863, alpha: 1)
        bottomBtnView.layer.shadowOpacity = 6
        bottomBtnView.layer.shadowOffset = CGSize.zero
        bottomBtnView.layer.shadowRadius = 5
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        loginCheck()
        profileImageCheck()
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
    
    func profileImageCheck() {
        let pImage = gsno(userDefault.string(forKey: "image_profile"))
        if pImage == "" {
            profileImage.image = #imageLiteral(resourceName: "sidebar-default-img")
        }
    }
    
    //MARK: 네비게이션 바 투명하게 하는 함수
    func setNavigationBar() {
        let bar: UINavigationBar! = self.navigationController?.navigationBar
        
        bar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)

        bar.shadowImage = UIImage()
        bar.backgroundColor = UIColor.clear
    }
    
    //MARK: bottomView click action
    @objc func bottomViewAction(sender : UITapGestureRecognizer) {

        let bottomVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: MainBottomViewController.reuseIdentifier) as! MainBottomViewController

        self.present(bottomVC, animated: true, completion: nil)
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
            self.navigationItem.titleView = nil
            
            bottomBtnView.isUserInteractionEnabled = false
            MainView.isUserInteractionEnabled = false
            
            
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
        
        bottomBtnView.isUserInteractionEnabled = true
        MainView.isUserInteractionEnabled = true
        
        
        UIView.animate(withDuration: 0.3, delay: 0.0, options: .curveEaseIn, animations: {
            self.view.layoutIfNeeded()
        }) { (animationComplete) in
            print("SideBar close")
        }
        
        //네비게이션바 복원
        self.navigationItem.leftBarButtonItem = self.barButton
        self.navigationItem.titleView = self.logoImageView
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
        
        hiddenImageView.isHidden = true
        
        hiddenLeadingC.constant = 0
        hiddenTrailingC.constant = 0
        leadingC.constant = 0
        trailingC.constant = 0
        
        sideBarIsVisible = false
        
        bottomBtnView.isUserInteractionEnabled = true
        MainView.isUserInteractionEnabled = true
        
        UIView.animate(withDuration: 0.3, delay: 0.0, options: .curveEaseIn, animations: {
            self.view.layoutIfNeeded()
        }) { (animationComplete) in
            print("SideBar close")
        }
        
        //네비게이션바 복원
        self.navigationItem.leftBarButtonItem = self.barButton
        self.navigationItem.titleView = self.logoImageView
    }
    
    //MARK: 미유박스 이야기 액션
    @IBAction func storyAction(_ sender: Any) {

        let storyNaviVC = UIStoryboard(name: "MeowBox", bundle: nil).instantiateViewController(withIdentifier: "StoryNaviVC")
        
        self.present(storyNaviVC, animated: true, completion: nil)
        
    }
    
    //MARK: 생일축하해!박스 액션
    @IBAction func birthBoxAction(_ sender: Any) {
        
        let webtoonNaviVC = UIStoryboard(name: "MeowBox", bundle: nil).instantiateViewController(withIdentifier: "WebtoonNaviVC")
        
        self.present(webtoonNaviVC, animated: true, completion: nil)

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
    
    //MARK: 상세보기 액션
    @IBAction func detailAction(_ sender: Any) {
        let detailVC = UIStoryboard(name: "MeowBox", bundle: nil).instantiateViewController(withIdentifier: "MeowBoxDetailNaviVC")
        
        self.present(detailVC, animated: true, completion: nil)
    }
    
    
    
    ///
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        pageControl.numberOfPages = imageArr.count
        return imageArr.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MainCollectionViewCell", for: indexPath) as! MainCollectionViewCell
        
        cell.imageView.image = imageArr[indexPath.row]
        cell.button.setImage(#imageLiteral(resourceName: "home-detail-btn-gray"), for: .normal)
        
        if indexPath.row == 1 || indexPath.row == 2 || indexPath.row == 3{
            cell.button.tintColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        }else{
            cell.button.tintColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        let pageWidth = Float(325)
        let targetXContentOffset = Float(targetContentOffset.pointee.x)
        let contentWidth = Float(collectionView!.contentSize.width  )
        var newPage = Float(self.pageControl.currentPage)
        
        if velocity.x == 0 {
            newPage = floor( (targetXContentOffset - Float(pageWidth) / 2) / Float(pageWidth)) + 1.0
        } else {
            newPage = Float(velocity.x > 0 ? self.pageControl.currentPage + 1 : self.pageControl.currentPage - 1)
            if newPage < 0 {
                newPage = 0
            }
            if (newPage > contentWidth / pageWidth) {
                newPage = ceil(contentWidth / pageWidth) - 1.0
            }
        }
        
        self.pageControl.currentPage = Int(newPage)
        let point = CGPoint (x: CGFloat(newPage * pageWidth), y: targetContentOffset.pointee.y)
        targetContentOffset.pointee = point
        
        let current = self.pageControl.currentPage
        
        if current == 0{
            self.barButton.tintColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        }else{
            self.barButton.tintColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        }
        
    }

}

