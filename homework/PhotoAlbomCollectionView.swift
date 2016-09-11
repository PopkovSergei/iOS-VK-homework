//
//  PhotoAlbomCollectionView.swift
//  homework
//
//  Created by Serg on 10.08.16.
//  Copyright © 2016 Serg. All rights reserved.
//

import Foundation
import UIKit

class PhotoAlbomCollectionView: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate{
    
   
    @IBOutlet weak var AlbomColection: UICollectionView!
    var selUserId: Int?
    var albom_ids = Int()
    let photoApiModule = PhotoApiModule()
    var phAlbumMapper:[PhAlbumMapper]?
    override func viewDidLoad() {
        super.viewDidLoad()
        print("sel: \(selUserId)")
        
        photoApiModule.user_ids = selUserId!
        photoApiModule.getAlbomVK{response, error in
            if error != nil{
                
                let dialog = UIAlertController(title: "Messege", message: "loading error", preferredStyle: UIAlertControllerStyle.Alert)
                dialog.addAction(UIAlertAction(title: "OK",style: UIAlertActionStyle.Default, handler: nil))
                self.presentViewController(dialog, animated: true, completion: nil)
                
            }else{
                
                self.phAlbumMapper = response?.items
                self.AlbomColection.reloadData()
            }
            
            
            
        }
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if phAlbumMapper == nil {
            return 0
        }
        return phAlbumMapper!.count
        
    }
    
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        let cell: AlbomCollectionCell = collectionView.dequeueReusableCellWithReuseIdentifier("CellAlbom", forIndexPath: indexPath) as! AlbomCollectionCell
        
        var imgURL: NSURL = NSURL(string: phAlbumMapper![indexPath.row].photo!)!
        var imgData: NSData = NSData(contentsOfURL: imgURL)!
        
        cell.FotoAlbom.image = UIImage(data: imgData)
        cell.nameAlbomLabel.text = phAlbumMapper![indexPath.row].albumName
        cell.colFotoLabel.text = "\(phAlbumMapper![indexPath.row].countPhoto)"
        
        return cell
        
    }
    
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
       
        print("\(indexPath.row)")
        albom_ids = phAlbumMapper![indexPath.row].id_Album
        performSegueWithIdentifier("PhotoCollectionView", sender: self)
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "PhotoCollectionView" {
            var vc = segue.destinationViewController as! PhotoCollectionView
            vc.albom_ids = albom_ids
            vc.selUserId = selUserId
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
