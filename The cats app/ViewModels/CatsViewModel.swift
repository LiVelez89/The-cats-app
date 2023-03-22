//
//  CatsViewModel.swift
//  The cats app
//
//  Created by Lina on 27/02/23.
//

import Foundation

final class CatsViewModel {
    
    let networkManager = NetworkManager()
    var cats: [CatModel] = [] {
        didSet {
            reloadTable?()
        }
    }
    
    var reloadTable: (() -> Void)?
    
    func getCats() {
        networkManager.makeRequest(type: [CatModel].self) { [weak self] result in
            guard let self = self else { return }
            
            DispatchQueue.main.async {
                switch result {
                case .success(let catsResult):
                    self.cats = catsResult
                case .failure(let error):
                    print(error)
                }
            }
        }
    }
    func buildCell(with cat: CatModel) -> CatTableViewCell {
        let cell = CatTableViewCell()
        cell.breed.text = "Breed: \(cat.breedName ?? "unknow")"
        cell.affectionLevel.text = "Affection level: \(String(cat.affectionLevel ?? 0))"
        cell.breedDescription.text = "Description: \(cat.description ?? "-")"
        cell.intelligenceLevel.text = "Intelligence level: \(String(cat.intelligence ?? 0))"
        cell.origin.text = "Origin: \(cat.origin ?? "-")"
        
        return cell
    }
}
