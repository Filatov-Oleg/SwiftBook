//
//  SecondViewController.swift
//  GCD
//
//  Created by Олег Филатов on 12.11.2020.
//

import UIKit

class SecondViewController : UIViewController {
    
    @IBOutlet weak var imageView : UIImageView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    fileprivate var imageURL: URL?
    fileprivate var image : UIImage {
        get {
            return imageView.image!
        }
        
        set {
            activityIndicator.stopAnimating()
            activityIndicator.isHidden = true
            imageView.image = newValue
            imageView.sizeToFit()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchImage()
        delay(3){
            self.loginAlert()
        }
        
    }
    
    fileprivate func delay(_ delay: Int, clouser: @escaping () ->()) {
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(3)) {
            clouser()
        }
    }
    
    fileprivate func loginAlert(){
        let ac = UIAlertController(title: "Зарегистрированы?", message: "Введите ваш логин и пароль", preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        let cancelAction = UIAlertAction(title: "Отмена", style: .default, handler: nil)
        
        ac.addAction(okAction)
        ac.addAction(cancelAction)
        
        ac.addTextField { (usernameTF) in
            usernameTF.placeholder = "Введите логин"
        }
        ac.addTextField { (userPasswordTF) in
            userPasswordTF.placeholder = "Введите пароль"
            userPasswordTF.isSecureTextEntry = true
        }
        self.present(ac, animated: true, completion: nil)
    }
    
    fileprivate func fetchImage() {
        imageURL = URL(string: "https://user-images.githubusercontent.com/30910230/54920927-8ffada00-4f15-11e9-8353-8e0c9b87f6c6.png")
        activityIndicator.isHidden = false
        activityIndicator.startAnimating()
        print("0")
        let queue = DispatchQueue.global(qos: .utility)
        queue.async {
            print("1")
            guard let url = self.imageURL, let imageData = try? Data(contentsOf: url) else { return }
            print("2")
            DispatchQueue.main.async {
                self.image = UIImage(data: imageData)!
                print("3")
            }
            print("4")
        }
        print("5")
    }
}
