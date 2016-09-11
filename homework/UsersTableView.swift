//
//  UserTableView.swift
//  homework
//
//  Created by Serg on 08.08.16.
//  Copyright © 2016 Serg. All rights reserved.
//

import Foundation
import UIKit

class UsersTableView: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var titlesTabelView: UITableView!
    var userID: String?
    var usersMapper:[UserMapper]?
    let userApiMobule = UserApiMobule()
    private let tabelCellIdentifier = "Cell"
    
    var selUserId: Int?
    
    override func viewDidLoad() {
        
        userApiMobule.user_ids = userID!
        userApiMobule.getFriedsVK{response, error in
            if error != nil{
            
                let dialog = UIAlertController(title: "Messege", message: "loading error", preferredStyle: UIAlertControllerStyle.Alert)
                dialog.addAction(UIAlertAction(title: "OK",style: UIAlertActionStyle.Default, handler: nil))
                self.presentViewController(dialog, animated: true, completion: nil)
            
            }else{
                
                self.usersMapper = response?.items
                self.titlesTabelView.reloadData()
                
            }
            
            
            
        }
        
   
        
        super.viewDidLoad()
        self.titlesTabelView.delegate = self
        self.titlesTabelView.dataSource = self
        let nib = UINib(nibName: "UserTableViewCell", bundle: nil)
        titlesTabelView.registerNib(nib, forCellReuseIdentifier: tabelCellIdentifier)

        
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
 
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        print("\(indexPath.row)")
        selUserId = usersMapper![indexPath.row].id
        performSegueWithIdentifier("PhotoAlbomCollectionView", sender: self)
    
        
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "PhotoAlbomCollectionView" {
            var vc = segue.destinationViewController as! PhotoAlbomCollectionView
            vc.selUserId = selUserId
        }
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if usersMapper == nil {
            return 0
        }
        return usersMapper!.count
       
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        //print(self.tabelCellIdentifier)
        //print(indexPath)
        var tableCell = titlesTabelView.dequeueReusableCellWithIdentifier(self.tabelCellIdentifier) as! UserTabelViewCell
        
        /*var first_name: String? = usersMapper![indexPath.row].first_name
        var last_name: String? = usersMapper![indexPath.row].last_name
        var bdate: String? = usersMapper![indexPath.row].bdate
        var online: String? = usersMapper![indexPath.row].online
        var photo_100: String? = usersMapper![indexPath.row].photo_100*/
        
        tableCell.nameLabel.text = usersMapper![indexPath.row].first_name
        tableCell.lastNameLabel.text = usersMapper![indexPath.row].last_name
        tableCell.dobLabel.text = usersMapper![indexPath.row].bdate
        
        if usersMapper![indexPath.row].online == 1{
          tableCell.onlainLabel.text = "onlain"
          tableCell.onlainLabel.textColor = UIColor.blueColor()
        }else{
            tableCell.onlainLabel.text = "offlain"
            tableCell.onlainLabel.textColor = UIColor.redColor()
        }
        
        var imgURL: NSURL = NSURL(string: usersMapper![indexPath.row].photo_100!)!
        var imgData: NSData = NSData(contentsOfURL: imgURL)!
        tableCell.PhotoImageView.image = UIImage(data: imgData)
        
        
        
        
        return tableCell
    }
    
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 110
    }
    
    

}
