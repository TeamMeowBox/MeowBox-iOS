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
    @IBOutlet weak var detailCollectionView: UICollectionView!
    @IBOutlet weak var pageControl: UIPageControl!
    
    var currentPages = 0
    
    
    let collectImageArr = [#imageLiteral(resourceName: "package-box-img"),#imageLiteral(resourceName: "package-box-detail-img"),#imageLiteral(resourceName: "package-box-img")]

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
        
        if tag == 0 {
            if let cell: MeowBoxDetailCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "MeowBoxDetailCollectionViewCell", for: indexPath) as? MeowBoxDetailCollectionViewCell
            {
            cell.collectionImageView.image = collectImageArr[indexPath.row]
            cell.collectionLabel.text = "시원해지는 원단"

            
            return cell
            }
            return UICollectionViewCell()
        }
        else if tag == 1 {
            if let cell: MeowBoxDetailCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "MeowBoxDetailCollectionViewCell", for: indexPath) as? MeowBoxDetailCollectionViewCell
            {
                cell.collectionImageView.image = collectImageArr[indexPath.row]
                cell.collectionLabel.text = "시원해지는 원단"
                
                
                return cell
            }
            return UICollectionViewCell()
        }
        else if tag == 2 {
            if let cell: MeowBoxDetailCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "MeowBoxDetailCollectionViewCell", for: indexPath) as? MeowBoxDetailCollectionViewCell
            {
                cell.collectionImageView.image = collectImageArr[indexPath.row]
                cell.collectionLabel.text = "시원해지는 원단"
                
                
                return cell
            }
            return UICollectionViewCell()
        }
        else if tag == 3 {
            if let cell: MeowBoxDetailCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "MeowBoxDetailCollectionViewCell", for: indexPath) as? MeowBoxDetailCollectionViewCell
            {
                cell.collectionImageView.image = collectImageArr[indexPath.row]
                cell.collectionLabel.text = "시원해지는 원단"
                
                
                return cell
            }
            return UICollectionViewCell()
        }
        else {
            if let cell: MeowBoxDetailCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "MeowBoxDetailCollectionViewCell", for: indexPath) as? MeowBoxDetailCollectionViewCell
            {
                cell.collectionImageView.image = collectImageArr[indexPath.row]
                cell.collectionLabel.text = "시원해지는 원단"
                
                
                return cell
            }
            return UICollectionViewCell()
        }
    }
    
    //ScrollView delegate method
    func scrollViewDidScroll(_ scrollView: UIScrollView)
    {
        let pageWidth = scrollView.frame.width
        self.currentPages = Int((scrollView.contentOffset.x + pageWidth / 2) / pageWidth)
        self.pageControl.currentPage = self.currentPages
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }


}

extension MeowBoxDetailTableViewCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.frame.width, height: (291/375)*self.frame.width)
    }
}


