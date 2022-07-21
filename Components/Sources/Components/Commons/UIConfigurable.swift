//
//  File.swift
//  
//
//  Created by Yago Teixeira on 21/07/22.
//

import Foundation

public protocol UIConfigurable {
    
    func setupConstraints()
    func buildHierarchy()
    func setupUI()
    func aditionalSetup()
    func accessibilityIdentifiers()
    
}

public extension UIConfigurable {
    func setupUI() {
        buildHierarchy()
        setupConstraints()
        aditionalSetup()
        accessibilityIdentifiers()
    }
    
    func aditionalSetup() {}
    func accessibilityIdentifiers() {}
}
