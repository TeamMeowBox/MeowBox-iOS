//
//  OrderWithInfoViewController.swift
//  MeowBox
//
//  Created by 장한솔 on 2018. 7. 1..
//  Copyright © 2018년 yeen. All rights reserved.
//

import UIKit

class OrderWithInfoViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
    }


    @IBAction func goWithInfo2(_ sender: Any) {
        let vc = UIStoryboard(name: "Order", bundle: nil).instantiateViewController(withIdentifier: "OrderWithInfo2ViewController") as! OrderWithInfo2ViewController
        
        self.navigationController?.pushViewController(vc, animated: true)
    }
    



}
