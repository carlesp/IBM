//
//  RatesRepository.swift
//  IBM
//
//  Created by Carles Garcia Puigardeu on 24/4/22.
//

import Foundation

public protocol RatesRepository {
    func getRates(completion: @escaping (Result<[Rate], Error>) -> Void)
}
