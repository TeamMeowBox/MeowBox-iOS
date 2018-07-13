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

    
    let ribbonArr = [#imageLiteral(resourceName: "ribbon-two-img"), #imageLiteral(resourceName: "ribbon-three-img"), #imageLiteral(resourceName: "ribbon-four-img.png")]
    let cakeArr = [#imageLiteral(resourceName: "cake-two-img"), #imageLiteral(resourceName: "cake-three-img"), #imageLiteral(resourceName: "cake-four-img")]
    let toyArr = [#imageLiteral(resourceName: "birthday-toy-one-img"), #imageLiteral(resourceName: "birthday-toy-two-img"), #imageLiteral(resourceName: "birthday-toy-three-img")]
    let scArr = [#imageLiteral(resourceName: "scratcher-two-img"), #imageLiteral(resourceName: "scratcher-three-img.png"), #imageLiteral(resourceName: "scratcher-four-img.png")]
    let snackArr = [#imageLiteral(resourceName: "snack-two-img"),#imageLiteral(resourceName: "snack-three-img.png"), #imageLiteral(resourceName: "snack-four-img.png")]
    
    let ribbonTextArr = [
        """
        생일 축하해요! 이 모자와 리본을 착용한 순간,
        오늘의 주인공은 바로 당신!
        """,
        """
        귀여운 금색 고깔모자와 리본타이는
        당신의 고양이의 품격을 올려줄 거예요.
        """,
        """
        두 제품 모두 조절 끈이 있어,
        우리 냥이에게 꼭 맞게 착용할 수 있어요.
        """
    ]
    
    let cakeTextArr = [
        """
        함께 기뻐하기를 바라는 마음을 가득 담아,
        냥이가 먹을 수 있는 특별한 케이크를 만들었어요
        """,
        """
        우리 냥이만을 위한 맞춤 가랜드로
        더욱 특별한 추억을 남겨보세요.
        """,
        """
        일 년에 한 번, 특별한 우리만의 날을 기념할
        케이크와 가랜드!
        """
    ]
    
    let toyTextArr = [
        """
        냥이와 케미 폭발할 아기자기한 인형,
        가지고 놀기 딱 좋은 사이즈로 만들었어요.
        """,
        """
        세상 부드러운 양모볼에 캣닢가루를 솔솔~
        하루 종일 갖고 놀아도 질리지 않아요.
        """,
        """
        다양한 귀여운 인형들도 있어요.
        랜덤으로 두개씩 보내드려요!
        """
    ]
    
    let scTextArr = [
        """
        스트레스를 해소해 줄 스크래쳐.
        한 번 긁으면, 멈출 수 없을 걸?
        """,
        """
        영양소를 그대로 담은 동결건조 닭가슴살,
        맛과 건강 둘 다 놓치지 않을 거예요!
        """,
        """
        미유박스와 딱 맞는 크기의 스크래쳐,
        합체하면 아늑한 냥이만의 공간 완성!
        """
    ]
    
    let snackTextArr = [
        """
        영양소를 그대로 담은 동결건조 닭가슴살,
        맛과 건강 둘 다 놓치지 않을 거예요!
        """,
        """
        까다로운 냥이도 무너뜨릴 향기,
        갈매기살을 갈아 만들어 말랑한 식감의 포크 져키
        """,
        """
        미유가 만들고 수의사가 검사한 믿음직한
        수제간식, 영양소와 기호성 또한 최고!
        """
    ]
    
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
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if tag == 0 {
            if let cell: BirthCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: BirthCollectionViewCell.reuseIdentifier, for: indexPath) as? BirthCollectionViewCell
            {
                cell.collectionImageView.image = ribbonArr[indexPath.row]
                cell.collectionLabel.text = ribbonTextArr[indexPath.row]
                
                return cell
            }
            return UICollectionViewCell()
        }
        else if tag == 1 {
            
            if let cell: BirthCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: BirthCollectionViewCell.reuseIdentifier, for: indexPath) as? BirthCollectionViewCell
            {
                cell.collectionImageView.image = cakeArr[indexPath.row]
                cell.collectionLabel.text = cakeTextArr[indexPath.row]
            
                return cell
            }
            return UICollectionViewCell()
        }
        else if tag == 2  {
            
            if let cell: BirthCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: BirthCollectionViewCell.reuseIdentifier, for: indexPath) as? BirthCollectionViewCell
            {
                cell.collectionImageView.image = toyArr[indexPath.row]
                cell.collectionLabel.text = toyTextArr[indexPath.row]
                
                return cell
            }
            return UICollectionViewCell()
        }
        else if tag == 3 {
            if let cell: BirthCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: BirthCollectionViewCell.reuseIdentifier, for: indexPath) as? BirthCollectionViewCell
            {
                cell.collectionImageView.image = scArr[indexPath.row]
                cell.collectionLabel.text = scTextArr[indexPath.row]
                
                return cell
            }
            return UICollectionViewCell()
        }
        else {
            if let cell: BirthCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: BirthCollectionViewCell.reuseIdentifier, for: indexPath) as? BirthCollectionViewCell
            {
                cell.collectionImageView.image = snackArr[indexPath.row]
                cell.collectionLabel.text = snackTextArr[indexPath.row]
                
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
