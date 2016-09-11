

import Foundation

import ObjectMapper

class UsersMapper: Mappable {
  
    var items: [UserMapper]?
    var count: Int?
    
    required init?(_ map: Map){
        
    }
    
    func mapping(map: Map) {
        items <- map["items"]
        count <- map["count"]
    }
}

class UserMapper: Mappable {
    
    var id: Int = 0
    var first_name: String?
    var last_name: String?
    var bdate: String?
    var photo_100: String?
    var online: Int = 0
    
    required init?(_ map: Map){
        
    }
    
    func mapping(map: Map) {
        id <- map["id"]
        first_name <- map["first_name"]
        last_name <- map["last_name"]
        bdate <- map["bdate"]
        photo_100 <- map["photo_100"]
        online <- map["online"]
    }
}