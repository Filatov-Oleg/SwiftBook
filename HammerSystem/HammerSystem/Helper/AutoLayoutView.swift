//
//  AutoLayoutView.swift
//  HammerSystem
//
//  Created by Олег Филатов on 07.05.2021.
//

import UIKit

class AutoLayoutView: UIView {

    private var didSetupConstraints: Bool = false

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setNeedsUpdateConstraints()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupConstraints() {
        
    }

    override func addSubview(_ view: UIView) {
        super.addSubview(view)
        view.translatesAutoresizingMaskIntoConstraints = false
        
    }

    override func updateConstraints() {
        if !self.didSetupConstraints {
            self.setupConstraints()
            self.didSetupConstraints = true
        }
        super.updateConstraints()
    }
}
