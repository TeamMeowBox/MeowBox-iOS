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
        saveFeedback(title: gsno(detailSuggestionTextField.text), content: gsno(detailSuggestionTextView.text))
    }
    
    
    func saveFeedback(title: String, content: String) {
        MyPageService.saveFeedback(title: title, content: content) { message in
            if message == "success"{
                self.detailSuggestionTextField.text = ""
                self.detailSuggestionTextView.text = ""
                let alertView = UIAlertController(title: "좋은 의견 감사합니다!", message: "앞으로 더 나은\n미유박스가 될게요", preferredStyle: .alert)
                let ok = UIAlertAction(title: "확인", style: .default, handler: nil)
                alertView.addAction(ok)
                self.present(alertView, animated: true, completion: nil)
            }
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?){
        self.view.endEditing(true)
    }
    
}
