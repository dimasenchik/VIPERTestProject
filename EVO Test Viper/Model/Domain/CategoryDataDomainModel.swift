//
//  CategoryDataDomainModel.swift
//  EVO Test Viper
//
//  Created by Dima Senchik on 8/5/19.
//  Copyright © 2019 Dima Senchik. All rights reserved.
//

import Foundation

final class CategoryDataDomainModel {
    var id: Int!
    var name: String?
    var image: String?
    
    init(id: Int, name: String, imageURL: String) {
        self.id = id
        self.name = name
        self.image = imageURL
    }
}
