//
//  NoticeViewController.swift
//  MeowBox
//
//  Created by 장한솔 on 2018. 7. 7..
//  Copyright © 2018년 yeen. All rights reserved.
//

import UIKit

struct not{
    var t1: String
    var t2: String
    var t3: String
}

class NoticeViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    let notices = [not(t1: "드디어 미유박스가 출시되었습니다", t2: "07/14", t3: "안녕하세요, 미유박스 운영팀입니다. 드디어 기다리고 기다리던 미유박스가 출시되었습니다. 미유박스는 반려묘를 키우는 미유팀이 직접 반려묘를 키우면서 경험한 것을 녹여서 만든 서비스입니다. 아이들의 정보를 바탕으로 맞춤형 놀이, 음식을 보내드립니다. 기대되시죠!? 냥이들을 위한 다양한 이벤트와 행사를 준비하였으니, 많은 관심과 애정! 부탁드리겠습니다. 반려묘에게 아낌없는 사랑을 주고 싶은 Meow Box가 되겠습니다. 미유박스 운영팀 드림."),not(t1: "미유박스 주문관련 공지입니다", t2: "07/14", t3: "안녕하세요, 미유님들! 주문해주신 미유박스를 취소/반품/환불 요청은 홈페이지 고객센터 1:1 문의에 접수해주시면 감사하겠습니다. 다만, 주문취소(결제취소)의 경우 결제일로부터 매주 월요일 이전까지 가능합니다. 월요일 당일 오전 10시 이후 주문, 결제건은 배송처리를 위해 배송정보 출력 및 포장/배송진행을 위한 작업을 바로 진행하기 때문에 취소처리가 어려운점 양해해주시면 감사하겠습니다. 어려움이 있으실 경우, 고객센터로 연락주시면 자세하게 상담드리도록 하겠습니다. 미유박스 운영팀 드림.")]
    
    var selectedCell: NoticeTableViewCell? = nil
    var selectedSection = 0
    var selectedCellRow = -1
    var expandedCells   = NSMutableArray()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self

    }
    
    
    @IBAction func dismissAction(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return notices.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NoticeTableViewCell") as! NoticeTableViewCell
        cell.titleLabel.text = notices[indexPath.row].t1
        cell.dateLabel.text = notices[indexPath.row].t2
        cell.noticeLabel.text = notices[indexPath.row].t3
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedCell = tableView.cellForRow(at: indexPath) as? NoticeTableViewCell
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
                let tempTextView = selectedCell!.noticeLabel
                var frame: CGRect
                tempTextView?.text = notices[indexPath.row].t3
                frame = tempTextView!.frame
                frame.size.height = tempTextView!.intrinsicContentSize.height+15
                tempTextView!.frame = frame
                
                return 75 + frame.size.height
            }else{
                return 44
                
            }
        }else{
            return 44
            
        }
    }


}
