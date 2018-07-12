//
//  MeowBoxDetailViewController.swift
//  MeowBox
//
//  Created by 김예은 on 2018. 7. 6..
//  Copyright © 2018년 yeen. All rights reserved.
//

import UIKit
import Kingfisher

class MeowBoxDetailViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var leadingC: NSLayoutConstraint!
    @IBOutlet weak var trailingC: NSLayoutConstraint!
//    @IBOutlet weak var hiddenLeadingC: NSLayoutConstraint!
//    @IBOutlet weak var hiddenTrailingC: NSLayoutConstraint!
//    @IBOutlet weak var hiddenImageView: UIImageView!
    
    @IBOutlet weak var barButton: UIBarButtonItem!
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var detailTableView: UITableView!
    @IBOutlet weak var detailView: UIView!
    @IBOutlet weak var loginInfoLabel: UILabel!
    @IBOutlet weak var firstLabel: UILabel!
    
    
    let logo : UIImage = UIImage(named: "meowbox-logo-pink.png")!
    let logoImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 128, height: 21))
    
    var sideBarIsVisible = false
    
    let tableImageArr = [ #imageLiteral(resourceName: "package-box-img"),#imageLiteral(resourceName: "package-box-img"),#imageLiteral(resourceName: "package-box-img"),#imageLiteral(resourceName: "package-box-img"),#imageLiteral(resourceName: "package-box-img")]
    let userDefault = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loginCheck()
        profileImageCheck()
        
//        hiddenImageView.isHidden = true
        
        //TableView
        detailTableView.delegate = self
        detailTableView.dataSource = self
//        detailTableView.contentInset = UIEdgeInsets(top: -64, left: 0, bottom: 0, right: 0)
       
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
        
        firstLabel.text =
        """
        냥이들의 트로피칼 나이트
        미유박스와 함께 한여름밤의 꿀을!
        """

    }
    
    override func viewWillAppear(_ animated: Bool) {
        profileImageCheck()
        loginCheck()
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
    
//MARK: TableView
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    //섹션에 몇개의 데이터를 보여줄 것인지
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableImageArr.count
    }
    
    //로우에 어떤 데이터를 보여줄건지
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "MeowBoxDetailTableViewCell", for: indexPath) as! MeowBoxDetailTableViewCell

            cell.detailTitle.text = "선글라스 & 모자"
            cell.detailImageView.image = tableImageArr[indexPath.row]
            cell.detailCollectionView.tag = indexPath.row
            
            return cell
        }
        else if indexPath.row == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "MeowBoxDetailTableViewCell", for: indexPath) as! MeowBoxDetailTableViewCell
            
            cell.detailTitle.text = "장난감"
            cell.detailImageView.image = tableImageArr[indexPath.row]
            cell.detailCollectionView.tag = indexPath.row
            
            return cell
        }
        else if indexPath.row == 2 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "MeowBoxDetailTableViewCell", for: indexPath) as! MeowBoxDetailTableViewCell
            
            cell.detailTitle.text = "낚시대"
            cell.detailImageView.image = tableImageArr[indexPath.row]
            cell.detailCollectionView.tag = indexPath.row
            
            return cell
        }
        else if indexPath.row == 3 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "MeowBoxDetailTableViewCell", for: indexPath) as! MeowBoxDetailTableViewCell
            
            cell.detailTitle.text = "스크래쳐"
            cell.detailImageView.image = tableImageArr[indexPath.row]
            cell.detailCollectionView.tag = indexPath.row
            
            return cell
        }
        else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "MeowBoxDetailTableViewCell", for: indexPath) as! MeowBoxDetailTableViewCell
            
            cell.detailTitle.text = "간식"
            cell.detailImageView.image = tableImageArr[indexPath.row]
            cell.detailCollectionView.tag = indexPath.row
            
            return cell
            
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
            
//            hiddenImageView.isHidden = false
//
//            hiddenLeadingC.constant = 258
//            hiddenTrailingC.constant = -258
            leadingC.constant = 258
            trailingC.constant = -258
            
            setNavigationBar()
            
            sideBarIsVisible = true
            detailView.isUserInteractionEnabled = false
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
        
//        hiddenImageView.isHidden = true
//
//        hiddenLeadingC.constant = 0
//        hiddenTrailingC.constant = 0
        leadingC.constant = 0
        trailingC.constant = 0
        
        sideBarIsVisible = false
        detailView.isUserInteractionEnabled = true
        
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
        
        let storyNaviVC = UIStoryboard(name: "MeowBox", bundle: nil).instantiateViewController(withIdentifier: "StoryNaviVC")
        
        self.present(storyNaviVC, animated: true, completion: nil)
        
    }
    
    //MARK: 생일축하해!박스 액션
    @IBAction func brithBoxAction(_ sender: Any) {
        
        let webtoonNaviVC = UIStoryboard(name: "MeowBox", bundle: nil).instantiateViewController(withIdentifier: "WebtoonNaviVC")
        
        self.present(webtoonNaviVC, animated: true, completion: nil)
        
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
    
    //MARK: 미유박스 주문하기
    @IBAction func bottomOrderButton(_ sender: Any) {
        let orderNaviVC = UIStoryboard(name: "Order", bundle: nil).instantiateViewController(withIdentifier: "OrderWithInfoNavigationController")
        
        self.present(orderNaviVC, animated: true, completion: nil)
        
    }
    
    
}
