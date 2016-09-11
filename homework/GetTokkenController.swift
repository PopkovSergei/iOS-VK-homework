//
//  GetTokkenController.swift
//  homework
//
//  Created by Serg on 07.08.16.
//  Copyright © 2016 Serg. All rights reserved.
//

import Foundation
import UIKit

class GetTokkenController: UIViewController, UIWebViewDelegate{
    
    
    @IBOutlet weak var loadingView: UIActivityIndicatorView!
    @IBOutlet weak var webViewTokken: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        webViewTokken.delegate = self
        self.view.window?.makeKeyAndVisible()
        
        let URLgetTokken = NSURL(string: "https://oauth.vk.com/authorize?client_id=5568627&scope=notify,friends,photos,audio,video,docs,notes,pages,offers,questions,wall,group,messages,offline&redirect_uri=http://oauth.vk.com/blank.html&display=touch&response_type=token&v=5.53")
        
        let getTokkenRequest: NSURLRequest = NSURLRequest(URL: URLgetTokken!)
        webViewTokken.loadRequest(getTokkenRequest)
   
    }
    
    func webViewDidStartLoad(webView: UIWebView) {
        loadingView.startAnimating()
        
 
        
    }
    
    
    func webViewDidFinishLoad(webView: UIWebView) {
        loadingView.stopAnimating()
        var request = webViewTokken.request?.URL?.absoluteString
        var textRequest = request?.rangeOfString("access_token")
        if textRequest != nil{
           
            let tokken = request?.componentsSeparatedByString("access_token=")[1].componentsSeparatedByString("&")[0]
            apiService().token = tokken
            
        }
        
    }
    
    @IBAction func refreshButton(sender: AnyObject) {
       webViewTokken.reload()
    }
    
    
}