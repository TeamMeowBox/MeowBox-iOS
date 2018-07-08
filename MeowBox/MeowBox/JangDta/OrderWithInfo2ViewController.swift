//
//  OrderWithInfo2ViewController.swift
//  MeowBox
//
//  Created by 장한솔 on 2018. 7. 2..
//  Copyright © 2018년 yeen. All rights reserved.
//

import UIKit

class OrderWithInfo2ViewController: UIViewController {
    
    var catName = ""
    
    var catSize = "0"
    
    @IBOutlet weak var smallImage: UIImageView!
    @IBOutlet weak var mediumImage: UIImageView!
    @IBOutlet weak var largeImage: UIImageView!
    @IBOutlet weak var specialTextView: UITextView!
    
    @IBOutlet weak var changingLabel: UILabel!
    
    let userDefault = UserDefaults.standard
    
    var parentVC : Order1ContainerViewController?
    let datePicker = UIDatePicker()
    
    @IBOutlet weak var birthTextField: UITextField!
    @IBOutlet weak var scrollView: UIScrollView!
    override func viewDidLoad() {
        super.viewDidLoad()

        let tap1 = UITapGestureRecognizer(target: self, action: #selector(selectSmall))
        let tap2 = UITapGestureRecognizer(target: self, action: #selector(selectMedium))
        let tap3 = UITapGestureRecognizer(target: self, action: #selector(selectLarge))
        
        smallImage.addGestureRecognizer(tap1)
        mediumImage.addGestureRecognizer(tap2)
        largeImage.addGestureRecognizer(tap3)
        
        specialTextView.layer.borderWidth = 1
        specialTextView.layer.borderColor = #colorLiteral(red: 0.5999526381, green: 0.6000267267, blue: 0.5999273658, alpha: 1)
        
        catName = (parentVC?.myCatName)!
        
        labelFontInit()
        addScrollViewEndEditing()
        initDatePicker()
        selectSmall()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        catName = (parentVC?.myCatName)!
    }
    
    
    
    @objc func selectSmall(){
       smallImage.image = #imageLiteral(resourceName: "small-cat-card-pink.png")
        mediumImage.image = #imageLiteral(resourceName: "medium-cat-card-gray.png")
        largeImage.image = #imageLiteral(resourceName: "large-cat-card-gray.png")
        catSize = "0"
    }
    
    @objc func selectMedium(){
        smallImage.image = #imageLiteral(resourceName: "small-cat-card-gray.png")
        mediumImage.image = #imageLiteral(resourceName: "medium-cat-card-pink.png")
        largeImage.image = #imageLiteral(resourceName: "large-cat-card-gray.png")
        catSize = "1"
    }
    
    @objc func selectLarge(){
        smallImage.image = #imageLiteral(resourceName: "small-cat-card-gray.png")
        mediumImage.image = #imageLiteral(resourceName: "medium-cat-card-gray.png")
        largeImage.image = #imageLiteral(resourceName: "large-cat-card-pink.png")
        catSize = "2"
    }
    
    func catsignUp(){
        CatService.catSignup(name: catName, size: catSize, birthday: gsno(birthTextField.text), caution: gsno(specialTextView.text)){ message in
            if message == "success"{
                self.parentVC?.changeVC(num: 3)
            }else if message == "failure"{
                let alertView = UIAlertController(title: "고양이 등록 실패", message: "ㅜㅜㅜ", preferredStyle: .alert)
                let ok = UIAlertAction(title: "확인", style: .default, handler: nil)
                alertView.addAction(ok)
                self.present(alertView, animated: true, completion: nil)
            }
        }
    }
    
    @IBAction func goWithInfo3(_ sender: Any) {
        catsignUp()
    }
    @IBAction func backWithInfo2(_ sender: Any) {
        parentVC?.myCatName = ""
        parentVC?.changeVC(num: 1)
    }
    
    func addScrollViewEndEditing(){
        let singleTapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(scrollTapMethod))
        singleTapGestureRecognizer.numberOfTapsRequired = 1
        singleTapGestureRecognizer.isEnabled = true
        singleTapGestureRecognizer.cancelsTouchesInView = false
        scrollView.addGestureRecognizer(singleTapGestureRecognizer)
    }
    
    @objc func scrollTapMethod(sender: UITapGestureRecognizer) {
        self.view.endEditing(true)
    }
    
    func labelFontInit(){
        let font = UIFont(name:"NotoSansCJKkr-Bold" , size: 28)
        changingLabel.text = catName+"에 대해"
        let text = changingLabel.text!
        
        let attributedStr = NSMutableAttributedString(string: changingLabel.text!)
        
        attributedStr.addAttribute(NSAttributedStringKey(rawValue: kCTFontAttributeName as String as String), value: font!, range: (text as NSString).range(of:catName))
        
        changingLabel.attributedText = attributedStr
    }

    
}

extension OrderWithInfo2ViewController  {
    
    func initDatePicker(){
        
        datePicker.datePickerMode = .date
        
        let dateFormatter = DateFormatter()
        
        dateFormatter.dateFormat = "yyyy.MM.dd"
        
        guard let date = dateFormatter.date(from: "1996.01.29") else {
            fatalError("포맷과 맞지 않아 데이터 변환이 실패했습니다")
        }
        
        datePicker.date = date
        
        datePicker.maximumDate = Date()
        
        
        setTextfieldView(textField: birthTextField, selector: #selector(selectedDatePicker), inputView: datePicker)
    }
    
    func setTextfieldView(textField:UITextField, selector : Selector, inputView : Any){
        
        let bar = UIToolbar()
        bar.sizeToFit()
        
        let doneButton = UIBarButtonItem(title: "확인", style: .done
            , target: self, action: selector)
        
        bar.setItems([doneButton], animated: true)
        textField.inputAccessoryView = bar
        
        if let tempView = inputView as? UIView {
            textField.inputView = tempView
        }
        if let tempView = inputView as? UIControl {
            textField.inputView = tempView
        }
        
    }
    
    @objc func selectedDatePicker(){
        
        let dateformatter = DateFormatter()
        dateformatter.dateFormat = "yyyy-MM-dd"
        
        let date = dateformatter.string(from: datePicker.date)
        
        birthTextField.text = date
        
        view.endEditing(true)
    }
    
}
