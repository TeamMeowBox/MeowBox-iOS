//
//  Account.swift
//  MeowBox
//
//  Created by 김예은 on 2018. 7. 9..
//  Copyright © 2018년 yeen. All rights reserved.
//

import Foundation

struct Account: Codable {
    
    let user_name: String
    let email: String
    let phone_number: String
    let image_profile: String
    let cat_name: String?
    let size: Int?
    let birthday: String?
    let caution: String?
    let cat_idx: Int?
}

