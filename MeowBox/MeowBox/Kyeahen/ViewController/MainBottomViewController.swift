//
//  MainBottomViewController.swift
//  MeowBox
//
//  Created by 김예은 on 2018. 7. 7..
//  Copyright © 2018년 yeen. All rights reserved.
//

import UIKit

class MainBottomViewController: UIViewController,UIGestureRecognizerDelegate{

    @IBOutlet weak var closeBtnView: UIView!
    @IBOutlet weak var catCountLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        catCountInit()
        
        //bottomView click litener
        let gesture1 = UITapGestureRecognizer(target: self, action:  #selector(self.closeViewAction))
    
        self.closeBtnView.addGestureRecognizer(gesture1)


        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func catCountInit() {
        MainService.catCountInit() { (catCountData) in
            self.catCountLabel.text = catCountData.result
            
        }
    }

    //MARK: bottomView action
    @objc func closeViewAction(sender : UITapGestureRecognizer) {
 
        self.dismiss(animated: true, completion: nil)
    }
}
