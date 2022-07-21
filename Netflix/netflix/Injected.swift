//
//  Injected.swift
//  netflix
//
//  Created by Yago Teixeira on 14/07/22.
//

import Foundation
import AppInject

@propertyWrapper
struct Injected<Component> {
    
    var component: Component
    
    init() {
        self.component = AppAssembler.resolve(Component.self)
    }
    
    public var wrappedValue: Component {
        get {
            return self.component
        }
        mutating set {
            self.component = newValue
        }
    }
    
}
