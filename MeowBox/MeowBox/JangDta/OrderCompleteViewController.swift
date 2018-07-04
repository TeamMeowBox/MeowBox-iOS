//
//  OrderCompleteViewController.swift
//  MeowBox
//
//  Created by 장한솔 on 2018. 7. 2..
//  Copyright © 2018년 yeen. All rights reserved.
//

import UIKit

class OrderCompleteViewController: UIViewController {
    
    var parentVC : Order1ContainerViewController?

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    
    @IBAction func goHome(_ sender: Any) {
        let mainNaviVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "MainNaviVC")
        
        self.present(mainNaviVC, animated: true, completion: nil)
    }
    
    
}
