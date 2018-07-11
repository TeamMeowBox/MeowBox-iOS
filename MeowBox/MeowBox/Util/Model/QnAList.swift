//
//  QnAList.swift
//  MeowBox
//
//  Created by 장한솔 on 2018. 7. 11..
//  Copyright © 2018년 yeen. All rights reserved.
//

import Foundation

struct QnAList: Codable{
    var product: [QnA]
    var delivery: [QnA]
    var packing: [QnA]
    var subscribe: [QnA]
}
