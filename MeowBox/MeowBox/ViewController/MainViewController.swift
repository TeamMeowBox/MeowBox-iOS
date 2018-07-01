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
    
    //MARK: 네비게이션 바 투명하게 하는 함수
    func setNavigationBar() {
        let bar: UINavigationBar! = self.navigationController?.navigationBar
        
        bar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        
        bar.shadowImage = UIImage()
        bar.backgroundColor = UIColor.clear
    }
    
    
}

