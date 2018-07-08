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
    @IBOutlet weak var ticketLabel: UILabel!
    @IBOutlet weak var useLabel: UILabel!
    @IBOutlet weak var firstLabel: UILabel!
    @IBOutlet weak var secondLabel: UILabel!
    
    var myPageTickets: MyPageTicket?
    var ticket: String = ""
    var use: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        myPageTicketInit()
        
//        if ticket == "3박스" {
//            if use == "1박스" {
//                let newProgress: CGFloat = progressView.progress == 0.333 ? 0.0 : 0.333
//                progressView.animateTo(progress: newProgress)
//
//            }
//            else if use == "2박스" {
//                let newProgress: CGFloat = progressView.progress == 0.672 ? 0.0 : 0.672
//                progressView.animateTo(progress: newProgress)
//            }
//            else {
//                let newProgress: CGFloat = progressView.progress == 0.0 ? 0.0 : 0.0
//
//            }
//
//        }
//        else if ticket == "6박스" {
//
//            if use == "2박스" {
//                let newProgress: CGFloat = progressView.progress == 0.333 ? 0.0 : 0.333
//                progressView.animateTo(progress: newProgress)
//
//            }
//            else if use == "4박스" {
//                let newProgress: CGFloat = progressView.progress == 0.672 ? 0.0 : 0.672
//                progressView.animateTo(progress: newProgress)
//            }
//
//            else {
//                let newProgress: CGFloat = progressView.progress == 0.0 ? 0.0 : 0.0
//            }
//
//        }
        

    }
    
         //Do any additional setup after loading the view.
    
    
    override func viewWillAppear(_ animated: Bool) {

        myPageTicketInit()
        
        if ticket == "3박스" {
            if use == "1박스" {
                let newProgress: CGFloat = progressView.progress == 0.333 ? 0.0 : 0.333
                progressView.animateTo(progress: newProgress)
                
            }
            else if use == "2박스" {
                let newProgress: CGFloat = progressView.progress == 0.672 ? 0.0 : 0.672
                progressView.animateTo(progress: newProgress)
            }
            else {
                let _: CGFloat = progressView.progress == 0.0 ? 0.0 : 0.0
                
            }
            
        }
        else if ticket == "6박스" {
            
            if use == "2박스" {
                let newProgress: CGFloat = progressView.progress == 0.333 ? 0.0 : 0.333
                progressView.animateTo(progress: newProgress)
                
            }
            else if use == "4박스" {
                let newProgress: CGFloat = progressView.progress == 0.672 ? 0.0 : 0.672
                progressView.animateTo(progress: newProgress)
            }
                
            else {
                let _: CGFloat = progressView.progress == 0.0 ? 0.0 : 0.0
            }
            
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: 서버 통신
    func myPageTicketInit() {
        MyPageService.MyPageTicketInit { (myPageTicketData) in
            
            self.myPageTickets = myPageTicketData
            
            self.ticketLabel.text = myPageTicketData.ticket
            self.useLabel.text = myPageTicketData.use
            
            self.ticket = myPageTicketData.ticket
            self.use = myPageTicketData.use
            
        }
    }
    


}
