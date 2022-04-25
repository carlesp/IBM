//
//  TransactionResponseDTO.swift
//  IBM
//
//  Created by Carles Garcia Puigardeu on 24/4/22.
//

import Foundation

public struct TransactionResponseDTO: Decodable {
    let sku: String
    let amount: String
    let currency: String
}
