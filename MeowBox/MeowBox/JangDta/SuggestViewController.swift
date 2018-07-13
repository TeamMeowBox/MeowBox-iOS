//
//  SuggestViewController.swift
//  MeowBox
//
//  Created by 장한솔 on 2018. 7. 3..
//  Copyright © 2018년 yeen. All rights reserved.
//

import UIKit
import UITextView_Placeholder

class SuggestViewController: UIViewController {

    @IBOutlet weak var detailSuggestionTextField: UITextField!
    @IBOutlet weak var detailSuggestionTextView: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        detailSuggestionTextField.layer.borderWidth = 1
        detailSuggestionTextField.layer.borderColor = #colorLiteral(red: 0.5999526381, green: 0.6000267267, blue: 0.5999273658, alpha: 1)
        
        detailSuggestionTextView.layer.borderWidth = 1
        detailSuggestionTextView.layer.borderColor = #colorLiteral(red: 0.5999526381, green: 0.6000267267, blue: 0.5999273658, alpha: 1)
        detailSuggestionTextView.placeholder = "미유박스 이용경험에 대해 알려주세요.\n만족스러웠던 점과 개선해야 할 점을 알려주세요.\n더 노력하는 미유박스가 될게요."
        detailSuggestionTextView.placeholderColor = UIColor.lightGray
    }

    @IBAction func dismissAction(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func suggestAction(_ sender: Any) {
        if detailSuggestionTextView.text == "" || detailSuggestionTextField.text == "" {
            let popUPVC = UIStoryboard(name: "MyPage", bundle: nil).instantiateViewController(withIdentifier: SuggestCheckPopUpViewController.reuseIdentifier) as! SuggestCheckPopUpViewController
            self.addChildViewController(popUPVC)
            popUPVC.view.frame = self.view.frame
            self.view.addSubview(popUPVC.view)
            popUPVC.didMove(toParentViewController: self)
        }else {
        saveFeedback(title: gsno(detailSuggestionTextField.text), content: gsno(detailSuggestionTextView.text))
        }
    }
    
//    func emptyCheck() {
//        
//        if detailSuggestionTextView.text == "" || detailSuggestionTextField.text == "" {
//            let popUPVC = UIStoryboard(name: "MyPage", bundle: nil).instantiateViewController(withIdentifier: SuggestCheckPopUpViewController.reuseIdentifier) as! SuggestCheckPopUpViewController
//            self.addChildViewController(popUPVC)
//            popUPVC.view.frame = self.view.frame
//            self.view.addSubview(popUPVC.view)
//            popUPVC.didMove(toParentViewController: self)
//        }
//        
//    }
    
    
    func saveFeedback(title: String, content: String) {
        MyPageService.saveFeedback(title: title, content: content) { message in
            if message == "success"{
                
                let popUPVC = UIStoryboard(name: "MyPage", bundle: nil).instantiateViewController(withIdentifier: SuggestPopUpViewController.reuseIdentifier) as! SuggestPopUpViewController
                self.addChildViewController(popUPVC)
                popUPVC.view.frame = self.view.frame
                self.view.addSubview(popUPVC.view)
                popUPVC.didMove(toParentViewController: self)
            }
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?){
        self.view.endEditing(true)
    }
    
}
