//
//  Html5InicisViewController.swift
//  MeowBox
//
//  Created by 장한솔 on 2018. 7. 10..
//  Copyright © 2018년 yeen. All rights reserved.
//

import UIKit
import SwiftyIamport

class Html5InicisViewController: UIViewController {
    
    lazy var webView: UIWebView = {
        var view = UIWebView()
        view.backgroundColor = UIColor.clear
        view.delegate = self
        return view
    }()
    
    let userDefault = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.addSubview(webView)
        self.webView.frame = self.view.bounds
        
        // 결제 환경 설정
        IAMPortPay.sharedInstance.configure(scheme: "iamporttest",              // info.plist에 설정한 scheme
            storeIdentifier: "imp68124833")     // iamport 에서 부여받은 가맹점 식별코드
        
        IAMPortPay.sharedInstance
            .setPGType(.html5_inicis)               // PG사 타입
            .setIdName(nil)                         // 상점아이디 ({PG사명}.{상점아이디}으로 생성시 사용)
            .setPayMethod(.card)                    // 결제 형식
            .setWebView(self.webView)               // 현재 Controller에 있는 WebView 지정
            .setRedirectUrl("http://13.209.220.1:3000/order/order_result")                    // m_redirect_url 주소
        
        //guard let price = userDefault.string(forKey: "order_price") else{ return }
        guard let email = userDefault.string(forKey: "order_email") else{ return }
        guard let name = userDefault.string(forKey: "order_name") else{ return }
        guard let phone = userDefault.string(forKey: "order_phone_number") else{ return }
        guard let address = userDefault.string(forKey: "order_address") else{ return }

        
        //guard let token = userDefault.string(forKey: "token") else{ return }
        guard let cat_idx = userDefault.string(forKey: "cat_idx") else{ return }
        
        let random = arc4random()
        
        userDefault.set(String(random), forKey: "random_key")
        let merchant = cat_idx+"_\(random)"
        print("random:    \(random)")
        print(merchant)
        
        
        // 결제 정보 데이타
        let parameters: IAMPortParameters = [
            "merchant_uid": merchant,
            "name": "미유박스",
            "amount": "100",
            "buyer_email": email,
            "buyer_name": name,
            "buyer_tel": phone,
            "buyer_addr": address,
            "buyer_postcode": "123-456",
            "custom_data": ["A1": 123, "B1": "Hello"]
            //"custom_data": "24"
        ]
        IAMPortPay.sharedInstance.setParameters(parameters).commit()
        
        // 결제 웹페이지(Local) 파일 호출
        if let url = IAMPortPay.sharedInstance.urlFromLocalHtmlFile() {
            let request = URLRequest(url: url)
            self.webView.loadRequest(request)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}

extension Html5InicisViewController: UIWebViewDelegate {
    func webView(_ webView: UIWebView, shouldStartLoadWith request: URLRequest, navigationType: UIWebViewNavigationType) -> Bool {
        // 해당 함수는 redirecURL의 결과를 직접 처리하고 할 때 사용하는 함수 (IAMPortPay.sharedInstance.configure m_redirect_url 값을 설정해야함.)
        IAMPortPay.sharedInstance.webViewRedirectUrl(shouldStartLoadWith: request, parser: { (data, response, error) -> Any? in
            // Background Thread
            var resultData: [String: Any]?
            if let httpResponse = response as? HTTPURLResponse {
                let statusCode = httpResponse.statusCode
                switch statusCode {
                case 200:
                    resultData = [
                        "isSuccess": "OK"
                    ]
                    break
                default:
                    break
                }
            }
            return resultData
        }) { (pasingData) in
            // Main Thread
        }
        
        return IAMPortPay.sharedInstance.webView(webView, shouldStartLoadWith: request, navigationType: navigationType)
    }
    
    func webViewDidFinishLoad(_ webView: UIWebView) {
        // 결제 환경으로 설정에 의한 웹페이지(Local) 호출 결과
        IAMPortPay.sharedInstance.requestIAMPortPayWebViewDidFinishLoad(webView) { (error) in
            if error != nil {
                switch error! {
                case .custom(let reason):
                    print("error: \(reason)")
                    break
                }
            }else {
                print("OK")
            }
        }
        
    }
}
