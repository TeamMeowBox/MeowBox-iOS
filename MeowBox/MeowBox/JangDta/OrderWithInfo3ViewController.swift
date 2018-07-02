//
//  OrderWithInfo3ViewController.swift
//  MeowBox
//
//  Created by 장한솔 on 2018. 7. 2..
//  Copyright © 2018년 yeen. All rights reserved.
//

import UIKit

class OrderWithInfo3ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    
    @IBAction func goWithInfo4(_ sender: Any) {
        let vc = UIStoryboard(name: "Order", bundle: nil).instantiateViewController(withIdentifier: "OrderWithInfo4ViewController") as! OrderWithInfo4ViewController
        
        self.navigationController?.pushViewController(vc, animated: true)
    }
    

}
