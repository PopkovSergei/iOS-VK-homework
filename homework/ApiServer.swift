

import Foundation


class apiService {
   
    
    var token : String? {
        get {
            return NSUserDefaults.standardUserDefaults().objectForKey("token") as! String?
        }
        set {
            NSUserDefaults.standardUserDefaults().setObject(newValue, forKey: "token")
            NSUserDefaults.standardUserDefaults().synchronize()
        }
    }
}