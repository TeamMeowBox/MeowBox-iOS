//
//  MeowBoxDetailTableViewCell.swift
//  MeowBox
//
//  Created by 김예은 on 2018. 7. 6..
//  Copyright © 2018년 yeen. All rights reserved.
//

import UIKit

class MeowBoxDetailTableViewCell: UITableViewCell,UICollectionViewDataSource, UICollectionViewDelegate, UIScrollViewDelegate{
    
    @IBOutlet weak var detailTitle: UILabel!
    @IBOutlet weak var detailImageView: UIImageView!
    @IBOutlet weak var detailCollectionView: UICollectionView!
    @IBOutlet weak var pageControl: UIPageControl!
    
    var currentPages = 0
    
    let sunglassArr = [#imageLiteral(resourceName: "sunglass-two-img.png"), #imageLiteral(resourceName: "sunglass-three-img.png"), #imageLiteral(resourceName: "sunglass-four-img.png")]
    let toyArr = [#imageLiteral(resourceName: "toy-two-img.png"), #imageLiteral(resourceName: "toy-three-img.png"), #imageLiteral(resourceName: "toy-four-img.png")]
    let fishArr = [#imageLiteral(resourceName: "fishing-rod-two-img"), #imageLiteral(resourceName: "fishing-rod-three-img.png"), #imageLiteral(resourceName: "fishing-rod-four-img")]
    let scArr = [#imageLiteral(resourceName: "scratcher-two-img"), #imageLiteral(resourceName: "scratcher-three-img.png"), #imageLiteral(resourceName: "scratcher-four-img.png")]
    let snackArr = [#imageLiteral(resourceName: "snack-two-img"),#imageLiteral(resourceName: "snack-three-img.png"), #imageLiteral(resourceName: "snack-four-img.png")]
    
    let sungTextArr = [
        """
        2018 S/S 피서룩의 완성.
        선글라스와 모자만 있으면, 이구역 힙냥이는 나야!
        """,
        """
        마음대로 길이조절이 가능한 밀짚모자!
        우리 냥이에게 딱 맞게 씌워주세요.
        """,
        """
        볼수록 더 귀여운 밀짚모자와 선글라스.
        냥이에게 멋진 피서를 선물하는 법, 어렵지 않아요!
        """
    ]
    
    let toyTextArr = [
        """
        보기만 해도 시원해!
        냥이가 씹고 뜯고 맛보고 즐길 올여름 최애 인형
        """,
        """
        세상 부드러운 양모볼에 캣닢가루를 솔솔~
        하루 종일 갖고 놀아도 질리지 않아요.
        """,
        """
        냥이와 케미 폭발할 아기자기한 인형,
        가지고 놀기 딱 좋은 사이즈로 만들었어요.
        """
    ]
    
    let fishTextArr = [
        """
        숨어있던 사냥본능을 깨워라!
        자유자재 길이조절로 늘 새로운 3단 낚시대
        """,
        """
        길고 부드러운 깃털과 방울 소리로
        냥이의 사냥본능을 자극해요.
        """,
        """
        엉키지 않는 긴 낚시줄과 길이 조절이 가능한
        낚시대로 더 재밌고 편하게 놀아줄 수 있어요.
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
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if tag == 0 {
            currentPages = 0
            if let cell: MeowBoxDetailCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "MeowBoxDetailCollectionViewCell", for: indexPath) as? MeowBoxDetailCollectionViewCell
            {
            cell.collectionImageView.image = sunglassArr[indexPath.row]
            cell.collectionLabel.text = sungTextArr[indexPath.row]
            
            return cell
            }
            return UICollectionViewCell()
        }
        else if tag == 1 {
    
            if let cell: MeowBoxDetailCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "MeowBoxDetailCollectionViewCell", for: indexPath) as? MeowBoxDetailCollectionViewCell
            {
                cell.collectionImageView.image = toyArr[indexPath.row]
                cell.collectionLabel.text = toyTextArr[indexPath.row]
                
                
                return cell
            }
            return UICollectionViewCell()
        }
        else if tag == 2 {
            if let cell: MeowBoxDetailCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "MeowBoxDetailCollectionViewCell", for: indexPath) as? MeowBoxDetailCollectionViewCell
            {
                cell.collectionImageView.image = fishArr[indexPath.row]
                cell.collectionLabel.text = fishTextArr[indexPath.row]
                
                return cell
            }
            return UICollectionViewCell()
        }
        else if tag == 3 {
            if let cell: MeowBoxDetailCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "MeowBoxDetailCollectionViewCell", for: indexPath) as? MeowBoxDetailCollectionViewCell
            {
                cell.collectionImageView.image = scArr[indexPath.row]
                cell.collectionLabel.text = scTextArr[indexPath.row]
                
                
                return cell
            }
            return UICollectionViewCell()
        }
        else {
            if let cell: MeowBoxDetailCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: "MeowBoxDetailCollectionViewCell", for: indexPath) as? MeowBoxDetailCollectionViewCell
            {
                cell.collectionImageView.image = snackArr[indexPath.row]
                cell.collectionLabel.text = snackTextArr[indexPath.row]
                
                
                return cell
            }
            return UICollectionViewCell()
        }
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        self.pageControl.currentPage = 0
        self.detailCollectionView.scrollToItem(at: IndexPath(row: 0, section: 0), at: .left, animated: false)
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


