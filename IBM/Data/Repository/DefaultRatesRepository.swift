//
//  DefaultRatesRepository.swift
//  IBM
//
//  Created by Carles Garcia Puigardeu on 24/4/22.
//

import Foundation

final class DefaultRatesRepository {
    private let apiManager: ApiManager
    
    public init(apiManager: ApiManager) {
        self.apiManager = apiManager
    }
}

extension DefaultRatesRepository: RatesRepository {
    func getRates(completion: @escaping (Result<[Rate], Error>) -> Void) {
        apiManager.getRates(completion: { result in
            switch result {
            case .success(let response):
                let map = RateMapper.map(input: response)
                completion(.success(map))
            case .failure(let error):
                completion(.failure(error))
            }
        })
    }
}
