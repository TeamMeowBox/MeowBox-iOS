//
//  OrderWithInfoViewController.swift
//  MeowBox
//
//  Created by 장한솔 on 2018. 7. 1..
//  Copyright © 2018년 yeen. All rights reserved.
//

import UIKit

class OrderWithInfoViewController: UIViewController {
    
    var parentVC : Order1ContainerViewController?

    override func viewDidLoad() {
        super.viewDidLoad()

        
    }


    @IBAction func goWithInfo2(_ sender: Any) {
        parentVC?.changeVC(num: 2)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?){
        self.view.endEditing(true)
    }
    
    
    



}
