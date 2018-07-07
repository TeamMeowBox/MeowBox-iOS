//
//  MainBottomViewController.swift
//  MeowBox
//
//  Created by 김예은 on 2018. 7. 7..
//  Copyright © 2018년 yeen. All rights reserved.
//

import UIKit

class MainBottomViewController: UIViewController,UIGestureRecognizerDelegate{

    @IBOutlet weak var closeBtnView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        //bottomView click litener
        let gesture1 = UITapGestureRecognizer(target: self, action:  #selector(self.closeViewAction))
    
        self.closeBtnView.addGestureRecognizer(gesture1)
        
        //bottomView drag Action
//        let gesture2 = UIPanGestureRecognizer.init(target: self, action: #selector(MainBottomViewController.panGesture))
//        view.addGestureRecognizer(gesture2)


        // Do any additional setup after loading the view.
    }
    
//    override func viewDidAppear(_ animated: Bool) {
//        super.viewDidAppear(animated)
//
//        UIView.animate(withDuration: 0.3) { [weak self] in
//            let frame = self?.view.frame
//            let yComponent = UIScreen.main.bounds.height - 200
//            self?.view.frame = CGRect(origin: CGPoint(x: 0, y: yComponent), size: CGSize(width: frame!.width, height: frame!.height))
//        }
//    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
//    @objc func panGesture(recognizer: UIPanGestureRecognizer) {
//        let translation = recognizer.translation(in: self.view)
//        let y = self.view.frame.minY
//        self.view.frame = CGRect(origin: CGPoint(x: 0, y: y + translation.y), size: CGSize(width: view.frame.width, height: view.frame.height))
//        recognizer.setTranslation(.zero, in: self.view)
//    }
    
//    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
//        let gesture = (gestureRecognizer as! UIPanGestureRecognizer)
//        let direction = gesture.velocity(in: view).y
//
//        let y = view.frame.minY
//        if (y == fullView && tableView.contentOffset.y == 0 && direction > 0) || (y == partialView) {
//            tableView.isScrollEnabled = false
//        } else {
//            tableView.isScrollEnabled = true
//        }
//
//        return false
//    }
//

    //MARK: bottomView action
    @objc func closeViewAction(sender : UITapGestureRecognizer) {
 
        self.dismiss(animated: true, completion: nil)
    }
}
