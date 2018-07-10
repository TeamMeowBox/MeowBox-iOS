//
//  ReviewService.swift
//  MeowBox
//
//  Created by 김예은 on 2018. 7. 10..
//  Copyright © 2018년 yeen. All rights reserved.
//

import Foundation
import Alamofire
import Kingfisher
import SwiftyJSON
import UIKit

struct ReviewService: APIService {
    
    //MARK: 테이블 뷰 후기
    static func reviewInit(completion: @escaping (Review)-> Void) {
        let URL = url("/home/review")
        
        let userdefault = UserDefaults.standard
        
        Alamofire.request(URL, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: nil).responseData() { res in
            
            switch res.result {
                
            case .success:
                
                if let value = res.result.value {
                    
                    print("후기 접근")
                    let decoder = JSONDecoder()
                    
                    do {
                        print("후기 진입")
                        
                        let reviewData = try decoder.decode(ReviewData.self, from: value)
                        
                        if reviewData.status == true {
                            
                            let message = JSON(value)["message"].string
                            print(message)
                            if reviewData.message == "success" {
                                print("후기 성공")
                                completion(reviewData.result)
                            }
                            else {
                                print("후기 실패")
                            }
                        }
                            
                        else {
                            print("서버 에러")
                        }
                        
                    } catch {
                        print("예외 발생")
                        
                    }
                }
                break
                
            case .failure(let err):
                print(err.localizedDescription)
                break
            }
        }
    }
    
}

