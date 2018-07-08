//
//  OrderList.swift
//  MeowBox
//
//  Created by 장한솔 on 2018. 7. 9..
//  Copyright © 2018년 yeen. All rights reserved.
//

import Foundation

struct OrderList: Codable{
    var message: String
    var ticket: Ticket?
    var ticketed: [Ticketed]
}
