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

                        let myPageNoneTicketData = try decoder.decode(MyPageNoneTicketData.self, from: value)
        
                        if myPageNoneTicketData.status == true {
                            
                            let message = JSON(value)["message"].string
                            print(message)
                            if myPageNoneTicketData.message == "success" {
                                print("X성공")
                                completion(myPageNoneTicketData.result)
                            }
                            else {
                                print("X실패")
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
                        
                        if myPageTicketData.status == true {
                            
                            let message = JSON(value)["message"].string
                            print(message)
                            if myPageTicketData.message == "success" {

                                print("O성공")
                                completion(myPageTicketData.result)
                            }
                            else {
                                print("O실패")
                            }
                        }
                        
                        else {
                            print("서버 에러")
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
    
    //MARK: 마이페이지 - 미유박스에 제안
    static func saveFeedback(title: String, content: String, completion: @escaping ()->Void) {
        
        let URL = url("/mypage/feedback")
        
        let userdefault = UserDefaults.standard
        guard let token = userdefault.string(forKey: "token") else { return }
        
        let token_header = [ "authorization" : token ]
    
        let body: [String: Any] = [
            "title" : title,
            "content" : content
        ]
        
        Alamofire.request(URL, method: .post, parameters: body, encoding: JSONEncoding.default, headers: token_header).responseData() { res in
            switch res.result {
            case .success:
            
                if let value = res.result.value {
                    
                    print("미유박스 제안 접근")
                    
                    do {
                        let status = JSON(value)["status"]
                            if status == true {
                                
                                let message = JSON(value)["message"].string
                                print(message)
                                
                                if message == "success" {
                                    print("제안 성공")
                                    completion()
                                }
                                else {
                                    print("제안 실패")
                                }
                            }
                            else {
                                print("서버 에러")
                            }
                    }catch {
                        ("예외 발생")
                    }
                }
                
                break
                
                
            case .failure(let err):
                
                print(err.localizedDescription)
                break
            }
        }
        
    }
    
    //MARK: 마이페이지 - 계정 설정 화면
    static func myAccountInit(completion: @escaping (Account)->Void) {
        let URL = url("/mypage/account_setting/account")
        
        Alamofire.request(URL, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: nil).responseData() { res in
            switch res.result { 
            case .success:
                
                if let value = res.result.value {
                    
                    print("계정설정 접근")
                    let decoder = JSONDecoder()
                    
                    do {
                        print("계정설정 진입")
                        let accountData = try decoder.decode(AccountData.self, from: value)
                        
                        if accountData.status == true {
                            
                            let message = JSON(value)["message"].string
                            print(message)
                            if accountData.message == "success" {
                                print("계정 설정 성공")
                                completion(accountData.result)
                            }
                            else {
                                print("계정 설정 실패")
                            }
                            
                        }
                        else {
                            print("서버 에러")
                        }
                        
                    } catch {
                        print("서버 에러")
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
