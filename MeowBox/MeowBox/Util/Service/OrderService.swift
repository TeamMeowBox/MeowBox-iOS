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
import UIKit

struct OrderService : APIService{
    
    
    //MARK: 주문하기 서비스
    static func order(name: String, address: String, phone_number: String, product: String, price: String, email: String, payment_method: String, completion: @escaping (_ message: String)->Void){
        let userDefault = UserDefaults.standard
        
        guard let token = userDefault.string(forKey: "token") else { return }
        
        let headers = ["authorization": token]
        
        let URL = url("/order/order_page")
        
        let body: [String: Any] = [
            "name": name,
            "address": address,
            "phone_number": phone_number,
            "product": product,
            "price": price,
            "email": email,
            "payment_method": payment_method
        ]
        
        
        Alamofire.request(URL, method: .post, parameters: body, encoding: JSONEncoding.default, headers: headers).responseData(){ res in
            switch res.result{
            case .success:
                if let value = res.result.value{
                    if let message = JSON(value)["message"].string{
                        if message == "success"{ // 주문하기 성공
                            print("주문 성공!")
                            guard let myorderidx = JSON(value)["result"]["order_idx"].int else {return}
                            print("myorderidx:\(myorderidx)")
                            userDefault.set(myorderidx, forKey: "myorderidx")
                            userDefault.set("success", forKey: "order_success")
                            
                            if product == "3" || product == "6"{
                                userDefault.set(product, forKey: "flag")
                            }
                            
                            completion("success")
                        }else if message == "bad_request"{
                            completion("bad_request")
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
    
    
    
    
    // MARK: 주문내역 서비스
    static func orderlist(completion: @escaping (_ ticket: Ticket?,_ ticketeds: [Ticketed])->Void){
        let userDefault = UserDefaults.standard
        
        guard let token = userDefault.string(forKey: "token") else { return }

        let headers = ["authorization": token]
        
        let URL = url("/order/order_list")
        
        Alamofire.request(URL, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: headers).responseData(){ res in
            switch res.result{
            case .success:
                if let value = res.result.value{
                    if let message = JSON(value)["message"].string{
                        if message == "success"{ // 주문하기 성공
                            
                            let decoder = JSONDecoder()
                            print("-----주문내역------")
                            if JSON(value)["result"]["ticket"]["product"].string == nil{
                                do{
                                    let orderlistData2 = try decoder.decode(OrderListData2.self, from: value)
                            
                                        completion(nil, orderlistData2.result.ticketed)
                                
                                    
                                }catch{
                                    print("catch2")
                                }
                            }else{
                                do{
                                    let orderlistData = try decoder.decode(OrderListData.self, from: value)
                                    
                                    print("주문내역 가져오기 성공!")
                                    if let ticket = orderlistData.result.ticket{
                                        completion(ticket, orderlistData.result.ticketed)
                                    }else{
                                        completion(nil, orderlistData.result.ticketed)
                                    }
                                    
                                }catch{
                                    print("catch!")
                                }
                            }
                            
                            
                            
                        }else{
                           print("failure.....")
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
    
    
    // MARK: 주문 내역 상세 서비스
    static func orderdetaillist(order_idx: String, completion: @escaping ([String])->Void){
        let userDefault = UserDefaults.standard

        guard let token = userDefault.string(forKey: "token") else { return }

        let headers = ["authorization": token]

        let URL = url("/order/order_detail")

        let body: [String: Any] = [
            "order_idx" : order_idx
        ]

        Alamofire.request(URL, method: .post, parameters: body, encoding: JSONEncoding.default, headers: headers).responseData() { res in
            switch res.result{
            case .success:
                
                if let value = res.result.value{
                    if let message = JSON(value)["message"].string{
                        if message == "success"{ // 주문내역 상세보기 성공
                            print("주문내역 상세보기 성공!")
                            
                            let decoder = JSONDecoder()
                            do{
                                let orderDetailList = try decoder.decode(OrderDetailList.self, from: value)
                                
                                completion(orderDetailList.result)
                                
                            } catch {
                                print("catch.....")
                            }
                            
                            
                        }else{
                            
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
    
    
    // MARK: 최근 배송지 불러오기
    static func recentaddress(completion: @escaping (LatestAddress?)->Void){
        let userDefault = UserDefaults.standard
        
        guard let token = userDefault.string(forKey: "token") else { return }
        
        let headers = ["authorization": token]
        
        let URL = url("/order/order_page")
        
        
        Alamofire.request(URL, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: headers).responseData(){ res in
            switch res.result{
            case .success:
                if let value = res.result.value{
                    if let message = JSON(value)["message"].string{
                        print(message)
                        if message == "success"{ // 최근 주문지 불러오기 성공
                            print("최근 주문지 불러오기 성공!")
                            
                            let decoder = JSONDecoder()
                            do{ // result가 제대로 있는 경우 ( 이전 배송지가 있음 )
                                let latestAddressData = try decoder.decode(LatestAddressData.self, from: value)
                                
                                completion(latestAddressData.result)

                            }catch{ // result가 내가 원하는 data class 가 아님 ( 이전 배송지가 없음 )
                                completion(nil)
                            }
                            
                        }else{
                            print("fail...")
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
    
    
    // MARK: 결제 갔다 올 때
    static func isordersuccess(completion: @escaping (_ message: String)->Void){
        
        let userDefault = UserDefaults.standard
        
        guard let token = userDefault.string(forKey: "token") else { return }
        guard let myorderidx = userDefault.string(forKey: "myorderidx") else{ return }
        
        let headers = ["authorization": token]
        
        let URL = url("/order/order_result/check_order")
        
        let body: [String: Any] = [
            "merchant_uid" : myorderidx
        ]
        
        
        Alamofire.request(URL, method: .post, parameters: body, encoding: JSONEncoding.default, headers: headers).responseData() { res in
            switch res.result{
            case .success:
                
                if let value = res.result.value{
                    if let message = JSON(value)["message"].string{
                        if message == "success"{ // 주문 성공 여부
                            print("주문 성공 여부 성공!")
                            
                            if JSON(value)["result"]["order_result"].bool == true{
                                userDefault.set("no", forKey: "amIfirst")
                                completion("success")
                            }
                                print("주문 취소했거나 그냥 들어왔어 너")
                                completion("failure")
                            
                            
                        }else{
                            
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
    
    
    
    
    
    //MARK : 정기권 중복 여부 서비스
    static func checkoverlap(completion: @escaping (_ message: String)->Void){
        let userDefault = UserDefaults.standard
        
        guard let token = userDefault.string(forKey: "token") else { return }
        guard let product = userDefault.string(forKey: "order_product") else { return }
        
        let headers = ["authorization": token]
        
        let URL = url("/order/order_page/product/"+product)
        
        
        Alamofire.request(URL, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: headers).responseData(){ res in
            switch res.result{
            case .success:
                if let value = res.result.value{
                    if let message = JSON(value)["message"].string{
                        print(message)
                        if message == "success"{ // 최근 주문지 불러오기 성공
                            print("정기권 중복 여부 확인 성공!")
                            
                            let decoder = JSONDecoder()
                            do{
                                let data = try decoder.decode(Overlap.self, from: value)
                                if data.result == "1"{
                                    completion("success")
                                }else if data.result == "-1"{
                                    completion("failure")
                                }
                                
                            }catch{
                                print("catcch....")
                            }
                            
                            
                            

                        }else{
                            
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
    

    
    
    
    //MARK : 자주 묻는 질문 서비스
    static func qna(completion: @escaping (QnAList?)->Void){
        let userDefault = UserDefaults.standard
        
        guard let token = userDefault.string(forKey: "token") else { return }
        
        let headers = ["authorization": token]
        
        let URL = url("/mypage/qna")
        
        
        Alamofire.request(URL, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: headers).responseData(){ res in
            switch res.result{
            case .success:
                if let value = res.result.value{
                    if let message = JSON(value)["message"].string{
                        print(message)
                        if message == "success"{ // 최근 주문지 불러오기 성공
                            print("자주묻는질문 성공!")
                            
                            let decoder = JSONDecoder()
                            do{
                                let qnaData = try decoder.decode(QnAData.self, from: value)
                                let qnaList = qnaData.result
                               
                                completion(qnaList)
                            }catch{
                                print("자주묻는질문catch...")
                            }
                            
                            
                            
                        }else{
                            print("fail...")
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
    
    //MARK : 정기권 취소 서비스
    static func cancelticket(completion: @escaping (_ message: String)->Void){
        let userDefault = UserDefaults.standard
        
        print("정기권취소들어옴")
        guard let token = userDefault.string(forKey: "token") else { return }
        guard let idx = userDefault.string(forKey: "myticket_idx") else { return }
        print("idx:"+idx)
        
        let headers = ["authorization": token]
        
        let URL = url("/order/order_list/"+idx)
        
        
        Alamofire.request(URL, method: .delete, parameters: nil, encoding: JSONEncoding.default, headers: headers).responseData(){ res in
            switch res.result{
            case .success:
                if let value = res.result.value{
                    if let message = JSON(value)["message"].string{
                        print(message)
                        if message == "success"{ // 정기권 취소 성공
                            
                            let flag = JSON(value)["result"]["flag"].string
                            userDefault.set(flag, forKey: "flag")
                            print("정기권 취소 성공!")
                            
                            completion("success")

                        }else{
                            print("fail...")
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
