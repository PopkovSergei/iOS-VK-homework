


import Foundation

import ObjectMapper

class PhAlbumsMapper: Mappable {
    
    var items: [PhAlbumMapper]?
    var count: Int?
    
    required init?(_ map: Map){
        
    }
    
    func mapping(map: Map) {
        items <- map["items"]
        count <- map["count"]
    }
}

class PhAlbumMapper: Mappable {
    
    var id_Album: Int = 0
    var id_StartPhoto: Int = 0
    var id_User: Int = 0
    var albumName: String?
    var countPhoto: Int = 0
    var photo: String?
   
    
    required init?(_ map: Map){
        
    }
    
    func mapping(map: Map) {
        id_Album <- map["id"]
        id_StartPhoto <- map["thumb_id"]
        id_User <- map["owner_id"]
        albumName <- map["title"]
        countPhoto <- map["size"]
        photo <- map["thumb_src"]
        }
}




class PhotosMapper: Mappable {
    
    var items: [PhotoMapper]?
    var count: Int?
    
    required init?(_ map: Map){
        
    }
    
    func mapping(map: Map) {
        items <- map["items"]
        count <- map["count"]
    }
}

class PhotoMapper: Mappable {
    
    var id_Album: Int = 0
    var id_Photo: Int = 0
    var id_User: Int = 0
    var textPhoto: String?
    var UIPhoto: String?
    var width: Int = 0
    var height: Int = 0
    
    
    required init?(_ map: Map){
        
    }
    
    func mapping(map: Map) {
        id_Album <- map["album_id"]
        id_Photo <- map["id"]
        id_User <- map["owner_id"]
        textPhoto <- map["text"]
        UIPhoto <- map["photo_604"]
        width <- map["width"]
        height <- map["height"]
    }
}