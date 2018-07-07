//
//  APIService.swift
//  MeowBox
//
//  Created by 김예은 on 2018. 7. 1..
//  Copyright © 2018년 yeen. All rights reserved.
//

import Foundation

protocol APIService {
    
}

extension APIService {
    static func url(_ path: String) -> String {
        return "http://13.209.220.1:3000" + path
    }
    
    
}
