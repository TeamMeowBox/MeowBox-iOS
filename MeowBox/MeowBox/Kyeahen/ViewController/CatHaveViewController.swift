//
//  CatHaveViewController.swift
//  MeowBox
//
//  Created by 김예은 on 2018. 7. 12..
//  Copyright © 2018년 yeen. All rights reserved.
//

import UIKit

class CatHaveViewController: UIViewController {

    @IBOutlet weak var popView: UIView!
    @IBOutlet weak var okBtn: UIButton!
    @IBOutlet weak var textView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        showAnimate()
        
        popView.layer.cornerRadius = 5
        
        okBtn.clipsToBounds = true
        okBtn.layer.cornerRadius = 5
        okBtn.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMaxYCorner]

        textView.text =
        """
        고양이 정보는
        마이페이지에서 수정할 수 있어요
        """
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

    //MARK: 창닫기 액션
    @IBAction func okAction(_ sender: Any) {
        removeAnimate()
    }
    
}
