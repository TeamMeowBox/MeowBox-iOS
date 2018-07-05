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
    
    var parentVC : Order1ContainerViewController?
    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var selectionList: SelectionList!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        selectionListInit()
        addScrollViewEndEditing()
    }
    
    @objc func selectionChanged() {
        print(selectionList.selectedIndexes)
    }
    
    @IBAction func goPay(_ sender: Any) {
        parentVC?.changeVC(num: 5)
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
    
}
