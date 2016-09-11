
import Foundation
import AlamofireObjectMapper
import Alamofire

class UserApiMobule
{
    
    
    let tokken = apiService().token
    var user_ids: String = ""
    
    func getUserVK(callback : (UserMapper?, String?)-> Void){
        
        let URl:String
        
        
        if user_ids == "" {
                URl = "https://api.vk.com/method/users.get?fields=photo_100,bdate,online&access_token="+tokken!+"&v=5.53"
        }else{
                URl = "https://api.vk.com/method/users.get?user_ids="+user_ids+")&fields=photo_100,bdate,online&access_token="+tokken!+"&v=5.53"
        }
       print(URl)
        Alamofire.request(.GET, URl)
            .responseArray(keyPath: "response") { (response: Response<[UserMapper], NSError>) in
                print(response)
                let userMapper = response.result.value
                
                if let userArray = userMapper {
              
                    if userArray.count > 0{
                    callback(userArray[0], nil)
                    }else{
                    callback(nil, "ApiError")
                    }
                }
                
                
              
        }
    }
    
    func getFriedsVK(callback : (UsersMapper?, String?)-> Void){
        
        let URl:String
        
        
        if user_ids == "" {
            URl = "https://api.vk.com/method/friends.get?fields=photo_100,bdate,online&count=20&from_list=friends&access_token="+tokken!+"&v=5.53"
        }else{
            URl = "https://api.vk.com/method/friends.get?user_ids="+user_ids+"&fields=photo_100,bdate,online&count=20&from_list=friends&access_token="+tokken!+"&v=5.53"
        }
        print(URl)
        Alamofire.request(.GET, URl)
            .responseObject(keyPath: "response") { (response: Response<UsersMapper, NSError>) in
                    print(response)
                    let usersMapper = response.result.value
                    
                    print(usersMapper?.count)
                    
                    if let users = usersMapper {
                        
                        
                        if users.count > 0{
                            callback(users, nil)
                        }else{
                            callback(nil, "ApiError")
                        }
                    }else{
                       callback(nil, "ApiError") 
                    }
                
        }
        
    }
}