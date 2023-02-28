//
//  CatModel.swift
//  The cats app
//
//  Created by Lina on 27/02/23.
//

import Foundation

struct CatModel: Decodable {
    
    let breedName: String?
    let origin: String?
    let affectionLevel: Int?
    let intelligence: Int?
    let imageUrl: String?
    let description: String?
    
}
