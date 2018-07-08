//
//  SignService.swift
//  MeowBox
//
//  Created by 장한솔 on 2018. 7. 8..
//  Copyright © 2018년 yeen. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

struct SignService : APIService{
    
    
    //MARK: 로그인 서비스
    static func login(email: String, pwd: String, completion: @escaping (_ message: String)->Void){
        
        let userdefault = UserDefaults.standard
        
        let URL = url("/user/signin")
        
        let body: [String: Any] = [
            "email" : email,
            "pwd" : pwd
        ]
        
        Alamofire.request(URL, method: .post, parameters: body, encoding: JSONEncoding.default, headers: nil).responseData(){ res in
            switch res.result{
            case .success:
                if let value = res.result.value{
                    if let message = JSON(value)["message"].string{
                        if message == "success"{ // 로그인 성공
                            let myToken = gsno(JSON(value)["result"]["token"].string)
                            let myCat_idx = String(gino(JSON(value)["result"]["cat_idx"].int))
                            
                            print("token: "+myToken)
                            print("cat_idx: "+myCat_idx)
                            
                            userdefault.set(email, forKey: "email")
                            userdefault.set(myToken, forKey: "token")
                            userdefault.set(myCat_idx, forKey: "cat_idx")
                            
                            completion("success")
                            
                            
                            
                        }else{ // 로그인 실패
                            
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
    
    
    
    //MARK: 회원가입 서비스
    
    static func signup(email: String, pwd: String, name: String, phone_number: String, completion: @escaping (_ message: String)->Void){
        
        let URL = url("/user/signup")
        
        let body: [String: Any] = [
            "email" : email,
            "pwd" : pwd,
            "name" : name,
            "phone_number" : phone_number,
            ]
        
        Alamofire.request(URL, method: .post, parameters: body, encoding: JSONEncoding.default, headers: nil).responseData(){ res in
            switch res.result{
            case .success:
                if let value = res.result.value{
                    if let message = JSON(value)["message"].string{
                        if message == "success"{ // 회원가입 성공
                            completion("success")
                        }else if message == "exist_id"{ // 중복 있음
                            completion("exist_id")
                            
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
