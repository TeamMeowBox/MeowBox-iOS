//
//  TicketCancelPopUpViewController.swift
//  MeowBox
//
//  Created by 김예은 on 2018. 7. 4..
//  Copyright © 2018년 yeen. All rights reserved.
//

import UIKit

class TicketCancelPopUpViewController: UIViewController {

    @IBOutlet weak var ticketTextView: UITextView!
    
    @IBOutlet weak var ticketView: UIView!
    @IBOutlet weak var ticketCloseBtn: UIButton!
    @IBOutlet weak var ticketEditBtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.showAnimate()
        
        ticketTextView.text = "배송일을 기준으로\n남은 박스가 취소됩니다!"
        
        ticketView.layer.borderColor = #colorLiteral(red: 0.8666666667, green: 0.8666666667, blue: 0.8666666667, alpha: 1)
        ticketView.layer.borderWidth = 1
        ticketView.layer.cornerRadius = 5
        
        ticketCloseBtn.clipsToBounds = true
        ticketCloseBtn.layer.cornerRadius = 5
        ticketCloseBtn.layer.maskedCorners = [.layerMinXMaxYCorner]
        
        ticketEditBtn.clipsToBounds = true
        ticketEditBtn.layer.cornerRadius = 5
        ticketEditBtn.layer.maskedCorners = [.layerMaxXMaxYCorner]
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func showAnimate()
    {
        self.view.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
        self.view.alpha = 0.0;
        UIView.animate(withDuration: 0.25, animations: {
            self.view.alpha = 1.0
            self.view.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
        });
    }
    
    func removeAnimate()
    {
        UIView.animate(withDuration: 0.25, animations: {
            self.view.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
            self.view.alpha = 0.0;
        }, completion:{(finished : Bool)  in
            if (finished)
            {
                self.view.removeFromSuperview()
            }
        });
    }
    
    
    //MARK: 취소하기 액션
    @IBAction func closeAction(_ sender: Any) {
        self.removeAnimate()
    }
    
    //MARK: 입력하기 액션
    @IBAction func editAction(_ sender: Any) {
        //어디로 가는지?
    }
    
}

