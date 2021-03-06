//
//  OrderWithInfo3ViewController.swift
//  MeowBox
//
//  Created by 장한솔 on 2018. 7. 2..
//  Copyright © 2018년 yeen. All rights reserved.
//

import UIKit
import SelectionList

class OrderWithInfo3ViewController: UIViewController {
    @IBOutlet weak var box1View: UIView!
    @IBOutlet weak var box2View: UIView!
    @IBOutlet weak var box3View: UIView!
    @IBOutlet weak var box4View: UIView!
    @IBOutlet weak var changingLabel: UILabel!
    
    var parentVC : Order1ContainerViewController?
    let userDefault = UserDefaults.standard
    var selectProduct = "1"
    var selectPrice = "38500"
    
    @IBOutlet weak var selectionList: SelectionList!
    @IBOutlet weak var scrollView: UIScrollView!
    override func viewDidLoad() {
        super.viewDidLoad()
        userDefault.set("7월 패키지 박스", forKey: "current_order_product")

        userDefault.set(selectProduct, forKey: "order_product")
        userDefault.set(selectPrice, forKey: "order_price")

        selectionListInit()
        labelFontInit()
        boxInit()
        tapInit()
        
    }

    
    @IBAction func goWithInfo4(_ sender: Any) {
        userDefault.set(selectProduct, forKey: "order_product")
        userDefault.set(selectPrice, forKey: "order_price")
        print("3 ->  "+userDefault.string(forKey: "order_price")!)
        
        checkoverlap()
        
    }
    
    @IBAction func backWithInfo2(_ sender: Any) {
        
        guard let hasCat = userDefault.string(forKey: "cat_idx") else { return }
        if hasCat != "-1"{
            let popUPVC = UIStoryboard(name: "MyPage", bundle: nil).instantiateViewController(withIdentifier: CatHaveViewController.reuseIdentifier) as! CatHaveViewController
            self.addChildViewController(popUPVC)
            popUPVC.view.frame = self.view.frame
            self.view.addSubview(popUPVC.view)
            popUPVC.didMove(toParentViewController: self)
        }else{
            parentVC?.changeVC(num: 2)
        }
        
    }
    
    func boxInit(){
        box1View.backgroundColor = UIColor(patternImage: #imageLiteral(resourceName: "big-card-box-pink"))
        box2View.backgroundColor = UIColor(patternImage: #imageLiteral(resourceName: "card-box-white"))
        box3View.backgroundColor = UIColor(patternImage: #imageLiteral(resourceName: "card-box-white"))
        box4View.backgroundColor = UIColor(patternImage: #imageLiteral(resourceName: "card-box-white"))
    }
    
    private func selectionListInit(){
        selectionList.items = ["7월 패키지 박스","고양이는 처음이지? 박스"]
        selectionList.isSelectionMarkTrailing = false
        selectionList.selectionImage = #imageLiteral(resourceName: "radio-btn-selected")
        selectionList.deselectionImage = #imageLiteral(resourceName: "radio-btn")
        selectionList.selectedIndexes = [0]
        selectionList.tableView.isScrollEnabled = false
        selectionList.tableView.separatorColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        selectionList.addTarget(self, action: #selector(selectionChanged), for: .valueChanged)
        selectionList.setupCell = { (cell: UITableViewCell, _: Int) in
            cell.textLabel?.textColor = .gray
            
            let font = UIFont(name:"NotoSansCJKkr-Regular" , size: 14)
            let text = cell.textLabel?.text
            
            let attributedStr = NSMutableAttributedString(string: (cell.textLabel?.text)!)
            
            attributedStr.addAttribute(NSAttributedStringKey(rawValue: kCTFontAttributeName as String as String), value: font!, range: NSMakeRange(0,(text?.count)!))
            
            cell.textLabel?.attributedText = attributedStr
        }
    }
    
    @objc func selectionChanged() {
        //print("selected: \(selectionList.selectedIndex ?? 9999)")
        
        if selectionList.selectedIndex == 0{
            selectProduct = "1"
            selectPrice = "38500"
            userDefault.set("7월 패키지 박스", forKey: "current_order_product")
        }else if selectionList.selectedIndex == 1{
            selectProduct = "2"
            selectPrice = "38500"
            userDefault.set("고양이는 처음이지? 박스", forKey: "current_order_product")
        }
        box1View.backgroundColor = UIColor(patternImage: #imageLiteral(resourceName: "big-card-box-pink"))
        box2View.backgroundColor = UIColor(patternImage: #imageLiteral(resourceName: "card-box-white"))
        box3View.backgroundColor = UIColor(patternImage: #imageLiteral(resourceName: "card-box-white"))
        box4View.backgroundColor = UIColor(patternImage: #imageLiteral(resourceName: "card-box-white"))
    }
    
    func labelFontInit(){
        let font = UIFont(name:"NotoSansCJKkr-Bold" , size: 28)
        let text = changingLabel.text!
        
        let attributedStr = NSMutableAttributedString(string: changingLabel.text!)

        attributedStr.addAttribute(NSAttributedStringKey(rawValue: kCTFontAttributeName as String as String), value: font!, range: (text as NSString).range(of:"기간"))
            
        changingLabel.attributedText = attributedStr
    }
    
    func tapInit(){
        
        //box1View.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(select1View)))
        box2View.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(select2View)))
        box3View.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(select3View)))
        box4View.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(select4View)))

    }
    
//    @objc func select1View(){
//        //selectionList.selectedIndexes = [0]
//        box1View.backgroundColor = UIColor(patternImage: #imageLiteral(resourceName: "big-card-box-pink.png"))
//        box2View.backgroundColor = UIColor(patternImage: #imageLiteral(resourceName: "card-box-white.png"))
//        box3View.backgroundColor = UIColor(patternImage: #imageLiteral(resourceName: "card-box-white.png"))
//        box4View.backgroundColor = UIColor(patternImage: #imageLiteral(resourceName: "card-box-white.png"))
//    }
    
    @objc func select2View(){
        selectionList.selectedIndexes = []
        box1View.backgroundColor = UIColor(patternImage: #imageLiteral(resourceName: "big-card-box-white"))
        box2View.backgroundColor = UIColor(patternImage: #imageLiteral(resourceName: "card-box-pink"))
        box3View.backgroundColor = UIColor(patternImage: #imageLiteral(resourceName: "card-box-white"))
        box4View.backgroundColor = UIColor(patternImage: #imageLiteral(resourceName: "card-box-white"))
        selectProduct = "3"
        selectPrice = "36500"
        userDefault.set("3개월 정기권", forKey: "current_order_product")
    }
    
    @objc func select3View(){
        selectionList.selectedIndexes = []
        box1View.backgroundColor = UIColor(patternImage: #imageLiteral(resourceName: "big-card-box-white"))
        box2View.backgroundColor = UIColor(patternImage: #imageLiteral(resourceName: "card-box-white"))
        box3View.backgroundColor = UIColor(patternImage: #imageLiteral(resourceName: "card-box-pink"))
        box4View.backgroundColor = UIColor(patternImage: #imageLiteral(resourceName: "card-box-white"))
        selectProduct = "6"
        selectPrice = "34500"
        userDefault.set("6개월 정기권", forKey: "current_order_product")

    }
    
    @objc func select4View(){
        selectionList.selectedIndexes = []
        box1View.backgroundColor = UIColor(patternImage: #imageLiteral(resourceName: "big-card-box-white"))
        box2View.backgroundColor = UIColor(patternImage: #imageLiteral(resourceName: "card-box-white"))
        box3View.backgroundColor = UIColor(patternImage: #imageLiteral(resourceName: "card-box-white"))
        box4View.backgroundColor = UIColor(patternImage: #imageLiteral(resourceName: "card-box-pink"))
        selectProduct = "7"
        selectPrice = "60000"
        userDefault.set("생일축하해! 박스", forKey: "current_order_product")

    }
    
    
    func checkoverlap(){
        OrderService.checkoverlap { (message) in
            if message == "success"{
                self.parentVC?.changeVC(num: 4)
            }else{
                let popUPVC = UIStoryboard(name: "MyPage", bundle: nil).instantiateViewController(withIdentifier: TicketHaveViewController.reuseIdentifier) as! TicketHaveViewController
                self.addChildViewController(popUPVC)
                popUPVC.view.frame = self.view.frame
                self.view.addSubview(popUPVC.view)
                popUPVC.didMove(toParentViewController: self)
            }
        }
    }
    
    
}
