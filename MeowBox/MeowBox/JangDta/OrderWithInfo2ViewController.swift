//
//  OrderWithInfo2ViewController.swift
//  MeowBox
//
//  Created by 장한솔 on 2018. 7. 2..
//  Copyright © 2018년 yeen. All rights reserved.
//

import UIKit

class OrderWithInfo2ViewController: UIViewController {
    
    var parentVC : Order1ContainerViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func goWithInfo3(_ sender: Any) {
        parentVC?.changeVC(num: 3)
    }
    @IBAction func backWithInfo2(_ sender: Any) {
        parentVC?.changeVC(num: 1)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?){
        self.view.endEditing(true)
    }
    

}
