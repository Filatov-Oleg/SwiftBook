//
//  TableCellForSaleCollectionCell.swift
//  HammerSystem
//
//  Created by Олег Филатов on 09.05.2021.
//

import UIKit
import PinLayout


class TableCellForSaleCollectionCell: UITableViewCell {
    var salesArray: [SaleModel] = SaleModel.makeExample()
    private var salesCollectionView: UICollectionView
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        self.salesCollectionView = UICollectionView(frame: .zero, collectionViewLayout: .init())
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setupSalesCollectionView()
    }
    
    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


extension TableCellForSaleCollectionCell: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.salesArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let sale = self.salesArray[indexPath.row]
        let cell = collectionView.dequeueCell(cellType: SalesCollectionCell<SalesCollectionCellView>.self, for: indexPath)
        cell.containerView.update(with: sale)
        return cell
    }
}

extension TableCellForSaleCollectionCell {
    func setupSalesCollectionView() {
        let collectionViewLayout = UICollectionViewFlowLayout()
        collectionViewLayout.scrollDirection = .horizontal
        collectionViewLayout.itemSize = CGSize(width: UIScreen.main.bounds.width / 1.5, height: UIScreen.main.bounds.height / 9)
        
        
        self.salesCollectionView.collectionViewLayout = collectionViewLayout
        self.salesCollectionView.delegate = self
        self.salesCollectionView.dataSource = self
        self.salesCollectionView.register(SalesCollectionCell<SalesCollectionCellView>.self)
        self.salesCollectionView.backgroundColor = UIColor(red: 243/255, green: 245/255, blue: 249/255, alpha: 1)
        self.salesCollectionView.showsHorizontalScrollIndicator = false
        
        self.addSubview(self.salesCollectionView)
        self.sendSubviewToBack(self.contentView)
        
        self.salesCollectionView.pin
            .height(UIScreen.main.bounds.height / 7)
            .width(UIScreen.main.bounds.width)
        
    }
}
