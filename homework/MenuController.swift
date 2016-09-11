//
//  MenuController.swift
//  homework
//
//  Created by Serg on 07.08.16.
//  Copyright © 2016 Serg. All rights reserved.
//

import Foundation
import UIKit

class menuController: UIViewController {
    
    @IBOutlet weak var UserIdLabel: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        print(segue.identifier)
        if segue.identifier == "Frends"{
      
            let viewController:UsersTableView = segue.destinationViewController as! UsersTableView
            viewController.userID = UserIdLabel.text!
            
        }
    }
    
    
}
