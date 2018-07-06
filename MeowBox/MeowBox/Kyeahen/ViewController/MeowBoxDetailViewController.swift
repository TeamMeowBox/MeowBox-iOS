//
//  MeowBoxDetailViewController.swift
//  MeowBox
//
//  Created by 김예은 on 2018. 7. 6..
//  Copyright © 2018년 yeen. All rights reserved.
//

import UIKit

class MeowBoxDetailViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var leadingC: NSLayoutConstraint!
    @IBOutlet weak var trailingC: NSLayoutConstraint!
    
    @IBOutlet weak var barButton: UIBarButtonItem!
    @IBOutlet weak var profileImageView: UIImageView!
    
    @IBOutlet weak var detailTableView: UITableView!
    
    var sideBarIsVisible = false
    
    let tableImageArr = [#imageLiteral(resourceName: "package-box-img"),]
    let collectImageArr = [#imageLiteral(resourceName: "package-box-img"),#imageLiteral(resourceName: "package-box-detail-img"),#imageLiteral(resourceName: "package-box-img")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //TableView
        detailTableView.delegate = self
        detailTableView.dataSource = self
    
       
        setNavigationBar()
        detailTableView.contentInset = UIEdgeInsets(top: -64, left: 0, bottom: 0, right: 0)
        
        self.navigationItem.backBarButtonItem = barButton
        
        //프로필 이미지 동그랗게
        profileImageView.layer.masksToBounds = true
        profileImageView.layer.cornerRadius = profileImageView.layer.frame.width/2

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
        let cell = tableView.dequeueReusableCell(withIdentifier: "MeowBoxDetailTableViewCell", for: indexPath) as! MeowBoxDetailTableViewCell

        cell.detailTitle.text = "죠스 쿨링 모자"
        cell.detailImageView.image = tableImageArr[indexPath.row]
        cell.detailContent.text =
            """
            더운 여름을 시원한 바다로 만들어 줄
            쿨 원단으로 만들어진 모자입니다.
            귀여운 사진은 덤, 시원한 여름은 필수입니다.
            """
        
        return cell
    }
    
    
    //MARK: 네비게이션 바 투명하게 하는 함수
    func setNavigationBar() {
        let bar: UINavigationBar! = self.navigationController?.navigationBar
        
        bar.setBackgroundImage(UIImage(), for: .default)
        
        bar.shadowImage = UIImage()
        //bar.backgroundColor = UIColor.clear
        bar.isTranslucent = true
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
