//
//  UIImageView+Extensions.swift
//  The cats app
//
//  Created by Lina on 27/02/23.
//

//
import UIKit

// MARK: UIImageView Extension
extension UIImageView {
    func fetchImage(url: URL) {
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}
