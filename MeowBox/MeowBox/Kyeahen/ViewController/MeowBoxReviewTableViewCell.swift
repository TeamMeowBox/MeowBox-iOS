//
//  MeowBoxReviewTableViewCell.swift
//  MeowBox
//
//  Created by 김예은 on 2018. 7. 7..
//  Copyright © 2018년 yeen. All rights reserved.
//

import UIKit
import Kingfisher

class MeowBoxReviewTableViewCell: UITableViewCell{
    
    @IBOutlet weak var reviewBackgroundImageView: UIImageView!
    @IBOutlet weak var reviewTitleLabel: UILabel!
    @IBOutlet weak var reviewintroLabel: UILabel!
    @IBOutlet weak var reviewCollectionView: UICollectionView! {
        didSet {
            reviewCollectionView.dataSource = self
        }
    }
    
    let collectImageArr = [#imageLiteral(resourceName: "package-box-img"),#imageLiteral(resourceName: "package-box-detail-img"),#imageLiteral(resourceName: "package-box-img")]
    
    var reviews: Review?

    override func awakeFromNib() {
        super.awakeFromNib()
        
        reviewCollectionView.backgroundColor = UIColor.clear
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    

}

extension MeowBoxReviewTableViewCell: UICollectionViewDataSource {
    
    //MARK: CollectionView
    
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
                
                //                if reviews?.birthday.image_list[indexPath.row] == "" {
                //                    cell.reviewImageView.image = #imageLiteral(resourceName: "meowbox-logo-pink")
                //                }
                //
                //                cell.reviewImageView.kf.setImage(with: URL(string: (reviews?.birthday.image_list[indexPath.row])!), placeholder: #imageLiteral(resourceName: "meowbox-logo-pink"))
                //
                if let url = URL(string: gsno(reviews?.birthday.image_list[indexPath.row])){
                    cell.reviewImageView.kf.setImage(with: url)
                } else {
                    
                }
                cell.reviewTag.text = reviews?.birthday.hashtag[indexPath.row]
                cell.reviewID.text = reviews?.birthday.insta_id[indexPath.row]
                cell.reviewPageControl.currentPage = indexPath.row
                
                return cell
            }
            return UICollectionViewCell()
        }
            
        else if tag == 1 {
            if let cell: MeowBoxReviewCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "MeowBoxReviewCollectionViewCell", for: indexPath) as? MeowBoxReviewCollectionViewCell
            {
                
                //                if reviews?.best7_image.image_list[indexPath.row] == "" {
                //                    cell.reviewImageView.image = #imageLiteral(resourceName: "meowbox-logo-pink")
                //                }
                //                cell.reviewImageView.kf.setImage(with: URL(string: (reviews?.best7_image.image_list[indexPath.row])!), placeholder: #imageLiteral(resourceName: "meowbox-logo-pink"))
                
                if let url = URL(string: gsno(reviews?.best7_image.image_list[indexPath.row])){
                    cell.reviewImageView.kf.setImage(with: url)
                } else {
                    
                }
                cell.reviewTag.text = reviews?.best7_image.hashtag[indexPath.row]
                cell.reviewID.text = reviews?.best7_image.insta_id[indexPath.row]
                cell.reviewPageControl.currentPage = indexPath.row
                
                return cell
            }
            return UICollectionViewCell()
        }
            
        else {
            if let cell: MeowBoxReviewCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "MeowBoxReviewCollectionViewCell", for: indexPath) as? MeowBoxReviewCollectionViewCell
            {
                
                //                if reviews?.best6_image.image_list[indexPath.row] == "" {
                //                    cell.reviewImageView.image = #imageLiteral(resourceName: "meowbox-logo-pink")
                //                }
                //
                //                cell.reviewImageView.kf.setImage(with: URL(string: (reviews?.best6_image.image_list[indexPath.row])!), placeholder: #imageLiteral(resourceName: "meowbox-logo-pink"))
                
                if let url = URL(string: gsno(reviews?.best6_image.image_list[indexPath.row])){
                    cell.reviewImageView.kf.setImage(with: url)
                } else {
                    
                }
                
                cell.reviewTag.text = reviews?.best6_image.hashtag[indexPath.row]
                cell.reviewID.text = reviews?.best6_image.insta_id[indexPath.row]
                cell.reviewPageControl.currentPage = indexPath.row
                
                return cell
            }
            return UICollectionViewCell()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
}

extension UITableViewCell {
    func gsno(_ value: String?) -> String { //String 옵셔널 벗기기
        return value ?? ""
    }
    
    func gino(_ value: Int?) -> Int { //Int 옵셔널 벗기기
        return value ?? 0
    }
}

extension MeowBoxReviewTableViewCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.frame.width, height: (381/375)*self.frame.width)
    }
}
