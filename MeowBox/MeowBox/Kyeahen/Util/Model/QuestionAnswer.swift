//
//  Q&A.swift
//  MeowBox
//
//  Created by 김예은 on 2018. 7. 9..
//  Copyright © 2018년 yeen. All rights reserved.
//

import Foundation

struct QuestionAnswer: Codable {
    
    let product: [Product]
    let delivery: [Delivery]
    let packing: [Packing]
    let subscribe: [Subscribe]
}

