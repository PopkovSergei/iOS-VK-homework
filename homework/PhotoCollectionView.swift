//
//  PhotoCollectionView.swift
//  homework
//
//  Created by Serg on 10.08.16.
//  Copyright © 2016 Serg. All rights reserved.
//PhotoCollectionView

import Foundation
import UIKit

class PhotoCollectionView: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    
    

    @IBOutlet weak var photoViev: UICollectionView!
    var albom_ids = Int()
    var selUserId: Int?
    let photoApiModule = PhotoApiModule()
    var photoMapper:[PhotoMapper]?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        photoApiModule.user_ids = selUserId!
        photoApiModule.albom_ids = albom_ids
        photoApiModule.getPhotoVK{response, error in
            if error != nil{
                
                let dialog = UIAlertController(title: "Messege", message: "loading error", preferredStyle: UIAlertControllerStyle.Alert)
                dialog.addAction(UIAlertAction(title: "OK",style: UIAlertActionStyle.Default, handler: nil))
                self.presentViewController(dialog, animated: true, completion: nil)
                
            }else{
                
                self.photoMapper = response?.items
                self.photoViev.reloadData()
            }
        }
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if photoMapper == nil {
            return 0
        }
        return photoMapper!.count
    }
    
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        let cell: PhotoCollectionCell = collectionView.dequeueReusableCellWithReuseIdentifier("CellPhoto", forIndexPath: indexPath) as! PhotoCollectionCell
        
        var imgURL: NSURL = NSURL(string: photoMapper![indexPath.row].UIPhoto!)!
        var imgData: NSData = NSData(contentsOfURL: imgURL)!
        
        cell.FotoView.image = UIImage(data: imgData)
        
        return cell
        
    }
    
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        
        print("sel: \(indexPath.row)")
        
        
    }
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}