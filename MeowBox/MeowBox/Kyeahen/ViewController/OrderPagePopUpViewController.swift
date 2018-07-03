//
//  OrderPagePopUpViewController.swift
//  MeowBox
//
//  Created by 김예은 on 2018. 7. 4..
//  Copyright © 2018년 yeen. All rights reserved.
//

import UIKit

class OrderPagePopUpViewController: UIViewController {
    
    @IBOutlet weak var orderPopupTextView: UITextView!
    @IBOutlet weak var orderPopupView: UIView!
    @IBOutlet weak var orderCloseBtn: UIButton!
    @IBOutlet weak var orderEditBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.showAnimate()

        orderPopupTextView.text = "나의 고양이 정보를 입력하여\n나의 고양이에게 꼭 맞는 박스를 받아보세요!"
        
        orderPopupView.layer.borderColor = #colorLiteral(red: 0.8666666667, green: 0.8666666667, blue: 0.8666666667, alpha: 1)
        orderPopupView.layer.borderWidth = 1
        orderPopupView.layer.cornerRadius = 5
        
        orderCloseBtn.clipsToBounds = true
        orderCloseBtn.layer.cornerRadius = 5
        orderCloseBtn.layer.maskedCorners = [.layerMinXMaxYCorner]
        
        orderEditBtn.clipsToBounds = true
        orderEditBtn.layer.cornerRadius = 5
        orderEditBtn.layer.maskedCorners = [.layerMaxXMaxYCorner]
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
        let orderNaviVC = UIStoryboard(name: "Order", bundle: nil).instantiateViewController(withIdentifier: "OrderWithInfoNavigationController")
        
        self.present(orderNaviVC, animated: true, completion: nil)
    }
    
    

}
