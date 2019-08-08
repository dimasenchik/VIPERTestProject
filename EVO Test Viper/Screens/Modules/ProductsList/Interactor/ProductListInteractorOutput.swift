//
//  MediaPickerInteractoroOutput.swift
//  EVO Test Viper
//
//  Created by Dima Senchik on 8/1/19.
//  Copyright © 2019 Dima Senchik. All rights reserved.
//

import Foundation

protocol ProductListInteractorOutput: class {
    func prepareDataForDisplay(_ products: [ProductDomainModel])
    func handleError(_ error: NetworkError)
}
