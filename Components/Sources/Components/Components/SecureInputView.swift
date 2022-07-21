//
//  File.swift
//  
//
//  Created by Yago Teixeira on 21/07/22.
//

import UIKit

public class SecureInputView: InputView {
    
    private let showButton: UIButton = {
        let button = UIButton()
        button.setTitle("Show", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.setTitleColor(Colors.labelGray, for: .normal)
        return button
    }()
    
    @objc
    private func toggleSecretVisibility() {
        textInput.isSecureTextEntry = !textInput.isSecureTextEntry
        showButton.backgroundColor = textInput.isSecureTextEntry ? .none : .darkGray
    }
    
    public override init(_ label: String) {
        super.init(label)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupSecureInputView() {
        textInput.isSecureTextEntry = true
        showButton.layer.cornerRadius = 10
        
        showButton.addTarget(self, action: #selector(toggleSecretVisibility), for: .touchUpInside)
        
        stackView.addArrangedSubview(showButton)
        showButton.widthAnchor.constraint(equalToConstant: 60).isActive = true
        showButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
    }
}
