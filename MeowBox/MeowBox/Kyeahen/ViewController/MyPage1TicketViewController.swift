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
        let newProgress: CGFloat = progressView.progress == 0.333 ? 0.0 : 0.333
        progressView.animateTo(progress: newProgress)
        

        //2
//        let newProgress: CGFloat = progressView.progress == 0.67 ? 0.0 : 0.67
//        progressView.animateTo(progress: newProgress)
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
