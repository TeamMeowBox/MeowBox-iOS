//
//  MeowBoxDetailTableViewCell.swift
//  MeowBox
//
//  Created by 김예은 on 2018. 7. 6..
//  Copyright © 2018년 yeen. All rights reserved.
//

import UIKit

class MeowBoxDetailTableViewCell: UITableViewCell,UICollectionViewDataSource, UICollectionViewDelegate{
    
    @IBOutlet weak var detailTitle: UILabel!
    @IBOutlet weak var detailImageView: UIImageView!
    @IBOutlet weak var detailContent: UITextView!
    @IBOutlet weak var detailCollectionView: UICollectionView!

    
    let collectImageArr = [#imageLiteral(resourceName: "package-box-img"),#imageLiteral(resourceName: "package-box-detail-img"),#imageLiteral(resourceName: "package-box-img")]
    let indicatorArr = [#imageLiteral(resourceName: "indicator-first"), #imageLiteral(resourceName: "indicator-second"), #imageLiteral(resourceName: "indicator-third")]

    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.detailCollectionView.delegate = self
        self.detailCollectionView.dataSource = self

        
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    //MARK: CollectionView
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return collectImageArr.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell: MeowBoxDetailCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "MeowBoxDetailCollectionViewCell", for: indexPath) as? MeowBoxDetailCollectionViewCell
        {
        cell.collectionImageView.image = collectImageArr[indexPath.row]
        cell.collectionLabel.text = "시원해지는 원단"
        cell.collectionTextView.text =
            """
            물에 닿으면 차가워지는 쿨 원단 소재.
            모자를 물로 적시고 짜기만 하면
            얼음처럼 시원해집니다.
            """

        cell.collectionPageControl.currentPage = indexPath.row
        
        return cell
        }
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }


}

extension MeowBoxDetailTableViewCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.frame.width, height: (548/375)*self.frame.width)
    }
}


