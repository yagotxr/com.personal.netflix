import Foundation
import Networking
import Swinject

public final class AppAssembler {
    
    public static let shared = AppAssembler()
    
    private var container: Container {
        guard let container = ass
    }
    
    public static func apply(_ assemblies: Assembly...) {
        assemblies.forEach {
            $0.assemble(container: shared.container)
        }
    }
}
