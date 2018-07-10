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
    var latest : LatestAddress?
    
    var orderAddress : String?
    
    // NEEDS TO ORDER
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var addressTextField1: UITextField!
    @IBOutlet weak var addressTextField2: UITextField!
    @IBOutlet weak var phoneTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var totalPriceLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        userDefault.set("1", forKey: "payment_method")
        
        
        selectionListInit()
        radioInit()
        addScrollViewEndEditing()
        labelFontInit()
        
        
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        //recentaddress()
        guard let first = userDefault.string(forKey: "amIfirst") else {return }
        print("amIfirst: "+first)
        if userDefault.string(forKey: "amIfirst") == "yes"{
            isordersuccess()
        }
        
        
        guard let price = userDefault.string(forKey: "order_price") else{ return }
        print(price)
        
        totalPriceLabel.text = price+" 원"
        
        
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
        
        setOrderSetting()
        
        guard let first = userDefault.string(forKey: "amIfirst") else {return }
        print("amIfirst: "+first)
        
            let controller = Html5InicisViewController()
            self.navigationController?.pushViewController(controller, animated: true)
        
        //order()
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
        recentaddress()
    }
    
    @objc func selectCurrent(){
        currentRadioImage.image = #imageLiteral(resourceName: "radio-btn-selected")
        beforeRadioImage.image = #imageLiteral(resourceName: "radio-btn")
        cleanAddress()
    }
    
    func order(){
        print("product : "+gsno(userDefault.string(forKey: "order_product")))
        print("price : "+gsno(userDefault.string(forKey: "order_price")))
        print("payment : "+gsno(userDefault.string(forKey: "payment_method")))
        
        
        OrderService.order(name: gsno(nameTextField.text), address: self.orderAddress!, phone_number: gsno(phoneTextField.text), product: gsno(userDefault.string(forKey: "order_product")), price: gsno(userDefault.string(forKey: "order_price")), email: gsno(emailTextField.text), payment_method: gsno(userDefault.string(forKey: "payment_method"))){ message in
            if message == "success"{

            }else if message == "failure"{
                let alertView = UIAlertController(title: "주문 실패", message: "ㅜㅜㅜㅜㅜㅜ", preferredStyle: .alert)
                let ok = UIAlertAction(title: "확인", style: .default, handler: nil)
                alertView.addAction(ok)
                self.present(alertView, animated: true, completion: nil)
            }

        }
    }
    
    func recentaddress(){
        OrderService.recentaddress { (address) in
            if address == nil{
                let alertView = UIAlertController(title: "없음", message: "이전에 주문한 배송지가 없습니다.", preferredStyle: .alert)
                let ok = UIAlertAction(title: "확인", style: .default, handler: nil)
                alertView.addAction(ok)
                self.present(alertView, animated: true, completion: nil)
            }else{
                self.latest = address
                
                self.nameTextField.text = self.latest?.name
                self.addressTextField1.text = self.latest?.address
                self.phoneTextField.text = self.latest?.phone_number
                self.emailTextField.text = self.latest?.email
                
            }
        }
    }
    
    func cleanAddress(){
        nameTextField.text = ""
        addressTextField1.text = ""
        addressTextField2.text = ""
        phoneTextField.text = ""
        emailTextField.text = ""
    }
    
    
    func setOrderSetting(){
        orderAddress = "\(gsno(addressTextField1.text)) \(gsno(addressTextField2.text))"
        
        
        userDefault.set(gsno(nameTextField.text), forKey: "order_name")
        userDefault.set(orderAddress, forKey: "order_address")
        userDefault.set(gsno(phoneTextField.text), forKey: "order_phone_number")
        userDefault.set(gsno(emailTextField.text), forKey: "order_email")
    }
    
    func isordersuccess(){
        print("*******isordersuccess********")
        OrderService.isordersuccess { (message) in
            if message == "success"{
                self.order()
                self.parentVC?.changeVC(num: 5)
            }else{
                
            }
        }
    }
    
    
    
}
