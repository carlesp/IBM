//
//  ProductAssembly.swift
//  IBM
//
//  Created by Carles Garcia Puigardeu on 24/4/22.
//

import Foundation
import Swinject

class ProductAssembly: Assembly {
    func assemble(container: Container) {
        // ViewController
        container.register(ProductDetailViewController.self) { inject in
            let vc = ProductDetailViewController.create(with: inject.resolve(ProductDetailViewModel.self)!,
                                                        router: inject.resolve(ProductRouter.self)!)
            return vc
        }
        .inObjectScope(.weak)
        
        // ViewModel
        container.register(ProductDetailViewModel.self) { inject in
            ProductDetailViewModel()
        }
        
        // Router
        container.register(ProductRouter.self) { inject in
            return DefaultProductRouter()
        }
        .inObjectScope(.weak)
    }
}
