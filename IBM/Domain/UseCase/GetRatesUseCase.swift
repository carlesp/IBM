//
//  GetRatesUseCase.swift
//  IBM
//
//  Created by Carles Garcia Puigardeu on 24/4/22.
//

import Foundation

public protocol GetRatesUseCase {
    func execute(completion: @escaping (Result<[Rate], Error>) -> Void)
}

final class DefaultGetRatesUseCase: GetRatesUseCase {
    
    private let ratesRepository: RatesRepository
    
    public init(ratesRepository: RatesRepository) {
        self.ratesRepository = ratesRepository
    }
    
    public func execute(completion: @escaping (Result<[Rate], Error>) -> Void) {
        ratesRepository.getRates(completion: completion)
    }
}
