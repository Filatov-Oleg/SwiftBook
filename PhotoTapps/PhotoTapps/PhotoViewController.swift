//
//  PhotoViewController.swift
//  PhotoTapps
//
//  Created by Олег Филатов on 16.10.2020.
//

import UIKit

class PhotoViewController: UIViewController {

    var image: UIImage?
    
    @IBOutlet weak var photoImageView: UIImageView!
    
    @IBAction func shareAction(_ sender: Any) {
        //функция поделиться
        let shareController = UIActivityViewController(activityItems: [image!], applicationActivities: nil)
        shareController.completionWithItemsHandler = {_, bool, _, _ in
            if bool {
                print("Good")
            }
        }
        present(shareController, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        photoImageView.image = image
       
    }
    

    

}
