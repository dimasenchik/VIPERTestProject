//
//  CategoryListCategoryListViewController.swift
//  EVO Test Viper
//
//  Created by Senchik Dima on 05/08/2019.
//  Copyright © 2019 Dima Senchik. All rights reserved.
//

import UIKit
import Kingfisher

class CategoryListViewController: UIViewController {
    
    // MARK: - Properties
    var output: CategoryListViewOutput!
    
    var categories: [CategoryDataDomainModel] = []
    
    // MARK: - Outlets
    @IBOutlet weak var categoriesCollectionView: UICollectionView!
    
    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        categoriesCollectionView.delegate = self
        categoriesCollectionView.dataSource = self
        
        title = "Категории"
        output.viewIsReady()
    }
}

// MARK: CategoryListViewInput
extension CategoryListViewController: CategoryListViewInput {
    func displayCategories(_ categories: [CategoryDataDomainModel]) {
        self.categories = categories
        DispatchQueue.main.async {
            self.categoriesCollectionView.reloadData()
        }
    }
}

// MARK: - UICollectionViewDelegate, UICollectionViewDataSource
extension CategoryListViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categories.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = categoriesCollectionView.dequeueReusableCell(withReuseIdentifier: "categoryListCell", for: indexPath) as! CategoryListCollectionViewCell
        
        if let imageString = categories[indexPath.row].image, let imageURL = URL(string: imageString) {
            cell.categoryImage.kf.setImage(with: imageURL)
            cell.categoryImage.contentMode = .scaleAspectFill
        }
        
        cell.categoryLabel.text = categories[indexPath.row].name
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        output.navigateToList(categoryId: categories[indexPath.row].id)
    }
}
