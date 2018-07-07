//
//  MainViewController.swift
//  MeowBox
//
//  Created by 김예은 on 2018. 7. 1..
//  Copyright © 2018년 yeen. All rights reserved.
//

import UIKit

class MainViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    
    let imageArr = [#imageLiteral(resourceName: "package-box-img"),#imageLiteral(resourceName: "package-box-detail-img"),#imageLiteral(resourceName: "package-box-img"),#imageLiteral(resourceName: "package-box-detail-img"),#imageLiteral(resourceName: "package-box-img"),#imageLiteral(resourceName: "package-box-detail-img"),#imageLiteral(resourceName: "package-box-img"),#imageLiteral(resourceName: "package-box-detail-img")]
    
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
    
    var sideBarIsVisible = false //메뉴 상태 여부
    var panGestureRecognizer: UIPanGestureRecognizer!
    
    let logo : UIImage = UIImage(named: "meowbox-logo-pink.png")!
    let logoImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 128, height: 21))

    override func viewDidLoad() {
        super.viewDidLoad()
        
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
    
//    override func viewDidAppear(_ animated: Bool) {
//        super.viewDidAppear(animated)
//        
//        addBottomSheetView()
//        
//    }
    
//    func addBottomSheetView() {
//        // 1- Init bottomSheetVC
//        let bottomSheetVC = MainBottomViewController()
//
//        // 2- Add bottomSheetVC as a child view
//        self.addChildViewController(bottomSheetVC)
//        self.view.addSubview(bottomSheetVC.view)
//        bottomSheetVC.didMove(toParentViewController: self)
//
//        // 3- Adjust bottomSheet frame and initial position.
//        let height = view.frame.height
//        let width  = view.frame.width
//        bottomSheetVC.view.frame = CGRect(origin: CGPoint(x: 0, y: self.view.frame.maxY),size: CGSize(width: width, height:height))
//    }
    
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

    
//    //MARK: bottomView drag action
//    @objc func dragViewAction(sender : UITapGestureRecognizer) {
//        let translation = panGestureRecognizer.translation(in: self.bottomBtnView)
//        let y = self.view.frame.minY
//        self.bottomBtnView.frame = CGRect(origin: CGPoint(x: 0, y: 65), size: CGSize(width: bottomBtnView.frame.width, height: view.frame.height - 30))
//        panGestureRecognizer.setTranslation(.zero, in: self.bottomBtnView)
//
//    }
    
    //MARK: bottomView click action
    @objc func bottomViewAction(sender : UITapGestureRecognizer) {

        let bottomVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: MainBottomViewController.reuseIdentifier) as! MainBottomViewController

//        self.addChildViewController(bottomVC)
//        self.view.addSubview(bottomVC.view)
//        bottomVC.didMove(toParentViewController: self)
//        let height = view.frame.height
//        let width  = view.frame.width
//        UIView.animate(withDuration: 0.3, delay: 0, options: UIViewAnimationOptions.curveEaseIn, animations: {
//            bottomVC.view.frame = CGRect(x: 0, y: 100 , width: width, height: height - 100)
//        }, completion: { (result) in
//            // do what you want to do
//        })

//        bottomVC.view.frame = CGRect(origin: CGPoint(x: 0, y:65),
//                               size: CGSize(width: self.view.frame.width, height: self.view.frame.height))

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
        
        //네비게이션바 복원
        self.navigationItem.leftBarButtonItem = self.barButton
        self.navigationItem.titleView = self.logoImageView
    }
    
    //MARK: 로그인 액션
    @IBAction func loginAction(_ sender: Any) {
        
        let loginNaviVC = UIStoryboard(name: "Sign", bundle: nil).instantiateViewController(withIdentifier: "LoginNaviVC")
        
        self.present(loginNaviVC, animated: true, completion: nil)
    }
    
    //MARK: 홈 액션(기준)
    @IBAction func homeAction(_ sender: Any) {
        
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
        
        //네비게이션바 복원
        self.navigationItem.leftBarButtonItem = self.barButton
        self.navigationItem.titleView = self.logoImageView
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
        
        let reviewNaviVC = UIStoryboard(name: "MeowBox", bundle: nil).instantiateViewController(withIdentifier: "ReviewNaviVC")
        
        self.present(reviewNaviVC, animated: true, completion: nil)
    }
    
    //MARK: 마이페이지 액션
    @IBAction func myPageAction(_ sender: Any) {
        let myPageNaviVC = UIStoryboard(name: "MyPage", bundle: nil).instantiateViewController(withIdentifier: "MyPageNaviVC")
        
        self.present(myPageNaviVC, animated: true, completion: nil)
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
        
    }

    
}

