//
//  QuestionViewController.swift
//  MeowBox
//
//  Created by 장한솔 on 2018. 7. 3..
//  Copyright © 2018년 yeen. All rights reserved.
//

import UIKit


class QuestionViewController: UIViewController, UITableViewDelegate,UITableViewDataSource {
    
    var qnalist: QnAList?
    
    var questions0 = [QnA]()
    var questions1 = [QnA]()
    var questions2 = [QnA]()
    var questions3 = [QnA]()

    
    var selectedCell: QuestionTableViewCell? = nil
    var selectedSection = 0
    var selectedCellRow = -1
    var expandedCells   = NSMutableArray()

    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        qna()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        

    }

    @IBAction func dismissAction(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0{
            return questions0.count
        }else if section == 1{
            return questions1.count
        }else if section == 2{
            return questions2.count
        }else if section == 3{
            return questions3.count
        }else{
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "QuestionTableViewCell") as! QuestionTableViewCell
        
        switch indexPath.section {
        case 0:
            cell.questionLabel.text = questions0[indexPath.row].question
            cell.answerLabel.text = questions0[indexPath.row].answer
            break
        case 1:
            cell.questionLabel.text = questions1[indexPath.row].question
            cell.answerLabel.text = questions1[indexPath.row].answer
            break
        case 2:
            cell.questionLabel.text = questions2[indexPath.row].question
            cell.answerLabel.text = questions2[indexPath.row].answer
            break
        case 3:
            cell.questionLabel.text = questions3[indexPath.row].question
            cell.answerLabel.text = questions3[indexPath.row].answer
            break
        default:
            print("default........")
            break
        }
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedCell = tableView.cellForRow(at: indexPath) as? QuestionTableViewCell
        selectedSection = indexPath.section
        selectedCellRow = indexPath.row
        if self.expandedCells.contains(indexPath) {
            self.expandedCells.remove(indexPath)
        }
        else{
            self.expandedCells.add(indexPath)
        }

        tableView.reloadData()
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if selectedCell != nil && selectedSection == indexPath.section && selectedCellRow == indexPath.row {
            if self.expandedCells.contains(indexPath) {
                let tempTextView = selectedCell!.answerLabel
                var frame: CGRect
                if indexPath.section == 0{
                    tempTextView?.text = questions0[indexPath.row].answer
                }else if indexPath.section == 1{
                    tempTextView?.text = questions1[indexPath.row].answer
                }else if indexPath.section == 2{
                    tempTextView?.text = questions2[indexPath.row].answer
                }else if indexPath.section == 3{
                    tempTextView?.text = questions3[indexPath.row].answer
                }
//                tempTextView?.text = arr[indexPath.section][indexPath.row].t2
                frame = tempTextView!.frame
                frame.size.height = tempTextView!.intrinsicContentSize.height+15
                tempTextView!.frame = frame

                return 75 + frame.size.height
            }else{
                return 50

            }
        }else{
            return 50

        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = tableView.dequeueReusableCell(withIdentifier: "QuestionHeaderTableViewCell") as! QuestionHeaderTableViewCell
        
        switch section {
        case 0:
            header.headerLabel.text = "제품"
            break
        case 1:
            header.headerLabel.text = "배송"
            break
        case 2:
            header.headerLabel.text = "포장"
            break
        case 3:
            header.headerLabel.text = "구독"
            break
        default:
            break
        }
        return header
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let footer = tableView.dequeueReusableCell(withIdentifier: "QuestionFooterTableViewCell") as! QuestionFooterTableViewCell
        
        return footer
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 12
    }
    
    func qna(){
        OrderService.qna { (list) in
            self.qnalist = list
            self.questions0 = (self.qnalist?.product)!
            self.questions1 = (self.qnalist?.delivery)!
            self.questions2 = (self.qnalist?.packing)!
            self.questions3 = (self.qnalist?.subscribe)!
            
            self.tableView.reloadData()
            
        }
    }
    

}
