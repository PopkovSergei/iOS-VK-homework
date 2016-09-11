//
//  PhotoApiModule.swift
//  homework
//
//  Created by Serg on 10.08.16.
//  Copyright © 2016 Serg. All rights reserved.
//

import Foundation
import AlamofireObjectMapper
import Alamofire


class PhotoApiModule {
    let tokken = apiService().token
    var user_ids: Int = 1
    var albom_ids: Int = 1
    
    func getAlbomVK(callback : (PhAlbumsMapper?, String?)-> Void){
        
        let URl:String
        
        
        //if user_ids == "" {
        //    URl = "https://api.vk.com/method/photos.getAlbums?access_token="+tokken!+"&v=5.53"
        //}else{
            URl = "https://api.vk.com/method/photos.getAlbums?owner_id=\(user_ids)&need_covers=1&count=10&access_token="+tokken!+"&v=5.53"
        //}
        print(URl)
        Alamofire.request(.GET, URl)
            .responseObject(keyPath: "response") { (response: Response<PhAlbumsMapper, NSError>) in
                print(response)
                let albomMapper = response.result.value
                
                print(albomMapper?.count)
                
                if let alboms = albomMapper {
                    
                    if alboms.count > 0{
                        callback(alboms, nil)
                    }else{
                        callback(nil, "ApiError")
                    }
                }else{
                    callback(nil, "ApiError")
                }
                
        }
        
    }
    func getPhotoVK(callback : (PhotosMapper?, String?)-> Void){
        
        let URl:String
        
        

        URl = "https://api.vk.com/method/photos.get?owner_id=\(user_ids)&album_id=\(albom_ids)&count=20&access_token="+tokken!+"&v=5.53"
        //}
        print(URl)
        Alamofire.request(.GET, URl)
            .responseObject(keyPath: "response") { (response: Response<PhotosMapper, NSError>) in
                print(response)
                let photosMapper = response.result.value
                
                print(photosMapper?.count)
                
                if let photos = photosMapper {
                    
                
                    if photos.count > 0{
                        callback(photos, nil)
                    }else{
                        callback(nil, "ApiError")
                    }
                }else{
                    callback(nil, "ApiError")
                }
                
        }
        
    }
    
}