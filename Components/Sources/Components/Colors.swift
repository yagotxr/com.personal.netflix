//
//  File.swift
//  
//
//  Created by Yago Teixeira on 21/07/22.
//

import UIKit

public enum Colors {
    
    public static let red = from("#D23027")
    public static let labelGray = from("#B0B4BC")
    public static let inputBackgroundColor = from("#333333")
    
    static func from(_ hex: String) -> UIColor {
        guard let color = UIColor(hexaRGB: hex) else {
            fatalError("Color not found")
        }
        return color
    }
}
