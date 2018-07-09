//
//  OrderWithInfo4ViewController.swift
//  MeowBox
//
//  Created by 장한솔 on 2018. 7. 2..
//  Copyright © 2018년 yeen. All rights reserved.
//

import UIKit
import SelectionList

class OrderWithInfo4ViewController: UIViewController {
    @IBOutlet weak var beforeAddressView: UIView!
    @IBOutlet weak var currentAddressView: UIView!
    
    @IBOutlet weak var beforeRadioImage: UIImageView!
    @IBOutlet weak var currentRadioImage: UIImageView!
    var parentVC : Order1ContainerViewController?
    @IBOutlet weak var changingLabel: UILabel!
    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var selectionList: SelectionList!
    
    let userDefault = UserDefaults.standard
    
    // NEEDS TO ORDER
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var addressTextField1: UITextField!
    @IBOutlet weak var addressTextField2: UITextField!
    @IBOutlet weak var phoneTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        userDefault.set("1", forKey: "payment_method")
        selectionListInit()
        radioInit()
        addScrollViewEndEditing()
        labelFontInit()
    }
    
    @objc func selectionChanged() {
        //print(selectionList.selectedIndexes)
        print(selectionList.selectedIndex)
        if selectionList.selectedIndex == 0{ // 신용카드
            userDefault.set("1", forKey: "payment_method")
        }else{ // 현금
            userDefault.set("2", forKey: "payment_method")
        }
    }
    
    @IBAction func goPay(_ sender: Any) {
        order()
    }
    
    @IBAction func backWithInfo3(_ sender: Any) {
        parentVC?.changeVC(num: 3)
    }
    
    private func selectionListInit(){
        selectionList.items = ["신용카드","휴대폰 결제"]
        selectionList.isSelectionMarkTrailing = false
        selectionList.selectionImage = #imageLiteral(resourceName: "radio-btn-selected")
        selectionList.deselectionImage = #imageLiteral(resourceName: "radio-btn")
        selectionList.selectedIndexes = [0]
        selectionList.tableView.isScrollEnabled = false
        selectionList.tableView.separatorColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        selectionList.addTarget(self, action: #selector(selectionChanged), for: .valueChanged)
        selectionList.setupCell = { (cell: UITableViewCell, _: Int) in
            cell.textLabel?.textColor = .gray
        }
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
        let text = changingLabel.text!
        
        let attributedStr = NSMutableAttributedString(string: changingLabel.text!)
        
        attributedStr.addAttribute(NSAttributedStringKey(rawValue: kCTFontAttributeName as String as String), value: font!, range: (text as NSString).range(of:"정보"))
        
        changingLabel.attributedText = attributedStr
    }
    
    func radioInit(){
        beforeAddressView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(selectBefore)))
        currentAddressView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(selectCurrent)))
    }
    
    @objc func selectBefore(){
        beforeRadioImage.image = #imageLiteral(resourceName: "radio-btn-selected")
        currentRadioImage.image = #imageLiteral(resourceName: "radio-btn")
    }
    
    @objc func selectCurrent(){
        currentRadioImage.image = #imageLiteral(resourceName: "radio-btn-selected")
        beforeRadioImage.image = #imageLiteral(resourceName: "radio-btn")
    }
    
    func order(){
        print("product : "+gsno(userDefault.string(forKey: "order_product")))
        print("price : "+gsno(userDefault.string(forKey: "order_price")))
        print("payment : "+gsno(userDefault.string(forKey: "payment_method")))


        let orderAddress = "\(gsno(addressTextField1.text)) \(gsno(addressTextField2.text))"
        OrderService.order(name: gsno(nameTextField.text), address: orderAddress, phone_number: gsno(phoneTextField.text), product: gsno(userDefault.string(forKey: "order_product")), price: gsno(userDefault.string(forKey: "order_price")), email: gsno(emailTextField.text), payment_method: gsno(userDefault.string(forKey: "payment_method"))){ message in
            if message == "success"{
                self.parentVC?.changeVC(num: 5)
            }else if message == "failure"{
                let alertView = UIAlertController(title: "주문 실패", message: "ㅜㅜㅜㅜㅜㅜ", preferredStyle: .alert)
                let ok = UIAlertAction(title: "확인", style: .default, handler: nil)
                alertView.addAction(ok)
                self.present(alertView, animated: true, completion: nil)
            }else if message == "bad_request"{
                let alertView = UIAlertController(title: "중복", message: "사용중인 정기권이 있습니다", preferredStyle: .alert)
                let ok = UIAlertAction(title: "확인", style: .default, handler: nil)
                alertView.addAction(ok)
                self.present(alertView, animated: true, completion: nil)
            }
            
        }
    }
    
    
    
}
