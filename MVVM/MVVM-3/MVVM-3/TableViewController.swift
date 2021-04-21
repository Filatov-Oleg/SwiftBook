//
//  ViewController.swift
//  MVVM-3
//
//  Created by Олег Филатов on 12.02.2021.
//

import UIKit

class TableViewController: UITableViewController {

    @IBOutlet var viewModel: ViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        viewModel.fetchMovies { [weak self] in
            guard let self = self else {return}
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
            
        }
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRowsInSection()
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.textLabel?.text = viewModel.titleForCell(atIndexPath: indexPath)
        
        return cell
    }
}

