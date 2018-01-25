//
//  LoginController.swift
//  OliviaApp
//
//  Created by John Nik on 11/22/17.
//  Copyright © 2017 johnik703. All rights reserved.
//

import UIKit
import SkyFloatingLabelTextField

enum LoginType {
    
    case EmailEmpty
    case PasswordEmpty
    case WrongEmail
    case WrongPassword
}

class LoginController: UIViewController {
    
    let cellId = "cellId"
    
    let pages: [Page] = {
        
        let firstPage = Page(title: "", message: "", imageName: AssetName.firstPage.rawValue, textColor: StyleGuideManager.firstTextColor)
        let secondPage = Page(title: "", message: "", imageName: AssetName.secondPage.rawValue, textColor: StyleGuideManager.secondTextColor)
        let thirdPage = Page(title: "", message: "", imageName: AssetName.thirdPage.rawValue, textColor: StyleGuideManager.thirdTextColor)
        
        return [firstPage, secondPage, thirdPage]
    }()
    
    lazy var pageControl: UIPageControl = {
        let pc = UIPageControl()
        pc.pageIndicatorTintColor = .lightGray
        pc.currentPageIndicatorTintColor = StyleGuideManager.currentPageIndicatorGreenTintColor
        pc.numberOfPages = self.pages.count
        return pc
    }()
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 0
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = .white
        cv.delegate = self
        cv.dataSource = self
        cv.isPagingEnabled = true
        return cv
    }()
    
    lazy var loginButton: UIButton = {
        
        let button = UIButton(type: .system)
        button.setTitle("SIGN IN", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        button.backgroundColor = StyleGuideManager.signinButtonBackgroundColor
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(handleLogin), for: .touchUpInside)
        return button
    }()
    
    lazy var emailTextField: SkyFloatingLabelTextFieldWithIcon = {
        
        let textField = SkyFloatingLabelTextFieldWithIcon()
        textField.title = "Email"
        textField.iconFont = UIFont(name: "FontAwesome", size: 20)
        textField.iconText = AssetName.email.rawValue
        textField.placeholder = "Email"
        textField.keyboardType = .emailAddress
        textField.setPropertiesForLoginPage()
        textField.delegate = self
        return textField
    }()
    
    lazy var passwordTextField: SkyFloatingLabelTextFieldWithIcon = {
        let textField = SkyFloatingLabelTextFieldWithIcon()
        textField.title = "Password"
        textField.iconFont = UIFont(name: "FontAwesome", size: 20)
        textField.iconText = AssetName.password.rawValue
        textField.placeholder = "Password"
        textField.isSecureTextEntry = true
        textField.setPropertiesForLoginPage()
        textField.delegate = self
        return textField
    }()
    
    lazy var signupTextView: UITextView = {
       
        let textView = UITextView()
        textView.backgroundColor = .clear
        textView.isEditable = false
        //MARK: handle text attribute
        
        let style = NSMutableParagraphStyle()
        style.alignment = .center
        
        let agreeAttributedString = NSMutableAttributedString(string: "Not Yet Registered? Click Here!", attributes: [NSAttributedStringKey.foregroundColor: UIColor.white, NSAttributedStringKey.paragraphStyle: style])
        
        agreeAttributedString.addAttributes([NSAttributedStringKey.font: UIFont.systemFont(ofSize: 16)], range: NSRange(location: 0, length: 19))
        
        let termsRange = NSRange(location: 20, length: 11)
        let termsAttribute = ["sign up": "sign up", NSAttributedStringKey.font.rawValue: UIFont.systemFont(ofSize: 18, weight: UIFont.Weight.bold), NSAttributedStringKey.underlineStyle.rawValue: NSUnderlineStyle.styleSingle.rawValue] as [String : Any]
        agreeAttributedString.addAttributes(termsAttribute.toNSAttributedStringKeys(), range: termsRange)
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(handleTapGesture))
        textView.isUserInteractionEnabled = true
        textView.addGestureRecognizer(tap)
        
        textView.attributedText = agreeAttributedString
        return textView
    }()
    
    lazy var agreeTextView: UITextView = {
        let textView = UITextView()
        textView.backgroundColor = .clear
        textView.isEditable = false
        //MARK: handle text attribute
        
        let style = NSMutableParagraphStyle()
        style.alignment = .center
        
        let agreeAttributedString = NSMutableAttributedString(string: "By signing up, you are agreeing to our Terms of Service and Privacy Policy", attributes: [NSAttributedStringKey.foregroundColor: UIColor.black, NSAttributedStringKey.paragraphStyle: style])
        
        agreeAttributedString.addAttributes([NSAttributedStringKey.font: UIFont.systemFont(ofSize: 15)], range: NSRange(location: 0, length: 38))
        
        let termsRange = NSRange(location: 39, length: 16)
        let termsAttribute = ["terms": "terms of value", NSAttributedStringKey.font.rawValue: UIFont.systemFont(ofSize: 16, weight: UIFont.Weight.bold), NSAttributedStringKey.underlineStyle.rawValue: NSUnderlineStyle.styleSingle.rawValue] as [String : Any]
        agreeAttributedString.addAttributes(termsAttribute.toNSAttributedStringKeys(), range: termsRange)
        
        
        agreeAttributedString.addAttributes([NSAttributedStringKey.font: UIFont.systemFont(ofSize: 15)], range: NSRange(location: 55, length: 5))
        
        
        let policyRange = NSRange(location: 60, length: 14)
        let policyAttribute = ["policy": "policy of value", NSAttributedStringKey.font.rawValue: UIFont.systemFont(ofSize: 16, weight: UIFont.Weight.bold), NSAttributedStringKey.underlineStyle.rawValue: NSUnderlineStyle.styleSingle.rawValue] as [String : Any]
        agreeAttributedString.addAttributes(policyAttribute.toNSAttributedStringKeys(), range: policyRange)
        
        
        textView.attributedText = agreeAttributedString
        
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(handleTapGesture))
        textView.isUserInteractionEnabled = true
        textView.addGestureRecognizer(tap)
        textView.translatesAutoresizingMaskIntoConstraints = false
        
        return textView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
//        self.setupStatusBar()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
}

//MARK: handle tapgesture for terms and policy

extension LoginController {
    
    @objc fileprivate func handleTapGesture(sender: UITapGestureRecognizer) {
        
        let textView = sender.view as! UITextView
        let layoutManager = textView.layoutManager
        
        var location = sender.location(in: textView)
        location.x -= textView.textContainerInset.left
        location.y -= textView.textContainerInset.top
        
        let characterIndex = layoutManager.characterIndex(for: location, in: textView.textContainer, fractionOfDistanceBetweenInsertionPoints: nil)
        
        if characterIndex < textView.textStorage.length {
            // print the character index
            print("character index: \(characterIndex)")
            
            // print the character at the index
            let myRange = NSRange(location: characterIndex, length: 1)
            let substring = (textView.attributedText.string as NSString).substring(with: myRange)
            print("character at index: \(substring)")
            
            // check if the tap location has a certain attribute
            
            if textView == agreeTextView {
                let termsName = "terms"
                let termsValue = textView.attributedText.attribute(NSAttributedStringKey(rawValue: termsName), at: characterIndex, effectiveRange: nil) as? String
                
                let policyName = "policy"
                let policyValue = textView.attributedText.attribute(NSAttributedStringKey(rawValue: policyName), at: characterIndex, effectiveRange: nil) as? String
                
                if let termsValue = termsValue {
                    print("You tapped on \(termsName) and the value is: \(termsValue)")
                    
                    let termsController = AgreementController()
                    termsController.agreementState = AgreementState.TermsOfService
                    let navController = UINavigationController(rootViewController: termsController)
                    self.present(navController, animated: true, completion: nil)
                    
                } else if let policyValue = policyValue {
                    print("You tapped on \(policyName) and the value is: \(policyValue)")
                    
                    let privacyController = AgreementController()
                    privacyController.agreementState = AgreementState.PrivacyPolicy
                    let navController = UINavigationController(rootViewController: privacyController)
                    self.present(navController, animated: true, completion: nil)
                }
            } else if textView == signupTextView {
                
                let signupName = "sign up"
                let signupValue = textView.attributedText.attribute(NSAttributedStringKey(rawValue: signupName), at: characterIndex, effectiveRange: nil) as? String
                
                if let signupValue = signupValue {
                    print("You tapped on \(signupName) and the value is: \(signupValue)")
                    self.handleGoingToSignupController()
                    
                }
                
            }
            
            
        }
    }
    
}


//MARK: handle textfield invalid
extension LoginController: UITextFieldDelegate {
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        guard let text = textField.text else {
            return false
        }
        
        if textField == emailTextField {
            if let emailField = textField as? SkyFloatingLabelTextFieldWithIcon {
                
                if self.isValidEmail(text) {
                    emailField.errorMessage = ""
                } else {
                    emailField.errorMessage = "Invalid Email"
                }
                
            }
            return true
        } else {
            if let passwordField = textField as? SkyFloatingLabelTextFieldWithIcon {
                if self.isValidPassword(text) {
                    passwordField.errorMessage = ""
                } else {
                    passwordField.errorMessage = "Weak Password"
                }
            }
            return true
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        textField.resignFirstResponder()
        return true
        
    }
}

//MARK: handle signup, sign in
extension LoginController {
    
    @objc fileprivate func handleGoingToSignupController() {
        
        let signupController = SignupController()
        present(signupController, animated: true, completion: nil)
    }
    
    @objc fileprivate func handleLogin() {
        
        if !(checkInvalid()) {
            return
        }
        
        finishLoggingIn()
        
    }
    
    private func finishLoggingIn()  {
        
        UserDefaults.standard.setIsLoggedIn(value: true)
        NotificationCenter.default.post(name: .sideMenuReloadData, object: nil)
        dismiss(animated: true, completion: nil)
        
    }
    
}

//MARK: check valid
extension LoginController {
    
    fileprivate func checkInvalid() -> Bool {
        
        if (emailTextField.text?.isEmptyStr)! || !self.isValidEmail(emailTextField.text!) {
            self.showJHTAlerttOkayWithIcon(message: "Invalid Email!\nPlease type valid Email")
            return false
        }
        
        if (passwordTextField.text?.isEmptyStr)! || !self.isValidPassword(passwordTextField.text!) {
            self.showJHTAlerttOkayWithIcon(message: "Invalid Password!\nPlease type valid Password")
            return false
        }
        return true
    }
    
    fileprivate func isValidEmail(_ email: String) -> Bool {
        // print("validate calendar: \(testStr)")
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: email)
    }
    
    fileprivate func isValidPassword(_ password: String) -> Bool {
        if password.count >= 5 {
            return true
        } else {
            return false
        }
    }
}

//MARK: handle scroll
extension LoginController {
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        
        let pageNumber = Int(targetContentOffset.pointee.x / view.frame.width)
        pageControl.currentPage = pageNumber
        
    }
}

//MARK: handle collectonview delegate, datasource, flowlayout
extension LoginController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pages.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! PageCell
        let page = pages[indexPath.item]
        cell.page = page
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: view.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
}


//MARK: setup views
extension LoginController {
    
    fileprivate func setupViews() {
        setupCollectionView()
        setupPageControl()
        signinStuff()
        setupTextViews()
        setupSignupTextView()
    }
    
    private func setupTextViews() {
        
        view.addSubview(agreeTextView)
        
        agreeTextView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        agreeTextView.widthAnchor.constraint(equalToConstant: DEVICE_WIDTH * 0.8).isActive = true
        
        let height = estimateFrameForText(text: agreeTextView.text!).height + 12
        
        agreeTextView.heightAnchor.constraint(equalToConstant: height).isActive = true
        agreeTextView.bottomAnchor.constraint(equalTo: pageControl.topAnchor, constant: 10).isActive = true
        
    }
    
    private func setupSignupTextView() {
        
        view.addSubview(signupTextView)
        
        _ = signupTextView.anchor(loginButton.bottomAnchor, left: nil, bottom: nil, right: nil, topConstant: 20, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: DEVICE_WIDTH, heightConstant: 30)
        signupTextView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
    }
    
    private func estimateFrameForText(text: String) -> CGRect {
        
        let size = CGSize(width: DEVICE_WIDTH * 0.8, height: 1000)
        let options = NSStringDrawingOptions.usesFontLeading.union(.usesLineFragmentOrigin)
        
        return NSString(string: text).boundingRect(with: size, options: options, attributes: [NSAttributedStringKey.font: UIFont.systemFont(ofSize: 16)], context: nil)
        
    }

    
    private func signinStuff() {
        
        view.addSubview(emailTextField)
        view.addSubview(passwordTextField)
        view.addSubview(loginButton)
        
        _ = passwordTextField.anchor(nil, left: nil, bottom: view.centerYAnchor, right: nil, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 50)
        passwordTextField.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8).isActive = true
        passwordTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        _ = emailTextField.anchor(nil, left: nil, bottom: passwordTextField.topAnchor, right: nil, topConstant: 0, leftConstant: 0, bottomConstant: 10, rightConstant: 0, widthConstant: 0, heightConstant: 50)
        emailTextField.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8).isActive = true
        emailTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        _ = loginButton.anchor(passwordTextField.bottomAnchor, left: nil, bottom: nil, right: nil, topConstant: 20, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 50)
        loginButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8).isActive = true
        loginButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
    }
    
    private func setupPageControl() {
        view.addSubview(pageControl)
        
        _ = pageControl.anchor(nil, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 30)
    }
    
    private func setupCollectionView() {
        view.addSubview(collectionView)
        collectionView.anchorToTop(view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor)
        
        collectionView.register(PageCell.self, forCellWithReuseIdentifier: cellId)
        
        
        
    }
    
    fileprivate func setupStatusBar() {
        let statusBarBackgroundView = UIView()
        statusBarBackgroundView.backgroundColor = StyleGuideManager.loginStatusBarColor
        if let window = UIApplication.shared.keyWindow {
            window.addSubview(statusBarBackgroundView)
            window.addConnstraintsWith(Format: "H:|[v0]|", views: statusBarBackgroundView)
            window.addConnstraintsWith(Format: "V:|[v0(20)]", views: statusBarBackgroundView)
        }
    }
}

extension SkyFloatingLabelTextFieldWithIcon {
    
    func setPropertiesForLoginPage() {
        self.placeholderColor = .darkGray
        self.lineColor = .darkGray
        self.iconColor = .darkGray
        
        self.tintColor = StyleGuideManager.currentPageIndicatorGreenTintColor
        self.selectedTitleColor = StyleGuideManager.currentPageIndicatorGreenTintColor
        self.selectedLineColor = StyleGuideManager.currentPageIndicatorGreenTintColor
        self.selectedIconColor = StyleGuideManager.currentPageIndicatorGreenTintColor
        self.textColor = .black
    }
    
}




























