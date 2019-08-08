//
//  ProductDetailProductDetailRouter.swift
//  EVO Test Viper
//
//  Created by Senchik Dima on 01/08/2019.
//  Copyright © 2019 Dima Senchik. All rights reserved.
//

import Foundation

final class ProductDetailRouter: NSObject, ProductDetailRouterInput {
    
    // MARK: Public variables
    weak public var viewController: ProductDetailViewController?
    
    func showOnBuyAlert(with product: ProductDomainModel) {
        guard let productName = product.productName else { return }
        
        guard let productId = product.id else { return }
        
        viewController?.displayMessage("Added into the cart!", message: "\(productName) with id: \(productId) was added into the cart", actions: nil, handler: nil)
    }
    
    func showFavouriteAlert(with product: ProductDomainModel) {
        guard let productName = product.productName else { return }
        
        guard let productId = product.id else { return }
        
        viewController?.displayMessage("Added into the favourite list!", message: "\(productName) with id: \(productId) was added into the favourite list", actions: nil, handler: nil)
    }
}
