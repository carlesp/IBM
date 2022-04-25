//
//  DefaultTransactionsRepository.swift
//  IBM
//
//  Created by Carles Garcia Puigardeu on 24/4/22.
//

import Foundation

final class DefaultTransactionsRepository {
    private let apiManager: ApiManager
    
    public init(apiManager: ApiManager) {
        self.apiManager = apiManager
    }
}

extension DefaultTransactionsRepository: TransactionsRepository {
    func getTransactions(completion: @escaping (Result<[Transaction], Error>) -> Void) {
       apiManager.getTransactions(completion: { result in
            switch result {
            case .success(let response):
                let map = TrasactionMapper.map(input: response)
                completion(.success(map))
            case .failure(let error):
                completion(.failure(error))
            }
        })
    }
}

