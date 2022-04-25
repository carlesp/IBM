//
//  RepositoryAssembly.swift
//  IBM
//
//  Created by Carles Garcia Puigardeu on 24/4/22.
//

import Foundation
import Swinject

class RepositoryAssembly: Assembly {    
    func assemble(container: Container) {
        // RatesRepository
        container.register(RatesRepository.self, factory: { resolver in
            return DefaultRatesRepository(apiManager: ApiAssembly.makeApiManager(url: Configurations.apiBaseURL))
        }).inObjectScope(.weak)

        // TransactionsRepository
        container.register(TransactionsRepository.self, factory: { resolver in
            return DefaultTransactionsRepository(apiManager: ApiAssembly.makeApiManager(url: Configurations.apiBaseURL))
        }).inObjectScope(.weak)
    }
}
