//
//  MyAccountViewController.swift
//  MeowBox
//
//  Created by 김예은 on 2018. 7. 4..
//  Copyright © 2018년 yeen. All rights reserved.
//

import UIKit
import Kingfisher

class MyAccountViewController: UIViewController, UITextFieldDelegate,UITextViewDelegate {

    @IBOutlet weak var infoView1: UIView!
    @IBOutlet weak var infoNameView: UIView!
    @IBOutlet weak var infoPhoneView: UIView!
    @IBOutlet weak var infoEmailView: UIView!
    
    @IBOutlet weak var infoCatView: UIView!
    @IBOutlet weak var infoCatNameView: UIView!
    @IBOutlet weak var infoSizeView: UIView!
    @IBOutlet weak var infoBirthView: UIView!
    @IBOutlet weak var infoEtcView: UIView!
    
    @IBOutlet weak var infoEtcTextView: UITextView!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var phoneTextField: UITextField!
    @IBOutlet weak var catNameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var smallSizeBtn: UIButton!
    @IBOutlet weak var mediumSizeBtn: UIButton!
    @IBOutlet weak var bigSizeBtn: UIButton!
    @IBOutlet weak var upLabel: UILabel!
    @IBOutlet weak var saveBtn: UIButton!
    
    let imagePicker : UIImagePickerController = UIImagePickerController()
    let datePicker = UIDatePicker()
    
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var dateTextField: UITextField!
    
    var accounts: Account?
    var size: Int = 0
    let userdefault = UserDefaults.standard
    
    var profileUrl: URL?
    
    @IBOutlet weak var scrollView: UIScrollView!
    override func viewDidLoad() {
        super.viewDidLoad()

        myAccountInit()
        
        initDatePicker()
        
        addScrollViewEndEditing()
        
        profileImageView.isUserInteractionEnabled = true
        
        //view bottom border
        infoView1.layer.addBorder(edge: .bottom, color: #colorLiteral(red: 0.8078431373, green: 0.8078431373, blue: 0.8078431373, alpha: 1), thickness: 0.5)
        infoNameView.layer.addBorder(edge: .bottom, color: #colorLiteral(red: 0.8078431373, green: 0.8078431373, blue: 0.8078431373, alpha: 1), thickness: 0.5)
        infoEmailView.layer.addBorder(edge: .bottom, color: #colorLiteral(red: 0.8078431373, green: 0.8078431373, blue: 0.8078431373, alpha: 1), thickness: 0.5)
        infoPhoneView.layer.addBorder(edge: .bottom, color: #colorLiteral(red: 0.8078431373, green: 0.8078431373, blue: 0.8078431373, alpha: 1), thickness: 0.5)
        infoCatView.layer.addBorder(edge: .bottom, color: #colorLiteral(red: 0.8078431373, green: 0.8078431373, blue: 0.8078431373, alpha: 1), thickness: 0.5)
        infoCatNameView.layer.addBorder(edge: .bottom, color: #colorLiteral(red: 0.8078431373, green: 0.8078431373, blue: 0.8078431373, alpha: 1), thickness: 0.5)
        infoSizeView.layer.addBorder(edge: .bottom, color: #colorLiteral(red: 0.8078431373, green: 0.8078431373, blue: 0.8078431373, alpha: 1), thickness: 0.5)
        infoBirthView.layer.addBorder(edge: .bottom, color: #colorLiteral(red: 0.8078431373, green: 0.8078431373, blue: 0.8078431373, alpha: 1), thickness: 0.5)
        infoEtcView.layer.addBorder(edge: .bottom, color: #colorLiteral(red: 0.8078431373, green: 0.8078431373, blue: 0.8078431373, alpha: 1), thickness: 0.5)
        
        //textView border
        infoEtcTextView.layer.borderColor = #colorLiteral(red: 0.6, green: 0.6, blue: 0.6, alpha: 1)
        infoEtcTextView.layer.borderWidth = 1
        infoEtcTextView.layer.addBorder(edge: [.left, .bottom, .right], color: #colorLiteral(red: 0.6, green: 0.6, blue: 0.6, alpha: 1), thickness: 0.5)
        
        //프로필 이미지 동그랗게
        profileImageView.layer.masksToBounds = true
        profileImageView.layer.cornerRadius = profileImageView.layer.frame.width/2
        
        //텍스트필드 delegate
        nameTextField.delegate = self
        emailTextField.delegate = self
        phoneTextField.delegate = self
        catNameTextField.delegate = self
        infoEtcTextView.delegate = self
        
    }
    
    
   
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        if(text == "\n") {
            textView.resignFirstResponder()
            return false
        }
        return true
    }

    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: 창닫기 액션
    @IBAction func dismissAction(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)

    }
    
    //MARK: 이미지 피커
    @IBAction func openImagePicker(_ sender: UITapGestureRecognizer) {
        openGallery()
    }
    
    //MARK: 마른 사이즈 액션
    @IBAction func smallSizeAction(_ sender: UIButton) {
        
        if sender == smallSizeBtn {
            size = 0
            smallSizeBtn.isSelected = !smallSizeBtn.isSelected
            smallSizeBtn.setImage(#imageLiteral(resourceName: "small-radio-btn-pink"), for: UIControlState.normal)
            mediumSizeBtn.setImage(#imageLiteral(resourceName: "medium-radio-btn-gray"), for: UIControlState.normal)
            bigSizeBtn.setImage(#imageLiteral(resourceName: "large-radio-btn-gray"), for: UIControlState.normal)
        }
            
        else {
            size = -1
            smallSizeBtn.isSelected = !smallSizeBtn.isSelected
            smallSizeBtn.setImage(#imageLiteral(resourceName: "small-radio-btn-gray"), for: UIControlState.normal)
        }
        
        print(size)
    }
    
    @IBAction func mediumSizeAction(_ sender: UIButton) {
        
        if sender == mediumSizeBtn {
            size = 1
            mediumSizeBtn.isSelected = !mediumSizeBtn.isSelected
            mediumSizeBtn.setImage(#imageLiteral(resourceName: "medium-radio-btn-pink"), for: UIControlState.normal)
            smallSizeBtn.setImage(#imageLiteral(resourceName: "small-radio-btn-gray"), for: UIControlState.normal)
            bigSizeBtn.setImage(#imageLiteral(resourceName: "large-radio-btn-gray"), for: UIControlState.normal)
        }
            
        else {
            size = -1
            mediumSizeBtn.isSelected = !mediumSizeBtn.isSelected
            mediumSizeBtn.setImage(#imageLiteral(resourceName: "small-radio-btn-gray"), for: UIControlState.normal)
        }
        
        print(size)
        
    }
    
    @IBAction func largeSizeAction(_ sender: UIButton) {
        
        if sender == bigSizeBtn {
            size = 2
            bigSizeBtn.isSelected = !bigSizeBtn.isSelected
            bigSizeBtn.setImage(#imageLiteral(resourceName: "large-radio-btn-pink"), for: UIControlState.normal)
            mediumSizeBtn.setImage(#imageLiteral(resourceName: "medium-radio-btn-gray"), for: UIControlState.normal)
            smallSizeBtn.setImage(#imageLiteral(resourceName: "small-radio-btn-gray"), for: UIControlState.normal)
        }
            
        else {
            size = -1
            bigSizeBtn.isSelected = !bigSizeBtn.isSelected
            bigSizeBtn.setImage(#imageLiteral(resourceName: "large-radio-btn-gray"), for: UIControlState.normal)
        }
        
        print(size)
        
    }
    
    func remove_pref(remove_key : String){
        UserDefaults.standard.removeObject(forKey: remove_key)
        UserDefaults.standard.synchronize()
    }

    //MARK: 고양이 공백 체크
    func catEmptyCheck() {
        if catNameTextField.text == "" || dateTextField.text == "" || size == -1 {
            catNameTextField.text = "-1"
        }
    }
    
    func myAccountInit() {
        MyPageService.myAccountInit() { (accountData) in
            print("통신 시작")
            
            self.nameTextField.text = self.gsno(accountData.user_name)
            self.emailTextField.text = self.gsno(accountData.email)
            self.phoneTextField.text = self.gsno(accountData.phone_number)
            self.profileImageView.kf.setImage(with: URL(string: accountData.image_profile),placeholder: UIImage())
            self.catNameTextField.text = self.gsno(accountData.cat_name)
            self.dateTextField.text = self.gsno(accountData.birthday)
            self.infoEtcTextView.text = self.gsno(accountData.caution)
            
            self.userdefault.set(self.gsno(accountData.image_profile), forKey: "image_profile")
            
            if accountData.size == 0 {
                self.smallSizeBtn.setImage(#imageLiteral(resourceName: "small-radio-btn-pink"), for: .normal)
            }
            else if accountData.size == 1 {
                self.mediumSizeBtn.setImage(#imageLiteral(resourceName: "medium-radio-btn-pink"), for: .normal)
            }
            else if accountData.size == 2 {
                self.bigSizeBtn.setImage(#imageLiteral(resourceName: "large-radio-btn-pink"), for: .normal)
            }
            else {
                self.smallSizeBtn.setImage(#imageLiteral(resourceName: "small-radio-btn-gray"), for: UIControlState.normal)
                self.mediumSizeBtn.setImage(#imageLiteral(resourceName: "medium-radio-btn-gray"), for: UIControlState.normal)
                self.bigSizeBtn.setImage(#imageLiteral(resourceName: "large-radio-btn-gray"), for: UIControlState.normal)
            }
        }
    }
    
    //MARK: 글 저장
    @IBAction func saveAccount(_ sender: Any) {
        updateAccount()
    }
    
    func updateAccount() {
        
        if catNameTextField.text == "" || dateTextField.text == "" || size == -1 {
            MyPageService.updateAccount(user_name: gsno(nameTextField.text), user_phone: gsno(phoneTextField.text), user_email: gsno(emailTextField.text), image_profile: profileImageView.image!, cat_name: "-1", cat_size: size, cat_birthday: gsno(dateTextField.text), cat_caution: gsno(infoEtcTextView.text)) {
                
                let myPageNaviVC = UIStoryboard(name: "MyPage", bundle: nil).instantiateViewController(withIdentifier: "MyPageNaviVC")
                
                self.userdefault.set(self.gsno(self.nameTextField.text), forKey: "name")
                
                self.present(myPageNaviVC, animated: true, completion: nil)
                print("수정 완료!")
            }
        }
        else {
            MyPageService.updateAccount(user_name: gsno(nameTextField.text), user_phone: gsno(phoneTextField.text), user_email: gsno(emailTextField.text), image_profile: profileImageView.image!, cat_name: gsno(catNameTextField.text), cat_size: size, cat_birthday: gsno(dateTextField.text), cat_caution: gsno(infoEtcTextView.text)) {
    
                    let myPageNaviVC = UIStoryboard(name: "MyPage", bundle: nil).instantiateViewController(withIdentifier: "MyPageNaviVC")
                
                self.userdefault.set(self.gsno(self.nameTextField.text), forKey: "name")
                self.userdefault.set(self.gsno(self.catNameTextField.text), forKey: "cat_name")
                
                    self.present(myPageNaviVC, animated: true, completion: nil)
                    print("수정 완료!")
            }
        }
    }
    
    func addScrollViewEndEditing(){
        let singleTapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(scrollTapMethod))
        singleTapGestureRecognizer.numberOfTapsRequired = 1
        singleTapGestureRecognizer.isEnabled = true
        singleTapGestureRecognizer.cancelsTouchesInView = false
        scrollView.addGestureRecognizer(singleTapGestureRecognizer)
    }
    
    @objc func scrollTapMethod(sender: UITapGestureRecognizer) {
        self.view.endEditing(true)
        self.scrollView.endEditing(true)
    }
}

//view bottom border 관련 extension
extension CALayer {
    
    func addBorder(edge: UIRectEdge, color: UIColor, thickness: CGFloat) {
        
        let border = CALayer();
        
        switch edge {
        case UIRectEdge.top:
            border.frame = CGRect(x: 0, y: 0, width: self.frame.width, height: thickness)
            break
        case UIRectEdge.bottom:
            border.frame = CGRect(x:0, y:self.frame.height - thickness, width:self.frame.width, height:thickness)
            break
        case UIRectEdge.left:
            border.frame = CGRect(x:0, y:0, width: thickness, height: self.frame.height)
            break
        case UIRectEdge.right:
            border.frame = CGRect(x:self.frame.width - thickness, y: 0, width: thickness, height:self.frame.height)
            break
        default:
            break
        }
        
        border.backgroundColor = color.cgColor;
        
        self.addSublayer(border)
    }
    
}

// MARK: 이미지 첨부
extension MyAccountViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    // Method
    @objc func openGallery() {
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
            self.imagePicker.sourceType = .photoLibrary
            self.imagePicker.delegate = self
            self.imagePicker.allowsEditing = true
            self.present(self.imagePicker, animated: true, completion: { print("이미지 피커 나옴") })
        }
    }
    
    func openCamera() {
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            self.imagePicker.sourceType = .camera
            self.imagePicker.delegate = self
            self.present(self.imagePicker, animated: true, completion: { print("이미지 피커 나옴") })
        }
    }
    
    // imagePickerDelegate
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        print("사용자가 취소함")
        self.dismiss(animated: true) {
            print("이미지 피커 사라짐")
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        //        defer {
        //            self.dismiss(animated: true) {
        //                print("이미지 피커 사라짐")
        //            }
        //        }
        
        if let editedImage: UIImage = info[UIImagePickerControllerEditedImage] as? UIImage {
            profileImageView.image = editedImage
        } else if let originalImage: UIImage = info[UIImagePickerControllerOriginalImage] as? UIImage{
            profileImageView.image = originalImage
        }
        
//        if let imageUrl = info[UIImagePickerControllerReferenceURL] as? URL{
//            profileUrl = imageUrl
//
//
//            print((profileUrl)!)
//            self.userdefault.set((self.profileUrl)!, forKey: "image_profile")
//
//        }
        
//        if let imgUrl = info[UIImagePickerControllerImageURL] as? URL{
//            let imgName = imgUrl.lastPathComponent
//            let documentDirectory = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first
//            let localPath = documentDirectory?.appending(imgName)
//
//            let image = info[UIImagePickerControllerOriginalImage] as! UIImage
//            let data = UIImagePNGRepresentation(image)! as NSData
//            data.write(toFile: localPath!, atomically: true)
//            //let imageData = NSData(contentsOfFile: localPath!)!
//            let photoURL = URL.init(fileURLWithPath: localPath!)//NSURL(fileURLWithPath: localPath!)
//            print(photoURL)
//
//            self.userdefault.set(photoURL, forKey: "image_profile")
//        }
        
        self.dismiss(animated: true) {
            print("이미지 피커 사라짐")
        }
    }
    

}

extension MyAccountViewController  {

    func initDatePicker(){
        
        datePicker.datePickerMode = .date
        
        let dateFormatter = DateFormatter()
        
        dateFormatter.dateFormat = "yyyy.MM.dd"
        
        guard let date = dateFormatter.date(from: "1996.01.29") else {
            fatalError("포맷과 맞지 않아 데이터 변환이 실패했습니다")
        }
        
        datePicker.date = date
        
        datePicker.maximumDate = Date()
        
        
        setTextfieldView(textField: dateTextField, selector: #selector(selectedDatePicker), inputView: datePicker)
    }
    
    func setTextfieldView(textField:UITextField, selector : Selector, inputView : Any){
        
        let bar = UIToolbar()
        bar.sizeToFit()
        
        let doneButton = UIBarButtonItem(title: "확인", style: .done
            , target: self, action: selector)
        
        bar.setItems([doneButton], animated: true)
        textField.inputAccessoryView = bar
        
        if let tempView = inputView as? UIView {
            textField.inputView = tempView
        }
        if let tempView = inputView as? UIControl {
            textField.inputView = tempView
        }
        
    }
    
    @objc func selectedDatePicker(){
        
        let dateformatter = DateFormatter()
        dateformatter.dateFormat = "yyyy-MM-dd"
        
        let date = dateformatter.string(from: datePicker.date)
        
        dateTextField.text = date
        
        view.endEditing(true)
    }
    
}
