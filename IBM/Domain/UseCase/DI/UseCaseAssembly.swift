//
//  UseCaseAssembly.swift
//  IBM
//
//  Created by Carles Garcia Puigardeu on 24/4/22.
//

import Foundation
import Swinject

class UseCaseAssembly: Assembly{
    func assemble(container: Container) {
        // GetRatesUseCase
        container.register(GetRatesUseCase.self) { resolver in
            guard let ratesRepository = resolver.resolve(RatesRepository.self) else {
                fatalError("Assembler was unable to resolve RatesRepository")
            }
            let getRatesUseCase = DefaultGetRatesUseCase(ratesRepository: ratesRepository)
            return getRatesUseCase
        }.inObjectScope(.weak)
        
        // GetTransactionsUseCase
        container.register(GetTransactionsUseCase.self) { resolver in
            guard let transactionsRepository = resolver.resolve(TransactionsRepository.self) else {
                fatalError("Assembler was unable to resolve RatesRepository")
            }
            let getTransactionsUseCase = DefaultGetTransactionsUseCase(transactionsRepository: transactionsRepository)
            return getTransactionsUseCase
        }.inObjectScope(.weak)
    }
}
