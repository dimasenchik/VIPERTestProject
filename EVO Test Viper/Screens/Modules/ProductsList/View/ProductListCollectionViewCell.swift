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
    
    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var productTitle: UILabel!
    @IBOutlet weak var productPresence: UILabel!
    @IBOutlet weak var productPrice: UILabel!
    
    func configureCell(_ data: ProductDomainModel) {
        
        guard let imageURL = URL(string: data.imageURL) else { return }
        
        guard let price = data.price else { return }
        
        self.productImage.kf.setImage(with: imageURL)
        self.productTitle.text = data.productName
        self.productPresence.text = data.presence
        self.productPrice.text = "\(price) грн."
    }
    
}
