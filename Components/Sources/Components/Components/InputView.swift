//
//  File.swift
//  
//
//  Created by Yago Teixeira on 20/07/22.
//

import UIKit

public class InputView: UIView {
            
    let stackView = UIStackView()
    
    let wrapperView = UIView()
    
    let inputLabel: UILabel = {
        let label = UILabel()
        label.textColor = Colors.labelGray
        label.font = label.font.withSize(10)
        return label
    }()
    
    let textInput: UITextField = {
        let textField = UITextField()
        textField.textColor = .white
        textField.autocapitalizationType = .none
        textField.autocorrectionType = .no
        textField.keyboardType = .emailAddress
        return textField
    }()
        
    public init(_ label: String) {
        super.init(frame: .zero)
        self.inputLabel.text = label
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension InputView: UIConfigurable {
    public func buildHierarchy() {
        wrapperView.addSubviews(inputLabel, textInput)
        stackView.addArrangedSubviews(wrapperView)
        addSubviews(stackView)
    }
    
    public func setupConstraints() {
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16).isActive = true
        stackView.topAnchor.constraint(equalTo: topAnchor, constant: 7).isActive = true
        stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16).isActive = true
        stackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -7).isActive = true
        
        wrapperView.translatesAutoresizingMaskIntoConstraints = false
        
        inputLabel.translatesAutoresizingMaskIntoConstraints = false
        inputLabel.topAnchor.constraint(equalTo: wrapperView.topAnchor).isActive = true
        inputLabel.leadingAnchor.constraint(equalTo: wrapperView.leadingAnchor).isActive = true
        inputLabel.trailingAnchor.constraint(equalTo: wrapperView.trailingAnchor).isActive = true

        textInput.translatesAutoresizingMaskIntoConstraints = false
        textInput.topAnchor.constraint(equalTo: inputLabel.bottomAnchor, constant: 7).isActive = true
        textInput.leadingAnchor.constraint(equalTo: wrapperView.leadingAnchor).isActive = true
        textInput.trailingAnchor.constraint(equalTo: wrapperView.trailingAnchor).isActive = true
        textInput.bottomAnchor.constraint(equalTo: wrapperView.bottomAnchor).isActive = true
    }
    
    public func aditionalSetup() {
        backgroundColor = Colors.inputBackgroundColor
        layer.cornerRadius = 5
    }
}
