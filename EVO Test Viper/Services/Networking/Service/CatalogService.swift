//
//  CatalogService.swift
//  EVO Test Viper
//
//  Created by Dima Senchik on 7/30/19.
//  Copyright © 2019 Dima Senchik. All rights reserved.
//

import Foundation

enum PossibleSortTypes: String {
    case popularity = "-popularity"
    case fromTheCheapest = "price"
    case fromTheMostExpensive = "-price"
    case score = "-score"
    case product_opinions = "-product_opinions"
    
    var title: String {
        switch self {
        case .popularity:
            return "Популярность"
            
        case .fromTheCheapest:
            return "От дешевых к дорогим"
            
        case .fromTheMostExpensive:
            return "От дорогих к дешевым"
            
        case .score:
            return "По рейтингу Prom.ua"
            
        case .product_opinions:
            return "По количеству отзывов о товаре"
        }
    }
}

extension PossibleSortTypes: CaseIterable {}

final class CatalogService {
    
    func getDresses(limit: Int = 0, offset: Int = 0, category: Int = 35402, sortType: PossibleSortTypes = .popularity, onSuccess: @escaping onSuccess<[ProductDomainModel]>, onFailure: @escaping onFailure<NetworkError>) {
        
        let urlParams = "?limit=\(limit)&offset=\(offset)&category=\(category)&sort=\(sortType.rawValue)"
        
        let body = "[{:catalog [:possible_sorts {:results [:id :name :presence_title :price_currency :discounted_price :price :url_main_image_200x200]}]}]"
        
        let request = RequestBuilder.build(.post, baseUrl: NetworkConfiguration.baseEnvironment.basePath, urlAppending: urlParams, headersType: .typical, body: body, requestType: .getDresses)
        
        NetworkManager.shared.perform(request, onSuccess: { (data) in
            do {
                let apiResponse = try JSONDecoder().decode(FullResponse.self, from: data)
                let domainResponse = apiResponse.catalog.transformToDomain()
                onSuccess(domainResponse)
            } catch {
                print(error)
                onFailure(NetworkError(errorMessage: "NetworkErrors.incorrectContent", statusCode: 422))
            }
        }) { (error) in
            onFailure(error)
        }
    }
    
}
