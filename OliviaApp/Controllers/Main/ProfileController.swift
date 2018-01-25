//
//  ProfileController.swift
//  OliviaApp
//
//  Created by John Nik on 11/12/17.
//  Copyright © 2017 johnik703. All rights reserved.
//

import UIKit
import SkyFloatingLabelTextField
import JHTAlertController


class ProfileController: UIViewController {
    
    var alertController: JHTAlertController?
    
    let profileImageView: UIImageView = {
        let imageView = UIImageView()
        
        imageView.image = UIImage.makeLetterAvatar(withUsername: "Olivia's Recipes")
        imageView.layer.cornerRadius = 45
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    lazy var usernameTextField: SkyFloatingLabelTextField = {
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
        textField.textColor = .black
        textField.delegate = self
        return textField
    }()
    
    lazy var firstnameTextField: SkyFloatingLabelTextField = {
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
        textField.textColor = .black
        textField.delegate = self
        return textField
    }()
    
    lazy var lastnameTextField: SkyFloatingLabelTextField = {
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
        textField.textColor = .black
        textField.delegate = self
        return textField
    }()
    
    lazy var changePasswordButton: UIButton = {
        
        let button = UIButton(type: .system)
        button.setTitle("Change Password", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = StyleGuideManager.signinButtonBackgroundColor
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(handleChangePassword), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        fetchUserProfile()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.addKeyboardObserver()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.removeKeyboardObserver()
    }
}

//MARK: handle keyboard
extension ProfileController {
    
    fileprivate func addKeyboardObserver() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: .UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: .UIKeyboardWillHide, object: nil)
    }
    
    fileprivate func removeKeyboardObserver() {
        NotificationCenter.default.removeObserver(self, name: .UIKeyboardWillShow, object: nil)
        NotificationCenter.default.removeObserver(self, name: .UIKeyboardWillHide, object: nil)
    }
    
    @objc fileprivate func keyboardWillShow() {
        guard let rect = self.alertController?.view.frame else { return }
        if rect.origin.y >= 0 {
            self.setViewMoveUp(moveUp: true)
        }
    }
    
    @objc fileprivate func keyboardWillHide() {
        guard let rect = self.alertController?.view.frame else { return }
        if rect.origin.y < 0 {
            self.setViewMoveUp(moveUp: false)
        }
    }
    
    private func setViewMoveUp(moveUp: Bool) {
        UIView.beginAnimations(nil, context: nil)
        UIView.setAnimationDuration(0.3)
        
        guard var rect = self.alertController?.view.frame else { return }
        if moveUp {
            rect.origin.y -= kOFFSET_FOR_KEYBOARD
            rect.size.height += kOFFSET_FOR_KEYBOARD
        } else {
            rect.origin.y += kOFFSET_FOR_KEYBOARD
            rect.size.height -= kOFFSET_FOR_KEYBOARD
        }
        self.alertController?.view.frame = rect
        UIView.commitAnimations()
    }
}

//MARK: handle fetch user profile
extension ProfileController {
    
    fileprivate func fetchUserProfile() {
        let userDefaults = UserDefaults.standard
        
        if let fullname = userDefaults.getFullname() {
            self.profileImageView.image = UIImage.makeLetterAvatar(withUsername: fullname)
        }
        
        if let username = userDefaults.getUsername() {
            self.usernameTextField.text = username
        }
        
        if let firstname = userDefaults.getFirstname() {
            self.firstnameTextField.text = firstname
        }
        
        if let lastname = userDefaults.getLastname() {
            self.lastnameTextField.text = lastname
        }
        
    }
    
}

//MARK: handle change password
extension ProfileController {
    
    @objc fileprivate func handleChangePassword() {
        
        self.handleShowingLoginAlertWithPassword(nil)
        
    }
    
    fileprivate func handleShowingLoginAlertWithPassword(_  password: String?) {
        
        alertController = JHTAlertController(title: "", message: "Please make sure you typed Strong Password!", preferredStyle: .alert)
        alertController?.titleImage = UIImage(named: AssetName.alertIcon.rawValue)
        alertController?.titleViewBackgroundColor = .white
        alertController?.titleTextColor = .black
        alertController?.alertBackgroundColor = .white
        alertController?.messageFont = .systemFont(ofSize: 15)
        alertController?.messageTextColor = .black
        alertController?.dividerColor = .black
        alertController?.setButtonTextColorFor(.default, to: .white)
        alertController?.setButtonBackgroundColorFor(.default, to: StyleGuideManager.signinButtonBackgroundColor)
        alertController?.setButtonTextColorFor(.cancel, to: .black)
        alertController?.setButtonBackgroundColorFor(.cancel, to: .white)
        alertController?.hasRoundedCorners = true
        
        let cancelAction = JHTAlertAction(title: "Later", style: .cancel,  handler: nil)
        let okAction = JHTAlertAction(title: "Yes", style: .default) { (action) in
            
            guard let passwordTextField = self.alertController?.textFields?[0] else { return }
            
            guard let passwordStr = passwordTextField.text else { return }
            
            if passwordStr.isEmpty {
                return
            }
            
            UserDefaults.standard.setPassword(passwordStr)
        }
        
        alertController?.addTextFieldWithConfigurationHandler { (textField) in
            textField.placeholder = "Password"
            textField.backgroundColor = .white
            textField.textColor = .black
            textField.isSecureTextEntry = true
            textField.borderStyle = .roundedRect
            if let password = password {
                textField.text = password
            }
        }
        
        alertController?.addAction(cancelAction)
        alertController?.addAction(okAction)
        
        present(alertController!, animated: true, completion: nil)
        
    }
}

//MARK: handle save
extension ProfileController {
    
    @objc fileprivate func handleSave() {
        
        self.showJHTAlertDefaultWithIcon(message: "Please make sure you changed your profile Info.", firstActionTitle: "No", secondActionTitle: "Yes") { (action) in
            if !(self.checkInvalid()) {
                return
            }
            
            self.setUserDefaults()
        }
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
        if let firstname = firstnameTextField.text, let lastname = lastnameTextField.text {
            userDefaults.setUserFullName(firstname + " " + lastname)
        }
    }
    
}

//MARK: check valid
extension ProfileController {
    
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
}

//MARK: handle textfield invalid
extension ProfileController: UITextFieldDelegate {
    
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
        } else {
            if let emailField = textField as? SkyFloatingLabelTextFieldWithIcon {
                
                if self.isValidEmail(text) {
                    emailField.errorMessage = ""
                } else {
                    emailField.errorMessage = "Invalid Email"
                }
                
            }
            return true
        }
    }
}

extension ProfileController {
    
    fileprivate func setupViews() {
        
        setupImageView()
        setupTextFields()
        setupNavBar()
//        setupStatusBar()
    }
    
    private func setupTextFields() {
        view.addSubview(usernameTextField)
        view.addSubview(firstnameTextField)
        view.addSubview(lastnameTextField)
        view.addSubview(changePasswordButton)
        
        _ = usernameTextField.anchor(profileImageView.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, topConstant: 15, leftConstant: 50, bottomConstant: 0, rightConstant: 50, widthConstant: 0, heightConstant: 50)
        
        _ = firstnameTextField.anchor(usernameTextField.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, topConstant: 10, leftConstant: 50, bottomConstant: 0, rightConstant: 50, widthConstant: 0, heightConstant: 50)
        
        _ = lastnameTextField.anchor(firstnameTextField.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, topConstant: 10, leftConstant: 50, bottomConstant: 0, rightConstant: 50, widthConstant: 0, heightConstant: 50)
        
        _ = changePasswordButton.anchor(lastnameTextField.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, topConstant: 10, leftConstant: 50, bottomConstant: 0, rightConstant: 50, widthConstant: 10, heightConstant: 50)
    }
    
    private func setupNavBar() {
        
        view.backgroundColor = .white
        
        navigationItem.title = "Profile"
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.barTintColor = StyleGuideManager.currentPageIndicatorGreenTintColor
        navigationController?.navigationBar.tintColor = .white
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.white, NSAttributedStringKey.font: UIFont.boldSystemFont(ofSize: 24)]
        
        let saveButton = UIBarButtonItem(title: "Save", style: .plain, target: self, action: #selector(handleSave))
        navigationItem.rightBarButtonItem = saveButton
        
    }
    
    private func setupImageView() {
        view.addSubview(profileImageView)
        
        _ = profileImageView.anchor(self.topLayoutGuide.bottomAnchor, left: nil, bottom: nil, right: nil, topConstant: 25, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 90, heightConstant: 90)
        profileImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
    
    fileprivate func setupStatusBar() {
        let statusBarBackgroundView = UIView()
        statusBarBackgroundView.backgroundColor = StyleGuideManager.currentPageIndicatorGreenTintColor
        if let window = UIApplication.shared.keyWindow {
            window.addSubview(statusBarBackgroundView)
            window.addConnstraintsWith(Format: "H:|[v0]|", views: statusBarBackgroundView)
            window.addConnstraintsWith(Format: "V:|[v0(20)]", views: statusBarBackgroundView)
        }
    }
}
