//
//  InstaData.swift
//  MeowBox
//
//  Created by 김예은 on 2018. 7. 10..
//  Copyright © 2018년 yeen. All rights reserved.
//

import Foundation

struct InstaData: Codable {
    let status: Bool
    let message: String
    let result: [Insta]
}
