//
//  CheckTicketViewController.swift
//  MeowBox
//
//  Created by 장한솔 on 2018. 7. 5..
//  Copyright © 2018년 yeen. All rights reserved.
//

import UIKit
import Kingfisher

class CheckTicketViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet weak var checkTicketView: UIView!
    @IBOutlet weak var checkTicketNameLabel: UILabel!
    @IBOutlet weak var checkTicketTermLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    var myTicketIdx = ""
    
    var myTicketName = ""
    var myTicketTerm = ""
    
    var imgArr = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        checkTicketView.backgroundColor = UIColor(patternImage: #imageLiteral(resourceName: "order-page-detail-ticket"))
        checkTicketNameLabel.text = myTicketName
        checkTicketTermLabel.text = myTicketTerm
        
        orderdetaillist()

    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return imgArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CheckTicketTableViewCell") as! CheckTicketTableViewCell
        let size = self.imgArr.count
        cell.checkTicketImageView.kf.setImage(with: URL(string: imgArr[size-indexPath.row-1]),placeholder: UIImage())
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 331
    }
    
    func orderdetaillist(){
        OrderService.orderdetaillist(order_idx: myTicketIdx){ arr in
            self.imgArr = arr
          
            self.tableView.reloadData()
        }
    }

    

}
