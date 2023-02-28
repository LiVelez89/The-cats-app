//
//  CatTableViewCell.swift
//  The cats app
//
//  Created by Lina on 27/02/23.
//

import UIKit

class CatTableViewCell: UITableViewCell {
    // Properties
    let breed = UILabel()
    let origin = UILabel()
    let breedDescription = UILabel()
    let affection = UILabel()
    let intelligence = UILabel()
    let catImage = UIImageView()
    
    let stackView = UIStackView()
    
    static let reuseID = "CatCell"
    static let rowHeight: CGFloat = 200
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension CatTableViewCell {
   
    private func setup() {
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.spacing = 8
        
        breed.translatesAutoresizingMaskIntoConstraints = false
        breed.font = UIFont.preferredFont(forTextStyle: .largeTitle)
        
        origin.translatesAutoresizingMaskIntoConstraints = false
        origin.font = UIFont.preferredFont(forTextStyle: .body)
        
        breedDescription.translatesAutoresizingMaskIntoConstraints = false
        breedDescription.font = UIFont.preferredFont(forTextStyle: .body)
        
        affection.translatesAutoresizingMaskIntoConstraints = false
        affection.font = UIFont.preferredFont(forTextStyle: .body)
        
        intelligence.translatesAutoresizingMaskIntoConstraints = false
        intelligence.font = UIFont.preferredFont(forTextStyle: .body)

        catImage.translatesAutoresizingMaskIntoConstraints = false
        
        let image = UIImage(named: "genericCat.jpg")
        catImage.image = image
        
        contentView.addSubview(breed)
        contentView.addSubview(breedDescription)
        contentView.addSubview(affection)
        contentView.addSubview(catImage)
        contentView.addSubview(stackView)
        stackView.addArrangedSubview(origin)
        stackView.addArrangedSubview(intelligence)
    
    }
    
    private func layout() {
        NSLayoutConstraint.activate([
            breed.centerXAnchor.constraint(equalTo: centerXAnchor),
            breed.topAnchor.constraint(equalToSystemSpacingBelow: topAnchor, multiplier: 2),
            catImage.centerXAnchor.constraint(equalTo: centerXAnchor),
            catImage.topAnchor.constraint(equalToSystemSpacingBelow: breed.bottomAnchor, multiplier: 1),
            affection.centerXAnchor.constraint(equalTo: centerXAnchor),
            affection.topAnchor.constraint(equalToSystemSpacingBelow: catImage.bottomAnchor, multiplier: 1),
            stackView.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 2),
            stackView.topAnchor.constraint(equalToSystemSpacingBelow: affection.bottomAnchor, multiplier: 1),
            trailingAnchor.constraint(equalToSystemSpacingAfter: stackView.trailingAnchor, multiplier: 2),
            breedDescription.centerXAnchor.constraint(equalTo: centerXAnchor),
            breedDescription.topAnchor.constraint(equalToSystemSpacingBelow: stackView.bottomAnchor, multiplier: 1)
        ])
    }
}
