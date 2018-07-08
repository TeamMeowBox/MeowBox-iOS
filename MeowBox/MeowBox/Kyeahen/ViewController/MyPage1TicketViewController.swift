//
//  MyPage1TicketViewController.swift
//  MeowBox
//
//  Created by 김예은 on 2018. 7. 5..
//  Copyright © 2018년 yeen. All rights reserved.
//

import UIKit
import GTProgressBar

class MyPage1TicketViewController: UIViewController {


    @IBOutlet weak var progressView: GTProgressBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //1
//        let newProgress: CGFloat = progressView.progress == 0.333 ? 0.0 : 0.333
//        progressView.animateTo(progress: newProgress)
        

        //2
        let newProgress: CGFloat = progressView.progress == 0.672 ? 0.0 : 0.672
        progressView.animateTo(progress: newProgress)
        
         //Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


}
