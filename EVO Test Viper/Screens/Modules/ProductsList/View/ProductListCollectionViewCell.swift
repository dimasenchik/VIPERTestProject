//
//  ProductListCollectionViewCell.swift
//  EVO Test Viper
//
//  Created by Dima Senchik on 8/1/19.
//  Copyright © 2019 Dima Senchik. All rights reserved.
//

import UIKit
import Kingfisher

class ProductListCollectionViewCell: UICollectionViewCell {
    
    //MARK: - IBOutlets
    @IBOutlet weak private var productImage: UIImageView!
    @IBOutlet weak private var productTitle: UILabel!
    @IBOutlet weak private var productPresence: UILabel!
    @IBOutlet weak private var productPrice: UILabel!
    
    //MARK: - Public methods
    func configureCell(_ data: ProductDomainModel) {
        guard let imageURL = URL(string: data.imageURL) else { return }
        
        guard let price = data.price else { return }
        
        self.productImage.kf.setImage(with: imageURL)
        self.productTitle.text = data.productName
        self.productPresence.text = data.presence
        self.productPrice.text = "\(price) грн."
    }
}
