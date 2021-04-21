//
//  ViewController.swift
//  UIGestureRecognizer
//
//  Created by Олег Филатов on 16.03.2021.
//

import UIKit

class ViewController: UIViewController {
    
    var label = UILabel(frame: CGRect(x: 0, y: 0, width: 250, height: 30))
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        let view = UIView()
        view.backgroundColor = .lightGray
        view.addSubview(self.label)
        self.setupLabel()
        self.view = view
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.swipesObservers()
        self.tapObserver()
    }
    
    func swipesObservers() {
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipes))
        swipeRight.direction = .right
        self.view.addGestureRecognizer(swipeRight)
        
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipes))
        swipeLeft.direction = .left
        self.view.addGestureRecognizer(swipeLeft)
        
        let swipeUp = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipes))
        swipeUp.direction = .up
        self.view.addGestureRecognizer(swipeUp)
        
        let swipeDown = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipes))
        swipeDown.direction = .down
        self.view.addGestureRecognizer(swipeDown)
    }
    
    @objc func handleSwipes(gester: UISwipeGestureRecognizer) {
        switch gester.direction {
        case UISwipeGestureRecognizer.Direction.right:
            self.label.text = "Right swipe"
        case UISwipeGestureRecognizer.Direction.left:
            self.label.text = "Left swipe"
        case UISwipeGestureRecognizer.Direction.up:
            self.label.text = "Up swipe"
        case UISwipeGestureRecognizer.Direction.down:
            self.label.text = "Down swipe"
        default:
            break
        }
    }
    
    func tapObserver() {
        let tripleTap = UITapGestureRecognizer(target: self, action: #selector(tripleTapAction))
        tripleTap.numberOfTapsRequired = 3
        self.view.addGestureRecognizer(tripleTap)
        
        let doubleTap = UITapGestureRecognizer(target: self, action: #selector(doubleTapAction))
        doubleTap.require(toFail: tripleTap)
        doubleTap.numberOfTapsRequired = 2
        self.view.addGestureRecognizer(doubleTap)
    }
    
    @objc func tripleTapAction() {
        self.label.text = "Triple tap"
    }
    
    @objc func doubleTapAction() {
        self.label.text = "Double tap"
    }
    
}

private extension ViewController {
    func setupLabel() {
        self.label.center = CGPoint(x: 200, y: 300)
        self.label.tintColor = .black
        self.label.font = UIFont(name: "Arial", size: 25)
        self.label.textAlignment = .center
        self.label.text = "Gester Recognizer"
    }
}

