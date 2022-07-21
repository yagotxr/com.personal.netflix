//
//  OrchestratorAssemblies.swift
//  netflix
//
//  Created by Yago Teixeira on 13/07/22.
//

import Foundation
import Networking
import Swinject
import Domain
import Mocks

public final class OrcherstratorAssemblies {
    
    static let isMock = true
    
    public static func register() {
        if isMock {
            MockAssembler.register()
        } else {
            NetworkingAssembler.register()
        }
    }
}
