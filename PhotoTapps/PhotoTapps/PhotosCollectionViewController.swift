//
//  PhotosCollectionViewController.swift
//  PhotoTapps
//
//  Created by Олег Филатов on 16.10.2020.
//

import UIKit


class PhotosCollectionViewController: UICollectionViewController {
    let photos = ["car1", "car2", "car3", "car4", "car5"]
    
    let itemsPerRow: CGFloat = 2
    let sectionsInserts = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)

    override func viewDidLoad() {
        super.viewDidLoad()
        // 2-ой способ настраивания ячеек
//        let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
//        layout.itemSize = CGSize(width: 70, height: 70)
//        layout.sectionInset = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
//        layout.minimumLineSpacing = 20
//        layout.minimumInteritemSpacing = 20
//        //layout.scrollDirection = .horizontal
//        //layout.scrollDirection = .vertical
//
//        //collectionView.showsVerticalScrollIndicator = false // показ полоски прокрутки
    }

    //переход к фотографии
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "pickPhotoSegue"{
            let photoVC = segue.destination as! PhotoViewController
            let cell = sender as! PhotoCell
            photoVC.image = cell.carImageView.image
        }
    }

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return photos.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "photoCell", for: indexPath) as! PhotoCell
        
        let imageName = photos[indexPath.item]
        let image = UIImage(named: imageName)
        cell.carImageView.image = image
        //cell.backgroundColor = .black
    
        // Configure the cell
    
        return cell
    }

}

// 1-ый способ настраивания ячеек
extension PhotosCollectionViewController: UICollectionViewDelegateFlowLayout{
    //размер ячейки
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let paddingWidth = sectionsInserts.left * (itemsPerRow + 1)
        let availableWidth = collectionView.frame.width - paddingWidth
        let widthPerItem = availableWidth / itemsPerRow
        return CGSize(width: widthPerItem, height: widthPerItem)
    }

    //отступы
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return sectionsInserts //UIEdgeInsets(top: sectionsInserts.top, left: sectionsInserts.left, bottom: sectionsInserts.bottom, right: sectionsInserts.right)
    }
    // промежуток между клеточками вертикально
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return  sectionsInserts.left //CGFloat(20)
    }
    // промежуток между клеточками горизонтально
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return sectionsInserts.left
    }
}
