//
//  SignupController.swift
//  OliviaApp
//
//  Created by John Nik on 11/22/17.
//  Copyright © 2017 johnik703. All rights reserved.
//

import UIKit
import SkyFloatingLabelTextField


class SignupController: UIViewController {
    
    lazy var usernameTextField: SkyFloatingLabelTextFieldWithIcon = {
        let textField = SkyFloatingLabelTextFieldWithIcon()
        textField.title = "Username"
        textField.iconFont = UIFont(name: "FontAwesome", size: 20)
        textField.iconText = AssetName.username.rawValue
        textField.placeholder = "Username"
        textField.tintColor = StyleGuideManager.currentPageIndicatorGreenTintColor
        textField.selectedTitleColor = StyleGuideManager.currentPageIndicatorGreenTintColor
        textField.selectedLineColor = StyleGuideManager.currentPageIndicatorGreenTintColor
        textField.selectedIconColor = StyleGuideManager.currentPageIndicatorGreenTintColor
        textField.keyboardType = .default
        textField.textColor = .white
        textField.delegate = self
        return textField
    }()
    
    lazy var firstnameTextField: SkyFloatingLabelTextFieldWithIcon = {
        let textField = SkyFloatingLabelTextFieldWithIcon()
        textField.title = "First Name"
        textField.iconFont = UIFont(name: "FontAwesome", size: 20)
        textField.iconText = AssetName.username.rawValue
        textField.placeholder = "First Name"
        textField.tintColor = StyleGuideManager.currentPageIndicatorGreenTintColor
        textField.selectedTitleColor = StyleGuideManager.currentPageIndicatorGreenTintColor
        textField.selectedLineColor = StyleGuideManager.currentPageIndicatorGreenTintColor
        textField.selectedIconColor = StyleGuideManager.currentPageIndicatorGreenTintColor
        textField.keyboardType = .default
        textField.textColor = .white
        textField.delegate = self
        return textField
    }()
    
    lazy var lastnameTextField: SkyFloatingLabelTextFieldWithIcon = {
        let textField = SkyFloatingLabelTextFieldWithIcon()
        textField.title = "Last Name"
        textField.iconFont = UIFont(name: "FontAwesome", size: 20)
        textField.iconText = AssetName.username.rawValue
        textField.placeholder = "Last Name"
        textField.tintColor = StyleGuideManager.currentPageIndicatorGreenTintColor
        textField.selectedTitleColor = StyleGuideManager.currentPageIndicatorGreenTintColor
        textField.selectedLineColor = StyleGuideManager.currentPageIndicatorGreenTintColor
        textField.selectedIconColor = StyleGuideManager.currentPageIndicatorGreenTintColor
        textField.keyboardType = .default
        textField.textColor = .white
        textField.delegate = self
        return textField
    }()
    
    lazy var emailTextField: SkyFloatingLabelTextFieldWithIcon = {
        let textField = SkyFloatingLabelTextFieldWithIcon()
        textField.title = "Email"
        textField.iconFont = UIFont(name: "FontAwesome", size: 20)
        textField.iconText = AssetName.email.rawValue
        textField.placeholder = "Email"
        textField.tintColor = StyleGuideManager.currentPageIndicatorGreenTintColor
        textField.selectedTitleColor = StyleGuideManager.currentPageIndicatorGreenTintColor
        textField.selectedLineColor = StyleGuideManager.currentPageIndicatorGreenTintColor
        textField.selectedIconColor = StyleGuideManager.currentPageIndicatorGreenTintColor
        textField.keyboardType = .emailAddress
        textField.textColor = .white
        textField.delegate = self
        return textField
    }()
    
    lazy var passwordTextField: SkyFloatingLabelTextFieldWithIcon = {
        let textField = SkyFloatingLabelTextFieldWithIcon()
        textField.title = "Password"
        textField.iconFont = UIFont(name: "FontAwesome", size: 20)
        textField.iconText = AssetName.password.rawValue
        textField.placeholder = "Password"
        textField.tintColor = StyleGuideManager.currentPageIndicatorGreenTintColor
        textField.selectedTitleColor = StyleGuideManager.currentPageIndicatorGreenTintColor
        textField.selectedLineColor = StyleGuideManager.currentPageIndicatorGreenTintColor
        textField.selectedIconColor = StyleGuideManager.currentPageIndicatorGreenTintColor
        textField.isSecureTextEntry = true
        textField.textColor = .white
        textField.delegate = self
        return textField
    }()
    
    lazy var signupButton: UIButton = {
        
        let button = UIButton(type: .system)
        button.setTitle("Sign up", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = StyleGuideManager.signinButtonBackgroundColor
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(handleSignup), for: .touchUpInside)
        return button
    }()
    
    lazy var dismissButton: UIButton = {
        let button = UIButton(type: .system)
        let image = UIImage(named: AssetName.cancel.rawValue)
        button.setImage(image, for: .normal)
        button.tintColor = .white
        button.addTarget(self, action: #selector(handleDismissController), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
}

//MARK: check valid
extension SignupController {
    
    fileprivate func checkInvalid() -> Bool {
        
        if (usernameTextField.text?.isEmpty)! || !self.isValidUsername(usernameTextField.text!) {
            self.showJHTAlerttOkayWithIcon(message: "Invalid Username!\nPlease type valid Username")
            return false
        }
        
        if (firstnameTextField.text?.isEmpty)! || !self.isValidUsername(firstnameTextField.text!) {
            self.showJHTAlerttOkayWithIcon(message: "Invalid First Name!\nPlease type valid First Name")
            return false
        }
        
        if (lastnameTextField.text?.isEmpty)! || !self.isValidUsername(lastnameTextField.text!) {
            self.showJHTAlerttOkayWithIcon(message: "Invalid Last Name!\nPlease type valid Last Name")
            return false
        }
        
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
    
    fileprivate func isValidUsername(_ username: String) -> Bool {
        if username.count >= 3 && !username.contains(" ") {
            return true
        } else {
            return false
        }
    }
    
    fileprivate func isValidFirstName(_ firstname: String) -> Bool {
        if firstname.count >= 1 && !firstname.contains(" ") {
            return true
        } else {
            return false
        }
    }
    
    fileprivate func isValidLastName(_ lastname: String) -> Bool {
        if lastname.count >= 1 && !lastname.contains(" ") {
            return true
        } else {
            return false
        }
    }
    
    fileprivate func isValidPassword(_ password: String) -> Bool {
        if password.count >= 5 {
            return true
        } else {
            return false
        }
    }
}

//MARK: handle textfield invalid
extension SignupController: UITextFieldDelegate {
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        guard let text = textField.text else {
            return false
        }
        
        if textField == usernameTextField {
            
            if let usernameField = textField as? SkyFloatingLabelTextFieldWithIcon {
                if self.isValidUsername(text) {
                    usernameField.errorMessage = ""
                } else {
                    usernameField.errorMessage = "Invalid Username"
                }
            }
            return true
        } else if textField == firstnameTextField {
            if let emailField = textField as? SkyFloatingLabelTextFieldWithIcon {
                
                if self.isValidFirstName(text) {
                    emailField.errorMessage = ""
                } else {
                    emailField.errorMessage = "Invalid First Name"
                }
                
            }
            return true
        } else if textField == lastnameTextField {
            if let emailField = textField as? SkyFloatingLabelTextFieldWithIcon {
                
                if self.isValidLastName(text) {
                    emailField.errorMessage = ""
                } else {
                    emailField.errorMessage = "Invalid Last Name"
                }
                
            }
            return true
        } else if textField == emailTextField {
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
}

//MARK: handle Signup
extension SignupController {
    
    @objc fileprivate func handleSignup() {
        
        if !(checkInvalid()) {
            return
        }
        
        self.setUserDefaults()
        
        self.handleDismissController()
    }
    
    private func setUserDefaults() {
        
        let userDefaults = UserDefaults.standard
        
        if let username = usernameTextField.text {
            userDefaults.setUsername(username)
        }
        if let firstname = firstnameTextField.text {
            userDefaults.setFirstname(firstname)
        }
        if let lastname = lastnameTextField.text {
            userDefaults.setLastname(lastname)
        }
        if let email = emailTextField.text {
            userDefaults.setEmail(email)
        }
        if let firstname = firstnameTextField.text, let lastname = lastnameTextField.text {
            userDefaults.setUserFullName(firstname + " " + lastname)
        }
        if let password = passwordTextField.text {
            userDefaults.setPassword(password)
        }
    }
    
}

//MARK: handle dismiss
extension SignupController {
    @objc fileprivate func handleDismissController() {
        dismiss(animated: true, completion: nil)
    }
}

//MARK: setup views
extension SignupController {
    
    fileprivate func setupViews() {
        setupBackground()
        setupNavBar()
        setupTextFields()
        setupSignupButton()
    }
    
    private func setupSignupButton() {
        view.addSubview(signupButton)
        
        _ = signupButton.anchor(passwordTextField.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, topConstant: 10, leftConstant: 50, bottomConstant: 0, rightConstant: 50, widthConstant: 0, heightConstant: 40)
    }
    
    private func setupTextFields() {
        view.addSubview(usernameTextField)
        view.addSubview(firstnameTextField)
        view.addSubview(lastnameTextField)
        view.addSubview(emailTextField)
        view.addSubview(passwordTextField)
        
        _ = usernameTextField.anchor(dismissButton.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, topConstant: 0, leftConstant: 50, bottomConstant: 0, rightConstant: 50, widthConstant: 0, heightConstant: 50)
        
        _ = firstnameTextField.anchor(usernameTextField.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, topConstant: 10, leftConstant: 50, bottomConstant: 0, rightConstant: 50, widthConstant: 0, heightConstant: 50)
        
        _ = lastnameTextField.anchor(firstnameTextField.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, topConstant: 10, leftConstant: 50, bottomConstant: 0, rightConstant: 50, widthConstant: 0, heightConstant: 50)
        
        _ = emailTextField.anchor(lastnameTextField.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, topConstant: 10, leftConstant: 50, bottomConstant: 0, rightConstant: 50, widthConstant: 0, heightConstant: 50)
        
        _ = passwordTextField.anchor(emailTextField.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, topConstant: 10, leftConstant: 50, bottomConstant: 0, rightConstant: 50, widthConstant: 0, heightConstant: 50)
    }
    
    private func setupNavBar() {
        view.addSubview(dismissButton)
        
        _ = dismissButton.anchor(view.topAnchor, left: view.leftAnchor, bottom: nil, right: nil, topConstant: 30, leftConstant: 20, bottomConstant: 0, rightConstant: 0, widthConstant: 30, heightConstant: 30)
    }
    
    private func setupBackground() {
        
        let backgroundImage = UIImage(named: AssetName.firstPage.rawValue)
        let backgroundImageView = UIImageView(image: backgroundImage)
        backgroundImageView.alpha = 0.3
        
        view.addSubview(backgroundImageView)
        
        backgroundImageView.anchorToTop(view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor)
        
        
//        let statusBarBackgroundView = UIView()
//        statusBarBackgroundView.backgroundColor = StyleGuideManager.signupStatusBarColor
//        if let window = UIApplication.shared.keyWindow {
//            window.addSubview(statusBarBackgroundView)
//            window.addConnstraintsWith(Format: "H:|[v0]|", views: statusBarBackgroundView)
//            window.addConnstraintsWith(Format: "V:|[v0(20)]", views: statusBarBackgroundView)
//        }
        
    }
    
}

