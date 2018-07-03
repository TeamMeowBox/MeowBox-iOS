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
        
        detailSuggestionTextField.layer.borderColor = #colorLiteral(red: 0.937254902, green: 0.937254902, blue: 0.9568627451, alpha: 1)
        detailSuggestionTextView.layer.borderColor = #colorLiteral(red: 0.937254902, green: 0.937254902, blue: 0.9568627451, alpha: 1)
        detailSuggestionTextView.placeholder = "미유박스 이용경험에 대해 알려주세요.\n만족스러웠던 점과 개선해야 할 점을 알려주세요.\n더 노력하는 미유박스가 될게요."
        detailSuggestionTextView.placeholderColor = UIColor.lightGray
    }


}
