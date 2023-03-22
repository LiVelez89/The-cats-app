//
//  CatImageModel.swift
//  The cats app
//
//  Created by Lina on 8/03/23.
//

import Foundation

struct CatImageModel: Decodable {
    
    let id: String?
    let url: String?
    let width: Int?
    let height: Int?
}
