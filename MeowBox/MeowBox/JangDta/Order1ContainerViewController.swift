//
//  Order1ContainerViewController.swift
//  MeowBox
//
//  Created by 장한솔 on 2018. 7. 4..
//  Copyright © 2018년 yeen. All rights reserved.
//

import UIKit

class Order1ContainerViewController: UIViewController {
    
    private lazy var withInfoVC1: OrderWithInfoViewController = {
        var viewController = UIStoryboard(name: "Order", bundle: nil).instantiateViewController(withIdentifier: "OrderWithInfoViewController") as! OrderWithInfoViewController
        viewController.parentVC = self
        self.addChildViewController(viewController)
        return viewController
    }()
    
    private lazy var withInfoVC2: OrderWithInfo2ViewController = {
        var viewController = UIStoryboard(name: "Order", bundle: nil).instantiateViewController(withIdentifier: "OrderWithInfo2ViewController") as! OrderWithInfo2ViewController
        viewController.parentVC = self
        self.addChildViewController(viewController)
        return viewController
    }()
    
    private lazy var withInfoVC3: OrderWithInfo3ViewController = {
        var viewController = UIStoryboard(name: "Order", bundle: nil).instantiateViewController(withIdentifier: "OrderWithInfo3ViewController") as! OrderWithInfo3ViewController
        viewController.parentVC = self
        self.addChildViewController(viewController)
        return viewController
    }()
    
    private lazy var withInfoVC4: OrderWithInfo4ViewController = {
        var viewController = UIStoryboard(name: "Order", bundle: nil).instantiateViewController(withIdentifier: "OrderWithInfo4ViewController") as! OrderWithInfo4ViewController
        viewController.parentVC = self
        self.addChildViewController(viewController)
        return viewController
    }()
    
    private lazy var withInfoVC5: OrderCompleteViewController = {
        var viewController = UIStoryboard(name: "Order", bundle: nil).instantiateViewController(withIdentifier: "OrderCompleteViewController") as! OrderCompleteViewController
        viewController.parentVC = self
        self.addChildViewController(viewController)
        return viewController
    }()
    
    @IBOutlet weak var container: UIView!


    override func viewDidLoad() {
        super.viewDidLoad()
        
        container.addSubview(withInfoVC1.view)
        
    }
    
    func changeVC(num : Int){
        switch num {
        case 1:
            container.addSubview(withInfoVC1.view)
            break
        case 2:
            container.addSubview(withInfoVC2.view)
            break
        case 3:
            container.addSubview(withInfoVC3.view)
            break
        case 4:
            container.addSubview(withInfoVC4.view)
            break
        case 5:
            container.addSubview(withInfoVC5.view)
            break
        default:
            container.addSubview(withInfoVC1.view)
            break
        }
    }


}
