//
//  BirthViewController.swift
//  MeowBox
//
//  Created by 김예은 on 2018. 7. 12..
//  Copyright © 2018년 yeen. All rights reserved.
//

import UIKit
import Kingfisher

class BirthViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var barButton: UIBarButtonItem!
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var loginStatusLabel: UILabel!
    @IBOutlet weak var secondSectionLabel: UILabel!
    
    //sideBar var
    @IBOutlet weak var leadingC: NSLayoutConstraint!
    @IBOutlet weak var trailingC: NSLayoutConstraint!
    @IBOutlet weak var hiddenLeadingC: NSLayoutConstraint!
    @IBOutlet weak var hiddenTrailingC: NSLayoutConstraint!
    @IBOutlet weak var hiddenImageView: UIImageView!
    @IBOutlet weak var birthView: UIView!
    @IBOutlet weak var bottomBtn: UIButton!
    

    @IBOutlet weak var birthTableView: UITableView!
    
    let logo : UIImage = UIImage(named: "meowbox-logo-pink.png")!
    let logoImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 128, height: 21))
    let userDefault = UserDefaults.standard
    
    let birthArr = [#imageLiteral(resourceName: "ribbon_one_img-1"), #imageLiteral(resourceName: "cake-one-img-1"), #imageLiteral(resourceName: "birthday-toy-one-img-1"), #imageLiteral(resourceName: "scratcher-one-img-2"), #imageLiteral(resourceName: "snack-one-img-1")]
    
    var sideBarIsVisible = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loginCheck()
        profileImageCheck()
        
        hiddenImageView.isHidden = true
        
        //tableView
        self.birthTableView.dataSource = self
        self.birthTableView.delegate = self
        
        secondSectionLabel.text =
        """
        하나뿐인 나의 냥이에게 생일파티를!
        미유박스가 함께 축하해드려요
        """
        
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

    }
    
    override func viewWillAppear(_ animated: Bool) {
        loginCheck()
        profileImageCheck()
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
            loginStatusLabel.text = "로그인이 필요합니다."
        }
        else {
            loginStatusLabel.text = "안녕하세요, \(name)님"
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: TableView
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return birthArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: BirthTableViewCell.reuseIdentifier, for: indexPath) as! BirthTableViewCell
            
            cell.tableViewLabel.text = "꼬깔모자 & 리본타이"
            cell.tableImageView.image = birthArr[indexPath.row]
            cell.tag = indexPath.row
            
            return cell
        }
        else if indexPath.row == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: BirthTableViewCell.reuseIdentifier, for: indexPath) as! BirthTableViewCell
            
            cell.tableViewLabel.text = "케이크 & 가랜드"
            cell.tableImageView.image = birthArr[indexPath.row]
            cell.tag = indexPath.row
            
            return cell
        }
        else if indexPath.row == 2 {
            let cell = tableView.dequeueReusableCell(withIdentifier: BirthTableViewCell.reuseIdentifier, for: indexPath) as! BirthTableViewCell
            
            cell.tableViewLabel.text = "장난감"
            cell.tableImageView.image = birthArr[indexPath.row]
            cell.tag = indexPath.row
            
            return cell
        }
        else if indexPath.row == 3 {
            let cell = tableView.dequeueReusableCell(withIdentifier: BirthTableViewCell.reuseIdentifier, for: indexPath) as! BirthTableViewCell
            
            cell.tableViewLabel.text = "스크래쳐"
            cell.tableImageView.image = birthArr[indexPath.row]
            cell.tag = indexPath.row
            
            return cell
        }
        else {
            let cell = tableView.dequeueReusableCell(withIdentifier: BirthTableViewCell.reuseIdentifier, for: indexPath) as! BirthTableViewCell
            
            cell.tableViewLabel.text = "간식"
            cell.tableImageView.image = birthArr[indexPath.row]
            cell.tag = indexPath.row
            
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
    
 
    
    //MARK: 미유박스 주문하기

    @IBAction func bottomOrderAction(_ sender: Any) {
        
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
    
    
    //MARK: 사이드 바
    @IBAction func barButtonAction(_ sender: Any) {
        
                if !sideBarIsVisible { //메뉴 보여줘야함
        
                    hiddenImageView.isHidden = false

                    hiddenLeadingC.constant = 258
                    hiddenTrailingC.constant = -258
                    leadingC.constant = 258
                    trailingC.constant = -258
        
                    sideBarIsVisible = true
                    setNavigationBar()
                    
                    self.navigationItem.leftBarButtonItem = nil
                    self.navigationItem.titleView = nil
        
                    bottomBtn.isUserInteractionEnabled = false
                    birthView.isUserInteractionEnabled = false
        
        
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
        
                bottomBtn.isUserInteractionEnabled = true
                birthView.isUserInteractionEnabled = true
        
        
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
    
    //MARK: 홈 액션(기준)
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

}
