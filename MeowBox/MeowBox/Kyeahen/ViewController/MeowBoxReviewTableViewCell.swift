//
//  MeowBoxReviewTableViewCell.swift
//  MeowBox
//
//  Created by 김예은 on 2018. 7. 7..
//  Copyright © 2018년 yeen. All rights reserved.
//

import UIKit

class MeowBoxReviewTableViewCell: UITableViewCell, UICollectionViewDelegate, UICollectionViewDataSource {
    
    @IBOutlet weak var reviewBackgroundImageView: UIImageView!
    @IBOutlet weak var reviewTitleLabel: UILabel!
    @IBOutlet weak var reviewintroLabel: UILabel!
    @IBOutlet weak var collectionPageControl: UIPageControl!
    @IBOutlet weak var reviewCollectionView: UICollectionView!
    
    let collectImageArr = [#imageLiteral(resourceName: "package-box-img"),#imageLiteral(resourceName: "package-box-detail-img"),#imageLiteral(resourceName: "package-box-img")]

    override func awakeFromNib() {
        super.awakeFromNib()
        
        reviewCollectionView.delegate = self
        reviewCollectionView.dataSource = self
        
        reviewCollectionView.backgroundColor = UIColor.clear
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
        if let cell: MeowBoxReviewCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "MeowBoxReviewCollectionViewCell", for: indexPath) as? MeowBoxReviewCollectionViewCell
        {
            cell.reviewImageView.image = collectImageArr[indexPath.row]
            cell.reviewTag.text = "#냥냥이 #고양이"
            cell.reviewID.text = "@kyeahen"
            cell.reviewPageControl.currentPage = indexPath.row
            
            return cell
        }
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }

}

extension MeowBoxReviewTableViewCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.frame.width, height: (381/375)*self.frame.width)
    }
}
