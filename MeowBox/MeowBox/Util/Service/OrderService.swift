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
                            print(JSON(value)["ticket"]["product"].string)
                            print(JSON(value)["ticketed"][0]["product"].string)
                            do{
                                let orderList = try decoder.decode(OrderList.self, from: value)
                                
                                print("주문내역 가져오기 성공!")
                                if let ticket = orderList.ticket{
                                    completion(ticket, orderList.ticketed)
                                }else{
                                    completion(nil, orderList.ticketed)
                                }
                                
                            }catch{
                                print("catch!")
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
}
