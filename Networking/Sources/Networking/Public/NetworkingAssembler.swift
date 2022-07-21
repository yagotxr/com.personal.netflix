//
//  File.swift
//  
//
//  Created by Yago Teixeira on 13/07/22.
//

import Foundation
import Domain

public class NetworkingAssembler {
    public static func register() {
        let assemblies = [NetworkingAssembly()]
        AppAssembler.apply(assemblies)
    }
}
