//
//  ProductDetailProductDetailViewController.swift
//  EVO Test Viper
//
//  Created by Senchik Dima on 01/08/2019.
//  Copyright © 2019 Dima Senchik. All rights reserved.
//

import UIKit
import Kingfisher

final class ProductDetailViewController: UIViewController, Alertable {

    // MARK: - Outlets
    @IBOutlet weak private var productImage: UIImageView!
    @IBOutlet weak private var productTitle: UILabel!
    @IBOutlet weak private var productPresence: UILabel!
    @IBOutlet weak private var productPrice: UILabel!
    
    // MARK: - Properties
    var moduleInput: ProductDetailModuleInput!
    
    var output: ProductDetailViewOutput!
    
    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        output.viewIsReady()
    }
}

// MARK: - IBActions
private extension ProductDetailViewController {
    @IBAction func buyAction(_ sender: Any) {
        output.onBuyAction()
    }
    
    @IBAction func favouriteAction(_ sender: Any) {
        output.onFavouriteAction()
    }
}

// MARK: - ProductDetailViewInput
extension ProductDetailViewController: ProductDetailViewInput {
    func initiateProductScreen(_ product: ProductDomainModel) {
        guard let imageURL = URL(string: product.imageURL) else { return }
        
        guard let price = product.price else { return }
        
        productImage.kf.setImage(with: imageURL)
        productTitle.text = product.productName
        productPresence.text = product.presence
        productPrice.text = "\(price) грн."
        title = product.productName
    }
}

