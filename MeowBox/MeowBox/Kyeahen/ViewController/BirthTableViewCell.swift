//
//  BirthTableViewCell.swift
//  MeowBox
//
//  Created by 김예은 on 2018. 7. 12..
//  Copyright © 2018년 yeen. All rights reserved.
//

import UIKit

class BirthTableViewCell: UITableViewCell, UICollectionViewDelegate, UICollectionViewDataSource {
    
    @IBOutlet weak var tableViewLabel: UILabel!
    @IBOutlet weak var tableImageView: UIImageView!
    @IBOutlet weak var birthCollectionView: UICollectionView!
    @IBOutlet weak var tablePageControl: UIPageControl!
    
    var currentPage = 0
    var imageArr = [#imageLiteral(resourceName: "birthday-background-img.png"), #imageLiteral(resourceName: "baking-img.png"), #imageLiteral(resourceName: "birthday-period-img.png")]
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.birthCollectionView.delegate = self
        self.birthCollectionView.dataSource = self
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
        return imageArr.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if tag == 0 {
            if let cell: BirthCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: BirthCollectionViewCell.reuseIdentifier, for: indexPath) as? BirthCollectionViewCell
            {
                cell.collectionImageView.image = imageArr[indexPath.row]
                cell.collectionLabel.text =
                """
                생일 축하해요! 이 모자와 리본을 착용한 순간,
                오늘의 주인공은 바로 당신!
                """
            
                
                return cell
            }
            return UICollectionViewCell()
        }
        else if tag == 1 {
            
            if let cell: BirthCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: BirthCollectionViewCell.reuseIdentifier, for: indexPath) as? BirthCollectionViewCell
            {
                cell.collectionImageView.image = imageArr[indexPath.row]
                cell.collectionLabel.text =
                """
                함께 기뻐하기를 바라는 마음을 가득 담아,
                냥이가 먹을 수 있는 특별한 케이크를 만들었어요
                """
            
                return cell
            }
            return UICollectionViewCell()
        }
        else if tag == 2  {
            
            if let cell: BirthCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: BirthCollectionViewCell.reuseIdentifier, for: indexPath) as? BirthCollectionViewCell
            {
                cell.collectionImageView.image = imageArr[indexPath.row]
                cell.collectionLabel.text =
                """
                냥이와 케미 폭발할 아기자기한 인형,
                가지고 놀기 딱 좋은 사이즈로 만들었어요.
                """
                
                return cell
            }
            return UICollectionViewCell()
        }
        else if tag == 3 {
            if let cell: BirthCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: BirthCollectionViewCell.reuseIdentifier, for: indexPath) as? BirthCollectionViewCell
            {
                cell.collectionImageView.image = imageArr[indexPath.row]
                cell.collectionLabel.text =
                """
                스트레스를 해소해 줄 스크래쳐.
                한 번 긁으면, 멈출 수 없을 걸?
                """
                
                return cell
            }
            return UICollectionViewCell()
        }
        else {
            if let cell: BirthCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: BirthCollectionViewCell.reuseIdentifier, for: indexPath) as? BirthCollectionViewCell
            {
                cell.collectionImageView.image = imageArr[indexPath.row]
                cell.collectionLabel.text =
                """
                영양소를 그대로 담은 동결건조 닭가슴살,
                맛과 건강 둘 다 놓치지 않을 거예요!
                """
                
                return cell
            }
            return UICollectionViewCell()
            
        }
    }
    
    
    //ScrollView delegate method
    func scrollViewDidScroll(_ scrollView: UIScrollView)
    {
        let pageWidth = scrollView.frame.width
        self.currentPage = Int((scrollView.contentOffset.x + pageWidth / 2) / pageWidth)
        self.tablePageControl.currentPage = self.currentPage
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    

}

extension BirthTableViewCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.frame.width, height: (381/375)*self.frame.width)
    }
}
