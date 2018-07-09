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
                            
                            /***************** USER DEFAULT *****************/
                            
                            let myToken = gsno(JSON(value)["result"]["token"].string)
                            let myCat_idx = gsno(JSON(value)["result"]["cat_idx"].string)
                            
                            print("token: "+myToken)
                            print("cat_idx: "+myCat_idx)
                            print("name: "+gsno(JSON(value)["result"]["name"].string))
                            
                            userdefault.set(email, forKey: "email")
                            userdefault.set(gsno(JSON(value)["result"]["token"].string), forKey: "token")
                            userdefault.set(gsno(JSON(value)["result"]["cat_idx"].string), forKey: "cat_idx")
                            userdefault.set(gsno(JSON(value)["result"]["name"].string), forKey: "name")
                            userdefault.set(gsno(JSON(value)["result"]["phone_number"].string), forKey: "phone_number")
                            userdefault.set(gsno(JSON(value)["result"]["image_profile"].string), forKey: "image_profile")
                            userdefault.set(gsno(JSON(value)["result"]["flag"].string), forKey: "flag")
                            
                            completion("success")
                            
                            
                            
                        }else{ // 로그인 실패
                            print("로그인 실패 : "+message)
                            
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
    
    
    //MARK : 회원탈퇴 서비스
    static func leave(completion: @escaping (_ messgae: String)->Void){
        
        let userDefault = UserDefaults.standard
        
        let URL = url("/user/account")
        
        guard let token = userDefault.string(forKey: "token") else { return }
        
        let headers = ["authorization": token]
        
        Alamofire.request(URL, method: .delete, parameters: nil, encoding: JSONEncoding.default, headers: headers).responseData(){ res in
            switch res.result{
            case .success:
                if let value = res.result.value{
                    if let message = JSON(value)["message"].string{
                        if message == "success"{ // 회원탈퇴 성공
                            print("회원 탈퇴 성공!")
                            completion("success")
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
