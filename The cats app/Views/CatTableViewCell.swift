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
    let affectionLevel = UILabel()
    let intelligenceLevel = UILabel()
    
    let stackView = UIStackView()
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 200, height: 250)
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(CollectionViewCell.self, forCellWithReuseIdentifier: CollectionViewCell.identifier)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    static let reuseID = "CatCell"
    static let rowHeight: CGFloat = 450
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
        collectionView.dataSource = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension CatTableViewCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewCell.identifier, for: indexPath) as? CollectionViewCell else {
            return UICollectionViewCell()
        }

        cell.backgroundColor = .systemBlue
        return cell
    }
}

// MARK: - Setup and Layout
extension CatTableViewCell {
    
    private func setup() {
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.spacing = 8
        
        breed.translatesAutoresizingMaskIntoConstraints = false
        breed.font = UIFont.preferredFont(forTextStyle: .title1)
        
        origin.translatesAutoresizingMaskIntoConstraints = false
        origin.font = UIFont.preferredFont(forTextStyle: .body)
        
        breedDescription.translatesAutoresizingMaskIntoConstraints = false
        breedDescription.font = UIFont.preferredFont(forTextStyle: .body)
        breedDescription.numberOfLines = 0
        
        affectionLevel.translatesAutoresizingMaskIntoConstraints = false
        affectionLevel.font = UIFont.preferredFont(forTextStyle: .body)
        
        intelligenceLevel.translatesAutoresizingMaskIntoConstraints = false
        intelligenceLevel.font = UIFont.preferredFont(forTextStyle: .body)
        
        collectionView.backgroundColor = .systemOrange
        collectionView.setContentHuggingPriority(.defaultHigh, for: .vertical)
        
        contentView.addSubview(collectionView)
        contentView.addSubview(breed)
        contentView.addSubview(breedDescription)
        contentView.addSubview(origin)
        contentView.addSubview(stackView)
        stackView.addArrangedSubview(affectionLevel)
        stackView.addArrangedSubview(intelligenceLevel)
    
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        NSLayoutConstraint.activate([
            
            collectionView.topAnchor.constraint(equalToSystemSpacingBelow: contentView.topAnchor, multiplier: 1),
            collectionView.leadingAnchor.constraint(equalToSystemSpacingAfter: contentView.leadingAnchor, multiplier: 1),
            contentView.trailingAnchor.constraint(equalToSystemSpacingAfter: collectionView.trailingAnchor, multiplier: 1),
            collectionView.heightAnchor.constraint(equalToConstant: 140),
            breed.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            breed.topAnchor.constraint(equalToSystemSpacingBelow: collectionView.bottomAnchor, multiplier: 2),
            stackView.topAnchor.constraint(equalToSystemSpacingBelow: breed.bottomAnchor, multiplier: 2),
            stackView.leadingAnchor.constraint(equalToSystemSpacingAfter: contentView.leadingAnchor, multiplier: 2),
            contentView.trailingAnchor.constraint(equalToSystemSpacingAfter: stackView.trailingAnchor, multiplier: 2),
            origin.topAnchor.constraint(equalToSystemSpacingBelow: stackView.bottomAnchor, multiplier: 2),
            origin.leadingAnchor.constraint(equalToSystemSpacingAfter: contentView.leadingAnchor, multiplier: 2),
            contentView.trailingAnchor.constraint(equalToSystemSpacingAfter: origin.trailingAnchor, multiplier: 2),
            breedDescription.topAnchor.constraint(equalToSystemSpacingBelow: origin.bottomAnchor, multiplier: 2),
            breedDescription.leadingAnchor.constraint(equalToSystemSpacingAfter: contentView.leadingAnchor, multiplier: 2),
            contentView.trailingAnchor.constraint(equalToSystemSpacingAfter: breedDescription.trailingAnchor, multiplier: 2),
            contentView.bottomAnchor.constraint(equalToSystemSpacingBelow: breedDescription.bottomAnchor, multiplier: 1)
        ])
    }
}
