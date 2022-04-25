//
//  RateResponseDTO.swift
//  IBM
//
//  Created by Carles Garcia Puigardeu on 24/4/22.
//

import Foundation

public struct RateResponseDTO: Decodable {
    let from: String
    let to: String
    let rate: String
}
