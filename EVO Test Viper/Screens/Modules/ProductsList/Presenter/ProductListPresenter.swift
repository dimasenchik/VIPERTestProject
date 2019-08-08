//
//  ProductListPresenter.swift
//  EVO Test Viper
//
//  Created by Dima Senchik on 8/1/19.
//  Copyright © 2019 Dima Senchik. All rights reserved.
//

import Foundation
import UIKit

enum ProductsAppendState {
    case reloadAll
    case addNew
}

final class ProductListDataModel {
    // MARK: - Properties
    private(set) var allProducts: [ProductDomainModel] = []
    var currentSortType: PossibleSortTypes = .popularity
    var currentLimit: Int = 10
    var offset: Int = 0
    var currentCategory: Int = 35402
    
    var newProducts: [ProductDomainModel] = [] {
        didSet {
            guard newProducts.count > 0 else { return }
            
            allProducts.append(contentsOf: newProducts)
        }
    }
    
    func resetProperties() {
        allProducts = []
        newProducts = []
        currentSortType = .popularity
        offset = 0
    }
    
    func getCurrentProductsState() -> ProductsAppendState {
        if offset == 0 {
            return .reloadAll
        } else {
            return .addNew
        }
    }
}

final class ProductListPresenter {
    // MARK: - Properties
    weak var view: ProductListViewInput!
    var interactor: ProductListInteractorInput!
    var router: ProductListRouterInput!
    var dataModel = ProductListDataModel()
}

// MARK: - ProductListInteractorOutput
extension ProductListPresenter: ProductListInteractorOutput {
    func prepareDataForDisplay(_ products: [ProductDomainModel]) {
        dataModel.newProducts = products
        
        let currentState = dataModel.getCurrentProductsState()
        
        switch currentState {
        case .reloadAll:
            view.displayProducts(dataModel.allProducts, currentSortType: dataModel.currentSortType)
        case .addNew:
            view.addProducts(dataModel.newProducts)
        }
    }
    
    func handleError(_ error: NetworkError) {
        router.handleNetworkError(error)
    }
}

// MARK: - ProductListModuleInput
extension ProductListPresenter: ProductListModuleInput {
    func ignitionModuleWith(categoryId: Int) {
        dataModel.currentCategory = categoryId
    }
}

// MARK: - ProductListViewOutput
extension ProductListPresenter: ProductListViewOutput {
    func viewIsReady() {
        dataModel.resetProperties()
        interactor.fetchProducts(limit: 10, offset: 0, category: dataModel.currentCategory, sortType: dataModel.currentSortType)
    }
    
    func viewDidDissapear() { }
    
    func tappedSort() {
        var actions: [UIAlertAction] = []
        
        PossibleSortTypes.allCases.forEach { (sortType) in
            let title = sortType.title
            
            let action = UIAlertAction(title: title, style: .default, handler: { [weak self] (action) in
                self?.reSortProducts(sortType)
            })
            actions.append(action)
        }
        
        router.openSortView(alertActions: actions)
    }

    func reSortProducts(_ sortType: PossibleSortTypes) {
        dataModel.resetProperties()
        dataModel.currentSortType = sortType
        interactor.fetchProducts(limit: dataModel.currentLimit, offset: dataModel.offset, category: dataModel.currentCategory, sortType: dataModel.currentSortType)
    }
    
    func addingItems() {
        dataModel.offset += 10
        interactor.fetchProducts(limit: dataModel.currentLimit, offset: dataModel.offset, category: dataModel.currentCategory, sortType: dataModel.currentSortType)
    }
    
    func navigateToDetail(with productIndex: Int) {
        router.navigateToDetailScreen(with: dataModel.allProducts[productIndex])
    }
}

