//
//  ExtensionControl.swift
//  MeowBox
//
//  Created by 김예은 on 2018. 7. 1..
//  Copyright © 2018년 yeen. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    func gsno(_ value: String?) -> String { //String 옵셔널 벗기기
        return value ?? ""
    }
    
    func gino(_ value: Int?) -> Int { //Int 옵셔널 벗기기
        return value ?? 0
    }
}

extension NSObject {
    static var reuseIdentifier: String { //스토리보드 idetifier
        return String(describing: self)
    }
}
