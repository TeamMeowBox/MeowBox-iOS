//
//  QuestionViewController.swift
//  MeowBox
//
//  Created by 장한솔 on 2018. 7. 3..
//  Copyright © 2018년 yeen. All rights reserved.
//

import UIKit

struct que{
    var t1 : String
    var t2 : String
}

class QuestionViewController: UIViewController, UITableViewDelegate,UITableViewDataSource {
    
    
    let questions1 = [que(t1: "Q.간식과 사료의 성분을 알 수 있을까요?", t2: "미유박스를 받으시면 간식/사료 포장 뒷면에 성분이 표기되어 있습니다."),que(t1: "Q.장난감은 같은 것으로 구성되어 있나요?", t2: "장난감은 매달 컨셉에 맞게 다른 상품으로 구성됩니다."), que(t1: "Q.크기는 어느정도 되나요?", t2: "미유박스는 350x240x150(mm)의 상자에 상품이 담겨 배송됩니다.")]
    
    let questions2 = [que(t1: "Q2.간식과 사료의 성분을 알 수 있을까요?", t2: "미유박스를 받으시면 간식/사료 포장 뒷면에 성분이 표기되어 있습니다."),que(t1: "Q2.장난감은 같은 것으로 구성되어 있나요?", t2: "장난감은 매달 컨셉에 맞게 다른 상품으로 구성됩니다."), que(t1: "Q2.크기는 어느정도 되나요?", t2: "미유박스는 350x240x150(mm)의 상자에 상품이 담겨 배송됩니다.")]
    
    let questions3 = [que(t1: "Q3.간식과 사료의 성분을 알 수 있을까요?", t2: "미유박스를 받으시면 간식/사료 포장 뒷면에 성분이 표기되어 있습니다."),que(t1: "Q3.장난감은 같은 것으로 구성되어 있나요?", t2: "장난감은 매달 컨셉에 맞게 다른 상품으로 구성됩니다."), que(t1: "Q3.크기는 어느정도 되나요?", t2: "미유박스는 350x240x150(mm)의 상자에 상품이 담겨 배송됩니다.")]
    
    let questions4 = [que(t1: "Q4.간식과 사료의 성분을 알 수 있을까요?", t2: "미유박스를 받으시면 간식/사료 포장 뒷면에 성분이 표기되어 있습니다."),que(t1: "Q4.장난감은 같은 것으로 구성되어 있나요?", t2: "장난감은 매달 컨셉에 맞게 다른 상품으로 구성됩니다."), que(t1: "Q4.크기는 어느정도 되나요?", t2: "미유박스는 350x240x150(mm)의 상자에 상품이 담겨 배송됩니다.")]
    
    
    var selectedCell: QuestionTableViewCell? = nil
    var selectedSection = 0
    var selectedCellRow = -1
    var expandedCells   = NSMutableArray()
    var arr = [[que]]()

    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        arr.append(questions1)
        arr.append(questions2)
        arr.append(questions3)
        arr.append(questions4)
        
        tableView.delegate = self
        tableView.dataSource = self
        
        

    }

    @IBAction func dismissAction(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return arr.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arr[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "QuestionTableViewCell") as! QuestionTableViewCell
        
        switch indexPath.section {
        case 0:
            cell.questionLabel.text = arr[0][indexPath.row].t1
            cell.answerLabel.text = arr[0][indexPath.row].t2
            break
        case 1:
            cell.questionLabel.text = arr[1][indexPath.row].t1
            cell.answerLabel.text = arr[1][indexPath.row].t2
            break
        case 2:
            cell.questionLabel.text = arr[2][indexPath.row].t1
            cell.answerLabel.text = arr[2][indexPath.row].t2
            break
        case 3:
            cell.questionLabel.text = arr[3][indexPath.row].t1
            cell.answerLabel.text = arr[3][indexPath.row].t2
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
                tempTextView?.text = arr[indexPath.section][indexPath.row].t2
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
        return 20
    }
    

}
