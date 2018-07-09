//
//  LatestAddress.swift
//  MeowBox
//
//  Created by 장한솔 on 2018. 7. 9..
//  Copyright © 2018년 yeen. All rights reserved.
//

import Foundation

struct LatestAddress: Codable{
    var order_idx: String
    var name: String?
    var address: String?
    var phone_number: String?
    var email: String?
    var payment_date: String?
}
