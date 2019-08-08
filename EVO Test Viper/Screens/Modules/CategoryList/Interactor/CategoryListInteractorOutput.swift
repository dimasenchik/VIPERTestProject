//
//  CategoryListCategoryListInteractorOutput.swift
//  EVO Test Viper
//
//  Created by Senchik Dima on 05/08/2019.
//  Copyright © 2019 Dima Senchik. All rights reserved.
//

import Foundation

protocol CategoryListInteractorOutput: class {
    func prepareDataForDisplay(_ categoryData: [CategoryDataDomainModel])
}
