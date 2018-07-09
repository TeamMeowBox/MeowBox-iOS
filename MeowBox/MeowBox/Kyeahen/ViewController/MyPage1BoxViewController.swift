//
//  MyPage1BoxViewController.swift
//  MeowBox
//
//  Created by 김예은 on 2018. 7. 5..
//  Copyright © 2018년 yeen. All rights reserved.
//

import UIKit
import Alamofire
import Kingfisher

class MyPage1BoxViewController: UIViewController {
    
    @IBOutlet weak var textImageView: UIImageView!
    
    var myPageNoneTickets: MyPageNoneTicket? 
    
    override func viewDidLoad() {
        super.viewDidLoad()

        myPageNoneTicketInit() //서버 통신
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    //MARK: *서버 통신*
    //TODO: 고양이 이름, 유저이름 넣기
    func myPageNoneTicketInit() {
        print("서버통신")
        MyPageService.myPageNoneTicketInit{ (myPageNoneTicketData) in
            
            self.myPageNoneTickets = myPageNoneTicketData
            self.textImageView.kf.setImage(with: URL(string: (self.myPageNoneTickets?.sendImage)!), placeholder: UIImage())

        }
    }


}
