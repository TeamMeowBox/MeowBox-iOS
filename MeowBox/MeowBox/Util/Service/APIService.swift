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
        return "http://52.79.252.44:3000" + path
    }
    
    static func gsno(_ value: String?) -> String { //String 옵셔널 벗기기
        return value ?? ""
    }
    
    static func gino(_ value: Int?) -> Int { //Int 옵셔널 벗기기
        return value ?? 0
    }
    
}
