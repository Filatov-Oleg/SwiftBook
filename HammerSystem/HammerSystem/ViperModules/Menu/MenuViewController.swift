//
//  MenuViewController.swift
//  HammerSystem
//
//  Created by Олег Филатов on 07.05.2021.
//  
//

import UIKit
import PinLayout

final class MenuViewController: UIViewController {
    
    private let output: MenuViewOutput
    
    private let categoriesCollectionView: UICollectionView
    private let productsTableView: UITableView
    
    var categoriesArray: [CategoryModel] = CategoryModel.makeExample()
    var productsArray: [ProductModel] = ProductModel.makeExample()
    
    init(output: MenuViewOutput) {
        self.output = output
        self.categoriesCollectionView = UICollectionView(frame: .zero, collectionViewLayout: .init())
        self.productsTableView = UITableView(frame: .zero, style: .plain)
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.setupCategoriesCollectionView()
        self.setupProductsTableView()
        self.setupLeftBatButton()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        self.productsTableView.pin.all()
    }
}

extension MenuViewController: MenuViewInput {
    
}

extension MenuViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.categoriesArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let category = self.categoriesArray[indexPath.row]
        let cell = collectionView.dequeueCell(cellType: CategoryCollectionCell<CategoryCollectionCellView>.self, for: indexPath)
        cell.containerView.update(with: category)
        if indexPath.row == 0 {
            cell.backgroundColor = UIColor(red: 253/255, green: 58/255, blue: 105/255, alpha: 0.2)
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            let index = IndexPath(row: 0, section: 1)
            self.productsTableView.scrollToRow(at: index, at: .top, animated: true)
        } else if indexPath.row == 1 {
            collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
            collectionView.cellForItem(at: IndexPath(row: 0, section: 0))?.backgroundColor = UIColor(red: 243/255, green: 245/255, blue: 249/255, alpha: 1)
            let index = IndexPath(row: 3, section: 1)
            self.productsTableView.scrollToRow(at: index, at: .top, animated: true)
        } else if indexPath.row == 2 {
            collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
            collectionView.cellForItem(at: IndexPath(row: 0, section: 0))?.backgroundColor = UIColor(red: 243/255, green: 245/255, blue: 249/255, alpha: 1)
            let index = IndexPath(row: 6, section: 1)
            self.productsTableView.scrollToRow(at: index, at: .top, animated: true)
        } else if indexPath.row == 3 {
            collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
            collectionView.cellForItem(at: IndexPath(row: 0, section: 0))?.backgroundColor = UIColor(red: 243/255, green: 245/255, blue: 249/255, alpha: 1)
            let index = IndexPath(row: 9, section: 1)
            self.productsTableView.scrollToRow(at: index, at: .top, animated: true)
        } else if indexPath.row == 4 {
            collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
            collectionView.cellForItem(at: IndexPath(row: 0, section: 0))?.backgroundColor = UIColor(red: 243/255, green: 245/255, blue: 249/255, alpha: 1)
            let index = IndexPath(row: 12, section: 1)
            self.productsTableView.scrollToRow(at: index, at: .top, animated: true)
        }
    }
}

extension MenuViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        } else {
            return productsArray.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = tableView.dequeueCell(cellType: TableCellForSaleCollectionCell.self, for: indexPath)
            return cell
        } else {
            let product = self.productsArray[indexPath.row]
            let cell = tableView.dequeueCell(cellType: ProductTableCell<ProductTableCellView>.self, for: indexPath)
            cell.containerView.update(with: product)
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return self.view.frame.height / 7
        } else {
            return self.view.frame.height / 5
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0 {
            return 0.00000001
        } else {
            return self.view.frame.height / 15
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == 0 {
            return nil
        } else {
            let view = UIView()
            view.backgroundColor = UIColor(red: 243/255, green: 245/255, blue: 249/255, alpha: 1)
            view.addSubview(self.categoriesCollectionView)
            view.pin
                .all()
                .width(self.productsTableView.frame.width)
                .height(self.view.frame.height / 22)
            self.categoriesCollectionView.pin
                .top()
                .bottom()
                .left(16)
                .right()
            return view
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 1 {
            self.output.showDetailProductVC(productModel: self.productsArray[indexPath.row])
        }
    }
    
}


extension MenuViewController {
    
    func setupCategoriesCollectionView() {
        self.categoriesCollectionView.delegate = self
        self.categoriesCollectionView.dataSource = self
        self.categoriesCollectionView.register(CategoryCollectionCell<CategoryCollectionCellView>.self)
        let collectionViewLayout = UICollectionViewFlowLayout()
        collectionViewLayout.scrollDirection = .horizontal
        collectionViewLayout.itemSize = CGSize(width: self.view.bounds.width / 4, height: self.view.bounds.height / 22)
        self.categoriesCollectionView.collectionViewLayout = collectionViewLayout
        self.categoriesCollectionView.backgroundColor = UIColor(red: 243/255, green: 245/255, blue: 249/255, alpha: 1)
        self.categoriesCollectionView.showsHorizontalScrollIndicator = false
    }
    
    
    func setupProductsTableView() {
        self.view.addSubview(self.productsTableView)
        self.productsTableView.delegate = self
        self.productsTableView.dataSource = self
        self.productsTableView.register(ProductTableCell<ProductTableCellView>.self)
        self.productsTableView.register(TableCellForSaleCollectionCell.self)
        self.productsTableView.backgroundColor = .white
        self.productsTableView.showsVerticalScrollIndicator = false
    }
    
    func setupLeftBatButton() {
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Москва ↓", style: .done, target: self, action: #selector(self.didTapChooseCity(sender: )))
        self.navigationItem.leftBarButtonItem?.tintColor = UIColor(red: 34/255, green: 40/255, blue: 49/255, alpha: 1)
    }
    
    @objc
    func didTapChooseCity(sender: UIBarButtonItem) {
        print("Choose city")
    }
}
