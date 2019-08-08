//
//  CatalogRemoteModel.swift
//  EVO Test Viper
//
//  Created by Dima Senchik on 7/30/19.
//  Copyright © 2019 Dima Senchik. All rights reserved.
//

import Foundation

// MARK: - FullResponse
final class FullResponse: Codable {
    let catalog: Catalog
}

// MARK: - Catalog
final class Catalog: Codable {
    let results: [Products]
    
    enum CodingKeys: String, CodingKey {
        case results
    }
    
    func transformToDomain() -> [ProductDomainModel] {
        
        var domainModelArray = [ProductDomainModel]()
        
        results.forEach { (product) in
            let domainModel = ProductDomainModel()
            domainModel.id = product.id
            domainModel.productName = product.name
            domainModel.presence = product.presenceTitle
            domainModel.price = product.discountedPrice
            domainModel.imageURL = product.urlMainImage
            domainModelArray.append(domainModel)
        }
        
        return domainModelArray
    }
    
}

// MARK: - Result
final class Products: Codable {
    let id: Int
    let name, presenceTitle, priceCurrency, discountedPrice: String
    let price: String
    let urlMainImage: String
    
    enum CodingKeys: String, CodingKey {
        case id, name
        case presenceTitle = "presence_title"
        case priceCurrency = "price_currency"
        case discountedPrice = "discounted_price"
        case price
        case urlMainImage = "url_main_image_200x200"
    }
}
