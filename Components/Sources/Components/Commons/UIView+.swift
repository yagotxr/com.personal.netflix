//
//  File.swift
//  
//
//  Created by Yago Teixeira on 21/07/22.
//

import UIKit

public extension UIView {
    
    func addSubviews(_ views: UIView...) {
        views.forEach(self.addSubview(_:))
    }
}

public extension UIStackView {
    func addArrangedSubviews(_ views: UIView...) {
        views.forEach(self.addArrangedSubview(_:))
    }
}
