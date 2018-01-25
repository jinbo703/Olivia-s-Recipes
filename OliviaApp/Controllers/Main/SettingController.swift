//
//  SettingController.swift
//  OliviaApp
//
//  Created by John Nik on 11/22/17.
//  Copyright © 2017 johnik703. All rights reserved.
//

import UIKit
import CZPicker

class SettingControllr: UIViewController {
    
    let styles = ["Default", "Light", "DarK"]
    
    let cellId = "cellId"
    
    var LoadPhotoCell: UITableViewCell = {
        let cell = UITableViewCell()
        
        let loadPhotoLabel = UILabel(frame: CGRect(x: 20, y: 5, width: 250, height: 50))
        
        let attributedText = NSMutableAttributedString(string: "Load HD photo", attributes: [NSAttributedStringKey.font: UIFont.systemFont(ofSize: 20)])
        
        attributedText.append(NSAttributedString(string: "\nAlways load high defination photo", attributes: [NSAttributedStringKey.font: UIFont.systemFont(ofSize: 13), NSAttributedStringKey.foregroundColor: UIColor.gray]))
        
        loadPhotoLabel.attributedText = attributedText
        loadPhotoLabel.textAlignment = .left
        loadPhotoLabel.numberOfLines = 2
        
        
        let photoSwitch = UISwitch(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
        photoSwitch.isOn = true
        photoSwitch.onTintColor = StyleGuideManager.currentPageIndicatorGreenTintColor
        photoSwitch.thumbTintColor = .white
        photoSwitch.tintColor = .gray
        
        cell.addSubview(loadPhotoLabel)
        cell.accessoryView = photoSwitch
        cell.selectionStyle = .none
        cell.backgroundColor = .clear
        return cell
    }()
    var LanguageCell: UITableViewCell = {
        
        let cell = UITableViewCell()
        
        let languageLabel = UILabel(frame: CGRect(x: 20, y: 10, width: 200, height: 40))
        languageLabel.text = "Language"
        languageLabel.font = UIFont.systemFont(ofSize: 20)
        
        let englishLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 70, height: 50))
        englishLabel.text = "English"
        englishLabel.textAlignment = .center
        englishLabel.textColor = .gray
        englishLabel.font = UIFont.systemFont(ofSize: 15)
        
        cell.addSubview(languageLabel)
        cell.accessoryView = englishLabel
        cell.selectionStyle = .none
        cell.backgroundColor = .clear
        return cell
        
    }()
    
    var CurrencyCell: UITableViewCell = {
        
        let cell = UITableViewCell()
        
        let currencyLabel = UILabel(frame: CGRect(x: 20, y: 10, width: 200, height: 40))
        currencyLabel.text = "Currency"
        currencyLabel.font = UIFont.systemFont(ofSize: 20)
        
        let usdLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 80, height: 50))
        usdLabel.text = "USD US $"
        usdLabel.textAlignment = .center
        usdLabel.textColor = .gray
        usdLabel.font = UIFont.systemFont(ofSize: 15)
        
        cell.addSubview(currencyLabel)
        cell.accessoryView = usdLabel
        cell.selectionStyle = .none
        cell.backgroundColor = .clear
        return cell
        
    }()
    var ClearHistoryCell: UITableViewCell = {
        let cell = UITableViewCell()
        
        let label = UILabel(frame: CGRect(x: 20, y: 10, width: 200, height: 40))
        label.text = "Clear app History"
        label.font = UIFont.systemFont(ofSize: 20)
        
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
        imageView.image = UIImage(named: AssetName.trash.rawValue)?.withRenderingMode(.alwaysTemplate)
        imageView.tintColor = .gray
        
        cell.addSubview(label)
        cell.accessoryView = imageView
        cell.selectionStyle = .none
        cell.backgroundColor = .clear
        return cell
    }()
    var privacyCell: UITableViewCell = {
        let cell = UITableViewCell()
        let privacyLabel = UILabel(frame: CGRect(x: 20, y: 10, width: 200, height: 40))
        privacyLabel.text = "Privacy Policy"
        privacyLabel.textAlignment = .left
        privacyLabel.font = UIFont.systemFont(ofSize: 20)
        
        cell.accessoryType = .disclosureIndicator
        cell.selectionStyle = .none
        cell.addSubview(privacyLabel)
        cell.backgroundColor = .clear
        return cell
        
    }()
    var termsCell: UITableViewCell = {
        let cell = UITableViewCell()
        let termsLabel = UILabel(frame: CGRect(x: 20, y: 10, width: 200, height: 40))
        termsLabel.text = "Terms of Service"
        termsLabel.textAlignment = .left
        termsLabel.font = UIFont.systemFont(ofSize: 20)
        
        cell.accessoryType = .disclosureIndicator
        cell.selectionStyle = .none
        cell.backgroundColor = .clear
        cell.addSubview(termsLabel)
        return cell
    }()
    var NotificationCell: UITableViewCell = {
        
        let cell = UITableViewCell()
        
        let muteLabel = UILabel(frame: CGRect(x: 20, y: 5, width: 250, height: 50))
        let attributedText = NSMutableAttributedString(string: "Mute Notifications", attributes: [NSAttributedStringKey.font: UIFont.systemFont(ofSize: 20)])
        
        attributedText.append(NSAttributedString(string: "\nMute all notification this app", attributes: [NSAttributedStringKey.font: UIFont.systemFont(ofSize: 13), NSAttributedStringKey.foregroundColor: UIColor.gray]))
        
        muteLabel.attributedText = attributedText
        muteLabel.textAlignment = .left
        muteLabel.numberOfLines = 2
        
        let versionSwitch = UISwitch(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
        versionSwitch.isOn = false
        versionSwitch.onTintColor = StyleGuideManager.currentPageIndicatorGreenTintColor
        versionSwitch.thumbTintColor = .white
        versionSwitch.tintColor = .gray
        
        cell.addSubview(muteLabel)
        cell.accessoryView = versionSwitch
        cell.selectionStyle = .none
        cell.backgroundColor = .clear
        return cell
    }()
    var VersionCell: UITableViewCell = {
        let cell = UITableViewCell()
        
        let versionLabel = UILabel(frame: CGRect(x: 20, y: 10, width: 200, height: 40))
        versionLabel.text = "Version"
        versionLabel.font = UIFont.systemFont(ofSize: 20)
        
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
        label.text = "1.0.0"
        label.textAlignment = .center
        label.textColor = .gray
        label.font = UIFont.systemFont(ofSize: 15)
        
        cell.addSubview(versionLabel)
        cell.accessoryView = label
        cell.selectionStyle = .none
        cell.backgroundColor = .clear
        return cell
    }()
    var userInterfaceCell: UITableViewCell = UITableViewCell()
    
    lazy var tableView: UITableView = {
        
        let tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        return tableView
        
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
    
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupBackground()
    }
}

//MARK: handle logout
extension SettingControllr {
    fileprivate func handleLogout() {
        
        self.showJHTAlertDefaultWithIcon(message: "Are you sure you want to Log out?", firstActionTitle: "No", secondActionTitle: "Yes") { (action) in
            
            UserDefaults.standard.setIsLoggedIn(value: false)
            
            let loginController = LoginController()
            self.present(loginController, animated: true, completion: nil)
        }
    }
}

//MARK: handle user interface
extension SettingControllr: CZPickerViewDelegate, CZPickerViewDataSource {
    
    fileprivate func handleShowSelectPicker() {
        
        let picker = CZPickerView(headerTitle: "Select Style", cancelButtonTitle: "Later", confirmButtonTitle: "Confirm")
        picker?.delegate = self
        picker?.dataSource = self
        picker?.needFooterView = true
        picker?.allowMultipleSelection = false
        picker?.headerBackgroundColor = StyleGuideManager.currentPageIndicatorGreenTintColor
        picker?.confirmButtonBackgroundColor = StyleGuideManager.currentPageIndicatorGreenTintColor
        picker?.show()
        
    }
    
    func numberOfRows(in pickerView: CZPickerView!) -> Int {
        return styles.count
    }
    
    func czpickerView(_ pickerView: CZPickerView!, titleForRow row: Int) -> String! {
        return styles[row]
    }
    
    func czpickerView(_ pickerView: CZPickerView!, didConfirmWithItemAtRow row: Int) {
        
        print(styles[row])
        
    }
}

//MARK: handle tableView
extension SettingControllr: UITableViewDelegate, UITableViewDataSource {
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 8
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row == 0 {
            return self.LoadPhotoCell
        } else if indexPath.row == 1 {
            return self.LanguageCell
        } else if indexPath.row == 2 {
            return self.CurrencyCell
        } else if indexPath.row == 3 {
            return self.ClearHistoryCell
        } else if indexPath.row == 4 {
            return self.privacyCell
        } else if indexPath.row == 5 {
            return self.termsCell
        } else if indexPath.row == 6 {
            return self.NotificationCell
        } else  {
            return self.VersionCell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 60
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if indexPath.row == 4 {
            let agreementController = AgreementController()
            agreementController.agreementState = AgreementState.PrivacyPolicy
            self.present(agreementController, animated: true, completion: nil)
        } else if indexPath.row == 5 {
            let agreementController = AgreementController()
            agreementController.agreementState = AgreementState.TermsOfService
            self.present(agreementController, animated: true, completion: nil)
        }
        
    }
    
}

//MARK: setupViews
extension SettingControllr {
    
    fileprivate func setupViews() {
        
        setupTableView()
    }
    
    private func setupTableView() {
        
        let imageView = UIImageView()
        imageView.image = UIImage(named: AssetName.settingBackground.rawValue)
        imageView.contentMode = .scaleAspectFill
        
        view.addSubview(imageView)
        
        imageView.anchorToTop(view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor)
        
        
        tableView.backgroundColor = .clear
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellId)
        
        view.addSubview(tableView)
        tableView.anchorToTop(self.topLayoutGuide.bottomAnchor, left: view.leftAnchor, bottom: self.bottomLayoutGuide.topAnchor, right: view.rightAnchor)
    }
    
    fileprivate func setupBackground() {
        view.backgroundColor = .white
        
        navigationController?.hidesBarsOnSwipe = false
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.barTintColor = StyleGuideManager.currentPageIndicatorGreenTintColor
        navigationController?.navigationBar.tintColor = .white
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.white, NSAttributedStringKey.font: UIFont.boldSystemFont(ofSize: 24)]
        
        navigationItem.title = "Setting"
        
//        setupStatusBar()
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
