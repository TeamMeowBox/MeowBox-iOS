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
        
        Alamofire.request(URL, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: token_header).responseData() { res in
        
        switch res.result {
            
            case .success:
            
                if let value = res.result.value {
                    
                    print("X접근")
                    let decoder = JSONDecoder()
                
                    do {
                        print("X진입")
                        
                        print(gsno(JSON(value)["result"]["flag"].string))

                        let myPageNoneTicketData = try decoder.decode(MyPageNoneTicketData.self, from: value)
                                                print(gsno(JSON(value).string))
        
                        if myPageNoneTicketData.status == true {
                            if myPageNoneTicketData.message == "success" {
                                userdefault.set(gsno(JSON(value)["result"]["flag"].string), forKey: "flag")
                                print("X성공")
                                completion(myPageNoneTicketData.result)
                            }
                            
                            else {
                                print("X실패")
                            }
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
    
    //MARK: 마이페이지 - 정기권O
    static func MyPageTicketInit(completion: @escaping (MyPageTicket)-> Void) {
        
        let URL = url("/mypage/mypageinfo")
        
        let userdefault = UserDefaults.standard
        guard let token = userdefault.string(forKey: "token") else { return }
        
        let token_header = [ "authorization" : token ]
        
        Alamofire.request(URL, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: token_header).responseData() { res in
            
            switch res.result {
                
            case .success:
                
                if let value = res.result.value {
                    
                    print("O접근")
                    let decoder = JSONDecoder()
                    
                    do {
                        print("O진입")
                        
                        let myPageTicketData = try decoder.decode(MyPageTicketData.self, from: value)
                        print(gsno(JSON(value).string))
                        
                        if myPageTicketData.status == true {
                            if myPageTicketData.message == "success" {
                                userdefault.set(gsno(JSON(value)["result"]["flag"].string), forKey: "flag")
                                print("O성공")
                                completion(myPageTicketData.result)
                            }
                                
                            else {
                                print("O실패")
                            }
                        }
                        
                    } catch {
                        print("O예외 발생")
                        
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
