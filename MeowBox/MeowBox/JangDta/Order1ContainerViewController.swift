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
        
        add(asChildViewController: withInfoVC1)
        
    }
    
    func changeVC(num : Int){
        switch num {
        case 1:
            add(asChildViewController: withInfoVC1)
            break
        case 2:
            add(asChildViewController: withInfoVC2)
            break
        case 3:
            add(asChildViewController: withInfoVC3)
            break
        case 4:
            add(asChildViewController: withInfoVC4)
            break
        case 5:
            add(asChildViewController: withInfoVC5)
            break
        default:
            add(asChildViewController: withInfoVC1)
            break
        }
    }
    
    private func add(asChildViewController viewController: UIViewController) {
        
        // Add Child View as Subview
        container.addSubview(viewController.view)
        
        // Configure Child View
        viewController.view.frame = container.bounds
        viewController.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        // Notify Child View Controller
        viewController.didMove(toParentViewController: self)
    }
    
    private func remove(asChildViewController viewController: UIViewController) {
        // Notify Child View Controller
        viewController.willMove(toParentViewController: nil)
        
        // Remove Child View From Superview
        viewController.view.removeFromSuperview()
        
        // Notify Child View Controller
        viewController.removeFromParentViewController()
    }

}
