//
//  ReviewResult.swift
//  MeowBox
//
//  Created by 김예은 on 2018. 7. 10..
//  Copyright © 2018년 yeen. All rights reserved.
//

import Foundation

struct ReviewResult: Codable {
    
    let image_list: [String]
    let hashtag: [String]
    let insta_id: [String]
    let comment: String
    let title: String
}
