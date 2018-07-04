//
//  OrderWithInfo2ViewController.swift
//  MeowBox
//
//  Created by 장한솔 on 2018. 7. 2..
//  Copyright © 2018년 yeen. All rights reserved.
//

import UIKit

class OrderWithInfo2ViewController: UIViewController {
    
    @IBOutlet weak var smallImage: UIImageView!
    @IBOutlet weak var mediumImage: UIImageView!
    @IBOutlet weak var largeImage: UIImageView!
    
    var parentVC : Order1ContainerViewController?
    
    @IBOutlet weak var scrollView: UIScrollView!
    override func viewDidLoad() {
        super.viewDidLoad()

        let tap1 = UITapGestureRecognizer(target: self, action: #selector(selectSmall))
        let tap2 = UITapGestureRecognizer(target: self, action: #selector(selectMedium))
        let tap3 = UITapGestureRecognizer(target: self, action: #selector(selectLarge))
        
        smallImage.addGestureRecognizer(tap1)
        mediumImage.addGestureRecognizer(tap2)
        largeImage.addGestureRecognizer(tap3)
        
        selectSmall()
        
    }
    
    @objc func selectSmall(){
       smallImage.image = #imageLiteral(resourceName: "small-cat-card-pink.png")
        mediumImage.image = #imageLiteral(resourceName: "medium-cat-card-gray.png")
        largeImage.image = #imageLiteral(resourceName: "large-cat-card-gray.png")
    }
    
    @objc func selectMedium(){
        smallImage.image = #imageLiteral(resourceName: "small-cat-card-gray.png")
        mediumImage.image = #imageLiteral(resourceName: "medium-cat-card-pink.png")
        largeImage.image = #imageLiteral(resourceName: "large-cat-card-gray.png")
    }
    
    @objc func selectLarge(){
        smallImage.image = #imageLiteral(resourceName: "small-cat-card-gray.png")
        mediumImage.image = #imageLiteral(resourceName: "medium-cat-card-gray.png")
        largeImage.image = #imageLiteral(resourceName: "large-cat-card-pink.png")
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
