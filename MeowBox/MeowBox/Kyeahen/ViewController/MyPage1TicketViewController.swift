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
        
        print("111")
        myPageTicketInit()
        print("2222")


    }
    
         //Do any additional setup after loading the view.

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: 서버 통신
    func myPageTicketInit() {
        MyPageService.MyPageTicketInit { (myPageTicketData) in
            
            print("컨테이너 서버 진입")
            
            self.myPageTickets = myPageTicketData
            self.ticketLabel.text = myPageTicketData.ticket
            self.useLabel.text = myPageTicketData.use
            
            if myPageTicketData.ticket == "3박스" {
                if myPageTicketData.use == "1박스" {
                    let newProgress: CGFloat = self.progressView.progress == 0.333 ? 0.0 : 0.333
                    self.progressView.animateTo(progress: newProgress)
                    
                }
                else if myPageTicketData.use == "2박스" {
                    let newProgress: CGFloat = self.progressView.progress == 0.672 ? 0.0 : 0.672
                    self.progressView.animateTo(progress: newProgress)
                }
                else if myPageTicketData.use == "3박스" {
                    let newProgress: CGFloat = self.progressView.progress == 1 ? 0.0 : 1
                    self.progressView.animateTo(progress: newProgress)
                }
                else {
                    let newProgress: CGFloat = self.progressView.progress == 0.0 ? 0.0 : 0.0
                    
                }
                
            }
            else if myPageTicketData.ticket == "6박스" {
                
                if myPageTicketData.use == "1박스" {
                    let newProgress: CGFloat = self.progressView.progress == 0.1665 ? 0.0 : 0.1665
                    self.progressView.animateTo(progress: newProgress)
                    
                }
                else if myPageTicketData.use == "2박스" {
                    let newProgress: CGFloat = self.progressView.progress == 0.333 ? 0.0 : 0.333
                    self.progressView.animateTo(progress: newProgress)
                    
                }
                else if myPageTicketData.use == "3박스" {
                    let newProgress: CGFloat = self.progressView.progress == 0.450 ? 0.0 : 0.450
                    self.progressView.animateTo(progress: newProgress)
                }
                    
                else if myPageTicketData.use == "4박스" {
                    let newProgress: CGFloat = self.progressView.progress == 0.672 ? 0.0 : 0.672
                    self.progressView.animateTo(progress: newProgress)
                }
                else if myPageTicketData.use == "5박스" {
                    let newProgress: CGFloat = self.progressView.progress == 0.8 ? 0.0 : 0.8
                    self.progressView.animateTo(progress: newProgress)
                }
                else if myPageTicketData.use == "6박스" {
                    let newProgress: CGFloat = self.progressView.progress == 1 ? 0.0 : 1
                    self.progressView.animateTo(progress: newProgress)
                }
                else {
                    let newProgress: CGFloat = self.progressView.progress == 0.0 ? 0.0 : 0.0
                }
                
            }
            
        }
    }
    


}
