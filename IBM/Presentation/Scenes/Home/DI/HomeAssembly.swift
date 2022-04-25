//
//  HomeAssembly.swift
//  IBM
//
//  Created by Carles Garcia Puigardeu on 24/4/22.
//

import Foundation
import Swinject

class HomeAssembly: Assembly {
    func assemble(container: Container) {
        // ViewController
        container.register(HomeViewController.self) { inject in
            let vc = HomeViewController.create(with: inject.resolve(HomeViewModel.self)!,
                                               router: inject.resolve(HomeRouter.self)!)
            return vc
        }
        .inObjectScope(.weak)
        
        // ViewModel
        container.register(HomeViewModel.self) { inject in
            HomeViewModel(getRatesUseCase: inject.resolve(GetRatesUseCase.self)!,
                          getTransactionsUseCase: inject.resolve(GetTransactionsUseCase.self)!
            )
        }
        
        // Router
        container.register(HomeRouter.self) { inject in
            return DefaultHomeRouter(hostViewControllerProvider: inject.resolve(Provider<HomeViewController>.self)!,
                                     detailViewControllerProvider: inject.resolve(Provider<ProductDetailViewController>.self)!)
        }
        .inObjectScope(.weak)
    }
}
