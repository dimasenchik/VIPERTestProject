//
//  ProductDetailProductDetailInteractor.swift
//  EVO Test Viper
//
//  Created by Senchik Dima on 01/08/2019.
//  Copyright © 2019 Dima Senchik. All rights reserved.
//

final class ProductDetailInteractor {
    //MARK: - Properties
    weak var output: ProductDetailInteractorOutput!
}

extension ProductDetailInteractor: ProductDetailInteractorInput {
    func addToCart(product: ProductDomainModel) {
        // Here can be function to add your product into smth Local Storage
        output.addedToCart()
    }
    
    func addToFavourite(product: ProductDomainModel) {
        // Here can be function to add your product into smth Local Storage
        output.addedToFavourite()
    }
}
