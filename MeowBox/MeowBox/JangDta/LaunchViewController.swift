//
//  LaunchViewController.swift
//  MeowBox
//
//  Created by 장한솔 on 2018. 7. 11..
//  Copyright © 2018년 yeen. All rights reserved.
//

import UIKit
import Lottie

class LaunchViewController: UIViewController {
    
        var animationView : LOTAnimationView?

    override func viewDidLoad() {
        super.viewDidLoad()

        playLaunch()
    }
    

    func playLaunch(){
        
        animationView = LOTAnimationView(name: "meow_box_splash_4")
        animationView?.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height)
        animationView?.center = self.view.center
        animationView?.contentMode = .scaleAspectFill
        
        self.view.addSubview(animationView!)
        
        animationView?.play(completion: { (finished) in
            if finished{
                let nav = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "MainNaviVC")
                self.present(nav, animated: true, completion: nil)
            }
        })
        
        
    }

}
