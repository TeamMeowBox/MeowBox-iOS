//
//  MainService.swift
//  MeowBox
//
//  Created by 김예은 on 2018. 7. 10..
//  Copyright © 2018년 yeen. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

struct MainService: APIService {
    
    //MARK: 미유박스 이야기 고양이 수
    static func catCountInit(completion: @escaping (CatCountData)-> Void) {
        
        let URL = url("/home/monthlyBox_detail/catCount")
        
        let userdefault = UserDefaults.standard
        guard let token = userdefault.string(forKey: "token") else { return }
        
        let token_header = [ "authorization" : token ]
        
        Alamofire.request(URL, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: token_header).responseData() { res in
            
            switch res.result {
                
            case .success:
                
                if let value = res.result.value {
                    
                    print("cat 접근")
                    let decoder = JSONDecoder()
                    
                    do {
                        print("cat 진입")
                        
                        let catCountData = try decoder.decode(CatCountData.self, from: value)
                        
                        if catCountData.status == true {
                            
                            let message = JSON(value)["message"].string
                            print(message)
                            if catCountData.message == "success" {
                                print("cat 성공")
                                completion(catCountData)
                            }
                            else {
                                print("cat 실패")
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
    
    //Main: 인스타 크롤링
    static func instaInit(completion: @escaping ([Insta])->Void) {
        
        let URL = url("/home/monthlyBox_detail/crawling")
        
        let userdefault = UserDefaults.standard
        guard let token = userdefault.string(forKey: "token") else { return }
        
        let token_header = [ "authorization" : token ]
        
        Alamofire.request(URL, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: token_header).responseData() { res in
            
            switch res.result {
                
            case .success:
                
                if let value = res.result.value {
                    
                    print("인스타 접근")
                    let decoder = JSONDecoder()
                    
                    do {
                        print("인스타 진입")
                        
                        let instaData = try decoder.decode(InstaData.self, from: value)
                        
                        if instaData.status == true {
                            
                            let message = JSON(value)["message"].string
                            print(message)
                            if instaData.message == "success" {
                                print("인스타 성공")
                                completion(instaData.result)
                            }
                            else {
                                print("인스타 실패")
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
