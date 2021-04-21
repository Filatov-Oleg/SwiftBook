//
//  TableViewCell.swift
//  MVVM-2
//
//  Created by Олег Филатов on 11.02.2021.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var fullNameLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    
    weak var viewModel: TableViewCellViewModelType? {
        willSet(viewModel) {
            guard  let viewModel = viewModel else {return}
            fullNameLabel.text = viewModel.fullName
            ageLabel.text = viewModel.age
        }
    }
    

}
