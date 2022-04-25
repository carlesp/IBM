//
//  GetTransactionsUseCase.swift
//  IBM
//
//  Created by Carles Garcia Puigardeu on 24/4/22.
//

import Foundation

public protocol GetTransactionsUseCase {
    func execute(completion: @escaping (Result<[Transaction], Error>) -> Void)
}

final class DefaultGetTransactionsUseCase: GetTransactionsUseCase {
    
    private let transactionsRepository: TransactionsRepository
    
    public init(transactionsRepository: TransactionsRepository) {
        self.transactionsRepository = transactionsRepository
    }
    
    public func execute(completion: @escaping (Result<[Transaction], Error>) -> Void) {
        transactionsRepository.getTransactions(completion: completion)
    }
}
