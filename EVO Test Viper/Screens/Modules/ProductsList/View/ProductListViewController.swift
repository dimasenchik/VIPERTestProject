//
//  ViewController.swift
//  EVO Test Viper
//
//  Created by Dima Senchik on 7/30/19.
//  Copyright © 2019 Dima Senchik. All rights reserved.
//

import UIKit

class ProductListViewController: UIViewController, Alertable {
    
    // MARK: - Properties
    var moduleInput: ProductListModuleInput!
    var output: ProductListViewOutput!
    
    private var products: [ProductDomainModel] = []
    
    // MARK: - Outlets
    @IBOutlet weak private var productsCollectionView: UICollectionView!
    @IBOutlet weak private var sortingTypeLabel: UILabel!
    
    //MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        productsCollectionView.delegate = self
        productsCollectionView.dataSource = self
        title = "Товары"
        output.viewIsReady()
    }
}

private extension ProductListViewController {
    @IBAction func tapSortAction(_ sender: Any) {
        output.tappedSort()
    }
}

// MARK: - UICollectionViewDelegate, UICollectionViewDataSource
extension ProductListViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return products.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = productsCollectionView.dequeueReusableCell(withReuseIdentifier: "productListCell", for: indexPath) as! ProductListCollectionViewCell
        cell.configureCell(products[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        if indexPath.row >= products.count - 1 {
            output.addingItems()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        output.navigateToDetail(with: indexPath.row)
    }
}

// MARK: - ProductListViewInput
extension ProductListViewController: ProductListViewInput {
    func displayProducts(_ products: [ProductDomainModel], currentSortType: PossibleSortTypes) {
        self.products = products
        DispatchQueue.main.async {
            self.sortingTypeLabel.text = currentSortType.title
            self.productsCollectionView.setContentOffset(CGPoint.zero, animated: true)
            self.productsCollectionView.reloadData()
        }
    }
    
    func addProducts(_ products: [ProductDomainModel]) {
        self.products.append(contentsOf: products)
        DispatchQueue.main.async {
            self.productsCollectionView.reloadData()
        }
    }
}
