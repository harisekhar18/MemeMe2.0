//
//  MemeTableViewController.swift
//  MemeMe
//
//  Created by Hari Prasad on 1/26/20.
//  Copyright © 2020 Hari Prasad. All rights reserved.
//

import UIKit

class MemeTableViewController: UIViewController, UITableViewDataSource, UITableViewDelegate  {
    
    @IBOutlet var tableView: UITableView!
    var memes: [ViewController.Meme]! {
           let object = UIApplication.shared.delegate
           let appDelegate = object as! AppDelegate
           return appDelegate.memes
       }


    override func viewDidLoad() {
        super.viewDidLoad()
        print("Loading images")
        print(self.memes.count)
        tableView.dataSource = self
       
    }
    
    
    
    override func viewWillAppear(_ animated
        : Bool) {
        super.viewWillAppear(animated)
        
        tableView.reloadData()
    
    }
    
    // MARK: Table View Data Source
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
           return self.memes.count
       }
    
    // MARK: Setting up the image and label for each cell
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "MemeTableViewCell")!
        let meme = self.memes[(indexPath as NSIndexPath).row]
        
        // Set the name and image
        cell.textLabel?.text = meme.topText+" "+meme.bottomText
        cell.imageView?.image = image(meme.memedImage, withSize: CGSize(width: 130, height: 148))
        return cell
    }
    
    // MARK: Setting up image size
    func image( _ image:UIImage, withSize newSize:CGSize) -> UIImage {

        UIGraphicsBeginImageContext(newSize)
        image.draw(in: CGRect(x: 0,y: 0,width: newSize.width,height: newSize.height))
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return newImage!.withRenderingMode(.automatic)
    }
    
    // MARK: Navigation to add Meme screen when plus button is pressed
    @IBAction func addMeme(_ sender: Any) {
        
        let detailController = self.storyboard!.instantiateViewController(withIdentifier: "ViewController") as! ViewController
        //detailController.villain = self.allVillains[(indexPath as NSIndexPath).row]
        self.navigationController!.pushViewController(detailController, animated: true)
    }
    
}
