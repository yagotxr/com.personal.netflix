import Foundation
import Swinject

public final class AppAssembler {
    
    public static let shared = AppAssembler()
    
    private let assembler = Assembler()
    
    private var container: Container {
        guard let container = assembler.resolver as? Container else {
            preconditionFailure("The resolver must be an instance of Container.")
        }

        return container
    }
    
    public static func apply(_ assemblies: [Assembly]) {
        assemblies.forEach { $0.assemble(container: shared.container) }
    }
    
    public static func resolve<Service>(_ serviceType: Service.Type) ->  Service {
        guard let service = shared.container.resolve(serviceType) else {
            fatalError("Service not registered in assembly")
        }
        return service
    }
}
