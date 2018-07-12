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
    let userDeafult = UserDefaults.standard

    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var changingLabel: UILabel!
    @IBOutlet weak var catNameTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        labelFontInit()
    }


    @IBAction func goWithInfo2(_ sender: Any) {
        //parentVC?.myCatName = catNameTextField.text!
        
        if catNameTextField.text == "" || catNameTextField.text == nil{
            nextButton.shake()
        }else{
            Cat.shared.name = catNameTextField.text
            parentVC?.changeVC(num: 2)
        }
        
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?){
        self.view.endEditing(true)
    }
    
    func labelFontInit(){
        let font = UIFont(name:"NotoSansCJKkr-Bold" , size: 28)
        let text = changingLabel.text!
        
        let attributedStr = NSMutableAttributedString(string: changingLabel.text!)
        
        attributedStr.addAttribute(NSAttributedStringKey(rawValue: kCTFontAttributeName as String as String), value: font!, range: (text as NSString).range(of:"이름"))
        
        changingLabel.attributedText = attributedStr
    }



}
