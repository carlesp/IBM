//
//  ApiManager.swift
//  IBM
//
//  Created by Carles Garcia Puigardeu on 24/4/22.
//

import Foundation
import Moya

public protocol ApiManager {
    func getRates(completion: @escaping (Result<[RateResponseDTO], Error>) -> Void)
    func getTransactions(completion: @escaping (Result<[TransactionResponseDTO], Error>) -> Void)
}

final class DefaultApiManager {
    
    private let provider: MoyaProvider<IBMAPI>
    
    init(provider: MoyaProvider<IBMAPI>) {
        self.provider = provider
    }
}

extension DefaultApiManager: ApiManager {
    func getRates(completion: @escaping (Result<[RateResponseDTO], Error>) -> Void) {
        provider.requestFilterErrors(.getRates,
                                     completion: MoyaCompletionTransformer.mapJsonDecoder(completion))
    }
    
    func getTransactions(completion: @escaping (Result<[TransactionResponseDTO], Error>) -> Void) {
        provider.requestFilterErrors(.getTransactions,
                                     completion: MoyaCompletionTransformer.mapJsonDecoder(completion))
    }
}
