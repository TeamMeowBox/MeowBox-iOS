//
//  MyPageService.swift
//  MeowBox
//
//  Created by 김예은 on 2018. 7. 8..
//  Copyright © 2018년 yeen. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON
import Kingfisher

struct MyPageService: APIService {
    
    
    //MARK: 마이페이지 - 정기권X
    static func myPageNoneTicketInit(completion: @escaping (MyPageNoneTicket)-> Void) {
        
        let URL = url("/mypage/mypageinfo")
        
        let userdefault = UserDefaults.standard
        guard let token = userdefault.string(forKey: "token") else { return }
        
        let token_header = [ "authorization" : token ]
        
        print("dd00\(token)")
        Alamofire.request(URL, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: token_header).responseData() { res in
        
        switch res.result {
            
            case .success:
            
                if let value = res.result.value {
                    
                    print("접근")
                    let decoder = JSONDecoder()
                
                    do {
                        print("진입")
                        
                        print(JSON(value)["result"]["catinfo"])
                        
                        print(JSON(value)["result"]["sendImage"])


                        let myPageNoneTicketData = try decoder.decode(MyPageNoneTicketData.self, from: value)
                                                print(gsno(JSON(value).string))
        
                            if myPageNoneTicketData.message == "success" {
                            userdefault.set(gsno(JSON(value)["result"]["flag"].string), forKey: "flag")
                                print("성공")
                                completion(myPageNoneTicketData.result)
                            }
                            
                            else {
                                print("실패")
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
