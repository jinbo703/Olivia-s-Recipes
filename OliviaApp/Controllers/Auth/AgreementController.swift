//
//  AgreementController.swift
//  OliviaApp
//
//  Created by John Nik on 11/12/17.
//  Copyright © 2017 johnik703. All rights reserved.
//

import UIKit

enum AgreementState {
    case TermsOfService
    case PrivacyPolicy
}

class AgreementController: UIViewController {
    
    var agreementState: AgreementState?
    
    let titleLabel: UILabel = {
        
        let label = UILabel()
        label.text = "Agreement"
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 25)
        label.textAlignment = .center
        return label
        
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
    }
    
    
}

//MARK: handle dismiss controller
extension AgreementController {
    @objc fileprivate func handleDismissController() {
        dismiss(animated: true, completion: nil)
    }
}

extension AgreementController {
    
    fileprivate func setupViews() {
        
        setupBackground()
        setupNavBar()
    }
    
    private func setupNavBar() {
        
        navigationController?.isNavigationBarHidden = true
        
        let dismissImage = UIImage(named: AssetName.cancel.rawValue)?.withRenderingMode(.alwaysTemplate)
        let dismissButton = UIButton(type: .system)
        dismissButton.setImage(dismissImage, for: .normal)
        dismissButton.tintColor = .white
        dismissButton.addTarget(self, action: #selector(handleDismissController), for: .touchUpInside)
        
        view.addSubview(dismissButton)
        
        _ = dismissButton.anchor(view.topAnchor, left: view.leftAnchor, bottom: nil, right: nil, topConstant: 20, leftConstant: 20, bottomConstant: 0, rightConstant: 0, widthConstant: 30, heightConstant: 30)
        
        view.addSubview(titleLabel)
        _ = titleLabel.anchor(view.topAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, topConstant: 20, leftConstant: 50, bottomConstant: 0, rightConstant: 50, widthConstant: 0, heightConstant: 30)
        
        if agreementState == AgreementState.PrivacyPolicy {
            titleLabel.text = "Privacy Policy"
        } else {
            titleLabel.text = "Terms of Service"
        }
    }
    
    private func setupBackground() {
        view.backgroundColor = StyleGuideManager.currentPageIndicatorGreenTintColor
    }
    
}
