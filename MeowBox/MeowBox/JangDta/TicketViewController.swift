//
//  TicketViewController.swift
//  MeowBox
//
//  Created by 장한솔 on 2018. 7. 5..
//  Copyright © 2018년 yeen. All rights reserved.
//

import UIKit

class TicketViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var usingTicketView: UIView!
    @IBOutlet weak var usingTicketNameLabel: UILabel!
    @IBOutlet weak var usingTicketTermLabel: UILabel!
    
    var myTicket : Ticket?
    var myTicketedArr = [Ticketed]()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        orderlist()
        
//        if myTicket == nil{
//            print("no using ticket")
//        }else{
//
//        }
        
        
        tableView.delegate = self
        tableView.dataSource = self
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(checkTicketAction))
        
        usingTicketView.addGestureRecognizer(tap)
        
        

    }
    
    @objc func checkTicketAction(){
        let checkVC = UIStoryboard(name: "Mypage2", bundle: nil).instantiateViewController(withIdentifier: "CheckTicketViewController") as! CheckTicketViewController
        
        checkVC.myTicketName = usingTicketNameLabel.text!
        checkVC.myTicketTerm = usingTicketTermLabel.text!
        checkVC.myTicketIdx = (self.myTicket?.idx)!
        
        self.navigationController?.pushViewController(checkVC, animated: true)
        
    }

    @IBAction func dismissAction(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    //MARK: 정기권 취소 액션
    @IBAction func ticketCancelAction(_ sender: Any) {
        
        let cancelPopUp = UIStoryboard(name: "MyPage", bundle: nil).instantiateViewController(withIdentifier: TicketCancelPopUpViewController.reuseIdentifier) as! TicketCancelPopUpViewController
        
        self.addChildViewController(cancelPopUp)
        cancelPopUp.view.frame = self.view.frame
        self.view.addSubview(cancelPopUp.view)
        
        cancelPopUp.didMove(toParentViewController: self)
        
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myTicketedArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TicketTableViewCell") as! TicketTableViewCell
        cell.ticketView.backgroundColor = UIColor(patternImage: #imageLiteral(resourceName: "ticket-gray-1"))
        cell.ticketNameLabel.text = myTicketedArr[indexPath.row].product
        cell.ticketTermLabel.text = myTicketedArr[indexPath.row].term
        
        if myTicketedArr[indexPath.row].flag == "0"{
            cell.termImage.image = #imageLiteral(resourceName: "once-label-pink")
        }else{
            cell.termImage.image = #imageLiteral(resourceName: "months-label-gray")
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 170
    }
    
    func orderlist(){
        OrderService.orderlist { (ticket, ticketedArr) in
            self.myTicket = ticket
            self.myTicketedArr = ticketedArr
            
            self.usingTicketView.backgroundColor = UIColor(patternImage: #imageLiteral(resourceName: "ticket-pink"))
            print(self.myTicket?.product)
            self.usingTicketNameLabel.text = self.myTicket?.product
            self.usingTicketTermLabel.text = self.myTicket?.term
            
            self.tableView.reloadData()
        }
    }
    
    

}
