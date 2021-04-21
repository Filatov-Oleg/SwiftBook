//
//  ViewController.swift
//  Singleton
//
//  Created by Олег Филатов on 28.12.2020.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let safe = Safe.shared
        print(safe.money) // ВЫВЕДЕТ 10000, так как в AppDelegate присвоили значение 
    }


}

