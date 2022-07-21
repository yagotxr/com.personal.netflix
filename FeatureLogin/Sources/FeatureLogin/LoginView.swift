//
//  File.swift
//  
//
//  Created by Yago Teixeira on 21/07/22.
//

import UIKit
import Components

class LoginView: UIView {
    
    let emailOrNumberForm = InputView("Email or phone number")
    let passwordForm = SecureInputView("Password")
    
    let signInButton: UIButton = {
        let button = UIButton()
        button.setTitle("SIGN IN", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = Colors.red
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        
        return button
    }()
    
    init () {
        super.init(frame: .zero)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension LoginView: UIConfigurable {
    func buildHierarchy() {
        addSubviews(emailOrNumberForm, passwordForm, signInButton)
    }
    
    func setupConstraints() {
        emailOrNumberForm.translatesAutoresizingMaskIntoConstraints = false
        
        emailOrNumberForm.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        emailOrNumberForm.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 32).isActive = true
        emailOrNumberForm.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -32).isActive = true
        
        passwordForm.translatesAutoresizingMaskIntoConstraints = false
        
        passwordForm.topAnchor.constraint(equalTo: emailOrNumberForm.bottomAnchor, constant: 20).isActive = true
        passwordForm.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 32).isActive = true
        passwordForm.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -32).isActive = true
        
        signInButton.translatesAutoresizingMaskIntoConstraints = false
        
        signInButton.topAnchor.constraint(equalTo: passwordForm.bottomAnchor, constant: 20).isActive = true
        signInButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 32).isActive = true
        signInButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -32).isActive = true
        signInButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
}
