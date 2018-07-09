//
//  CheckTicketViewController.swift
//  MeowBox
//
//  Created by 장한솔 on 2018. 7. 5..
//  Copyright © 2018년 yeen. All rights reserved.
//

import UIKit

class CheckTicketViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet weak var checkTicketView: UIView!
    @IBOutlet weak var checkTicketNameLabel: UILabel!
    @IBOutlet weak var checkTicketTermLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    var myTicketIdx = ""
    
    var myTicketName = ""
    var myTicketTerm = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        checkTicketView.backgroundColor = UIColor(patternImage: #imageLiteral(resourceName: "order-page-detail-ticket"))
        checkTicketNameLabel.text = myTicketName
        checkTicketTermLabel.text = myTicketTerm

    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CheckTicketTableViewCell") as! CheckTicketTableViewCell
        if indexPath.row == 0{
            cell.checkTicketImageView.image = #imageLiteral(resourceName: "baking-img.png")
        }else{
            cell.checkTicketImageView.image = #imageLiteral(resourceName: "space-img.png")
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 331
    }
    
    func orderdetaillist(){
        
    }

    

}
