//
//  MemeTableViewController.swift
//  MemeMe
//
//  Created by Hari Prasad on 1/26/20.
//  Copyright © 2020 Hari Prasad. All rights reserved.
//

import UIKit

class MemeTableViewController: UIViewController, UITableViewDataSource, UITableViewDelegate  {
    
    var memes: [ViewController.Meme]! {
           let object = UIApplication.shared.delegate
           let appDelegate = object as! AppDelegate
           return appDelegate.memes
       }


    override func viewDidLoad() {
        super.viewDidLoad()
        print("Loading images")
        print(self.memes.count)
        
        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated
        : Bool) {
        super.viewWillAppear(animated)
    
    }
    
    // MARK: Table View Data Source
       
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
           return self.memes.count
       }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "MemeTableViewCell")!
        let meme = self.memes[(indexPath as NSIndexPath).row]
        
        // Set the name and image
        //cell.textLabel?.text = meme.
        cell.imageView?.image = meme.memedImage
        
        // If the cell has a detail label, we will put the evil scheme in.
//        if let detailTextLabel = cell.detailTextLabel {
//            detailTextLabel.text = "Scheme: \(villain.evilScheme)"
//        }
        
        return cell
    }
    
    @IBAction func addMeme(_ sender: Any) {
        
        let detailController = self.storyboard!.instantiateViewController(withIdentifier: "ViewController") as! ViewController
        //detailController.villain = self.allVillains[(indexPath as NSIndexPath).row]
        self.navigationController!.pushViewController(detailController, animated: true)
    }
    
}
