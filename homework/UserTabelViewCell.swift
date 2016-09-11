//
//  UserTabelViewCell.swift
//  homework
//
//  Created by Serg on 08.08.16.
//  Copyright © 2016 Serg. All rights reserved.
//

import Foundation
import UIKit

class UserTabelViewCell: UITableViewCell {
    
    //@IBOutlet weak var PhotoImageView: UIImageView!
    @IBOutlet weak var PhotoImageView: UIImageView!
    @IBOutlet weak var lastNameLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var onlainLabel: UILabel!
    @IBOutlet weak var dobLabel: UILabel!
   
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}