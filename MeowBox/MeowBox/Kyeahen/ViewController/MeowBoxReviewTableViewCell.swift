//
//  MeowBoxReviewTableViewCell.swift
//  MeowBox
//
//  Created by 김예은 on 2018. 7. 7..
//  Copyright © 2018년 yeen. All rights reserved.
//

import UIKit
import Kingfisher

class MeowBoxReviewTableViewCell: UITableViewCell, UICollectionViewDelegate, UICollectionViewDataSource {
    
    @IBOutlet weak var reviewBackgroundImageView: UIImageView!
    @IBOutlet weak var reviewTitleLabel: UILabel!
    @IBOutlet weak var reviewintroLabel: UILabel!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var reviewCollectionView: UICollectionView!

    let collectImageArr = [#imageLiteral(resourceName: "package-box-img"),#imageLiteral(resourceName: "package-box-detail-img"),#imageLiteral(resourceName: "package-box-img")]
    
    var reviews: Review?
    var currentPages = 0

    override func awakeFromNib() {
        super.awakeFromNib()
        
        reviewInit()
        
        reviewCollectionView.delegate = self
        reviewCollectionView.dataSource = self
        reviewCollectionView.backgroundColor = UIColor.clear
        // Initialization code
        
        //MARK: CollectionView
        
        
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if tag == 0 {
            if let cell: MeowBoxReviewCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "MeowBoxReviewCollectionViewCell", for: indexPath) as? MeowBoxReviewCollectionViewCell
            {
                
                if let url = URL(string: gsno(reviews?.birthday.image_list[indexPath.row])){
                    cell.reviewImageView.kf.setImage(with: url)
                } else {
                    
                }
                cell.reviewTag.text = reviews?.birthday.hashtag[indexPath.row]
                cell.reviewID.text = reviews?.birthday.insta_id[indexPath.row]
                
                return cell
            }
            return UICollectionViewCell()
        }
            
        else if tag == 1 {
            if let cell: MeowBoxReviewCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "MeowBoxReviewCollectionViewCell", for: indexPath) as? MeowBoxReviewCollectionViewCell
            {
                
                if let url = URL(string: gsno(reviews?.best_image_7.image_list[indexPath.row])){
                    cell.reviewImageView.kf.setImage(with: url)
                } else {
                    
                }
                cell.reviewTag.text = reviews?.best_image_7.hashtag[indexPath.row]
                cell.reviewID.text = reviews?.best_image_7.insta_id[indexPath.row]
                
                return cell
            }
            return UICollectionViewCell()
        }
            
        else {
            if let cell: MeowBoxReviewCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "MeowBoxReviewCollectionViewCell", for: indexPath) as? MeowBoxReviewCollectionViewCell
            {
                
                if let url = URL(string: gsno(reviews?.best_image_6.image_list[indexPath.row])){
                    cell.reviewImageView.kf.setImage(with: url)
                } else {
                    
                }
                cell.reviewTag.text = reviews?.best_image_6.hashtag[indexPath.row]
                cell.reviewID.text = reviews?.best_image_6.insta_id[indexPath.row]
                
                return cell
            }
            return UICollectionViewCell()
        }
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        self.pageControl.currentPage = 0
        self.reviewCollectionView.scrollToItem(at: IndexPath(row: 0, section: 0), at: .left, animated: false)
    }
    
    //ScrollView delegate method
    func scrollViewDidScroll(_ scrollView: UIScrollView)
    {
        if scrollView == reviewCollectionView {
        let pageWidth = scrollView.frame.width
        self.currentPages = Int((scrollView.contentOffset.x + pageWidth / 2) / pageWidth)
        self.pageControl.currentPage = self.currentPages
        }
    }
    
 
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    //MARK: 리뷰 통신
    func reviewInit() {
        ReviewService.reviewInit { (reviewData) in
            self.reviews = reviewData
            self.reviewCollectionView.reloadData()
        }
    }
    
    
    

}

extension MeowBoxReviewTableViewCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.frame.width, height: (381/375)*self.frame.width)
    }
}
