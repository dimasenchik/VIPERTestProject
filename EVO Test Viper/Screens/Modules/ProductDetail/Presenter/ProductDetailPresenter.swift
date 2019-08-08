//
//  ProductDetailProductDetailPresenter.swift
//  EVO Test Viper
//
//  Created by Senchik Dima on 01/08/2019.
//  Copyright © 2019 Dima Senchik. All rights reserved.
//

final class ProductDetailDataModel {
    var currentProduct: ProductDomainModel!
    var isFavourite: Bool = false
    var isInCart: Bool = false
}

final class ProductDetailPresenter {

    weak var view: ProductDetailViewInput!
    var interactor: ProductDetailInteractorInput!
    var router: ProductDetailRouterInput!
    var dataModel = ProductDetailDataModel()
    
}

// MARK : -  ProductDetailModuleInput
extension ProductDetailPresenter: ProductDetailModuleInput {
    func ignitionModuleWith(currentProduct: ProductDomainModel) {
        dataModel.currentProduct = currentProduct
    }
}

// MARK: - ProductDetailInteractorOutput
extension ProductDetailPresenter: ProductDetailInteractorOutput {
    func addedToCart() {
        router.showOnBuyAlert(with: dataModel.currentProduct)
    }
    
    func addedToFavourite() {
        router.showFavouriteAlert(with: dataModel.currentProduct)
    }
}

// MARK: - ProductDetailViewOutput
extension ProductDetailPresenter: ProductDetailViewOutput {
    func viewIsReady() {
        view.initiateProductScreen(dataModel.currentProduct)
    }
    
    func onBuyAction() {
        interactor.addToCart(product: dataModel.currentProduct)
    }
    
    func onFavouriteAction() {
        interactor.addToFavourite(product: dataModel.currentProduct)
    }
}
