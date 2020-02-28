//
//  MemeCollectionViewController.swift
//  MemeMe
//
//  Created by Hari Prasad on 1/26/20.
//  Copyright © 2020 Hari Prasad. All rights reserved.
//

import UIKit

class MemeCollectionViewController: UICollectionViewController,UICollectionViewDelegateFlowLayout {
    
    
   
   

    @IBOutlet var collectionViewCellView: UICollectionView!
    @IBOutlet weak var MemeMeCollectionViewFlowLayout: UICollectionViewFlowLayout!
    
    
    var memes: [ViewController.Meme]! {
        let object = UIApplication.shared.delegate
        let appDelegate = object as! AppDelegate
        return appDelegate.memes
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        collectionViewCellView.dataSource = self
//        let space:CGFloat = 3.0
//        let dimension = (view.frame.size.width - (2 * space)) / 3.0
//
//        MemeMeCollectionViewFlowLayout.minimumInteritemSpacing = space
//        MemeMeCollectionViewFlowLayout.minimumLineSpacing = space
//        MemeMeCollectionViewFlowLayout.itemSize = CGSize(width: dimension, height: dimension)
        
        

        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        collectionViewCellView.reloadData()
        
       
    }
    
    
    // MARK: Setting up the cell count for Memes
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.memes.count
    }
    
    // MARK: Setting up the image for each cell
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MemeMeCollectionViewCell", for: indexPath) as! MemeMeCollectionViewCell
        let memeMe = self.memes[(indexPath as NSIndexPath).row]
        
        // Set the image
        cell.imageView?.image = memeMe.memedImage
        
        return cell
    }
    
    // MARK: Setting up the image size
//     func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//
//        let imgWidth = collectionView.frame.width/3.0
//      return CGSize(width: imgWidth, height: imgWidth)
//    }
    
    // MARK: Navigation to add Meme screen when plus button is pressed
    @IBAction func addButtonPressed(_ sender: Any) {
        let detailController = self.storyboard!.instantiateViewController(withIdentifier: "ViewController") as! ViewController
               self.navigationController!.pushViewController(detailController, animated: true)
        
    }
    
   

}
