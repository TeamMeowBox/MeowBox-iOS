//
//  OrderService.swift
//  MeowBox
//
//  Created by 장한솔 on 2018. 7. 8..
//  Copyright © 2018년 yeen. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

struct OrderService : APIService{
    
    static func order(completion: @escaping (_ message: String)->Void){
        let userDefault = UserDefaults.standard
        
        guard let token = userDefault.string(forKey: "token") else { return }
        
        let headers = ["authorization": token]
        
        let URL = url("order/order_page")
        
        let body: [String: Any] = [
            :
        ]
        
        
        Alamofire.request(URL, method: .post, parameters: body, encoding: JSONEncoding.default, headers: headers).responseData(){ res in
            switch res.result{
            case .success:
                if let value = res.result.value{
                    if let message = JSON(value)["message"].string{
                        if message == "success"{ // 고양이 등록 성공
                            print("주문 성공!")
                            completion("success")
                        }else{
                            completion("failure")
                        }
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
