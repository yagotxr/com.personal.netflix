//
//  File.swift
//  
//
//  Created by Yago Teixeira on 18/07/22.
//

import Foundation
import Domain

public class MockAssembler {
    public static func register() {
        let assemblies = [MockRepositoryAssembly()]
        AppAssembler.apply(assemblies)
    }
}
