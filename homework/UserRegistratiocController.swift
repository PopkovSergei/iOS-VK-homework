//
//  RegistratiocController.swift
//  homework
//
//  Created by Serg on 07.08.16.
//  Copyright © 2016 Serg. All rights reserved.
//

import Foundation

import UIKit

class UserRegistratiocController: UIViewController {
    
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var lastNameField: UITextField!
    @IBOutlet weak var loginField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var mailField: UITextField!
    @IBOutlet weak var dobPicker: UIDatePicker!
    
    var bDate: NSDate?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameField.text = NSUserDefaults.standardUserDefaults().objectForKey("name") as! String?
        lastNameField.text = NSUserDefaults.standardUserDefaults().objectForKey("lastName") as! String?
        loginField.text = NSUserDefaults.standardUserDefaults().objectForKey("login") as! String?
        passwordField.text = NSUserDefaults.standardUserDefaults().objectForKey("Password") as! String?
        mailField.text = NSUserDefaults.standardUserDefaults().objectForKey("mail") as! String?
        bDate = (NSUserDefaults.standardUserDefaults().objectForKey("bDate") as! NSDate?)
        
        dobPicker.addTarget(self, action: Selector("bDeyAction"), forControlEvents: UIControlEvents.ValueChanged)
        if bDate != nil{
            dobPicker.date = bDate!
        }
            
        
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    
    func bDeyAction(datePicker:UIDatePicker) {
        
        bDate = dobPicker.date
    }
    
    
    
    func isValidEmail(testStr:String) -> Bool {
        print("validate calendar: \(testStr)")
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        
        var emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluateWithObject(testStr)
    }
    
    @IBAction func SaveAction(sender: AnyObject) {
        var text = ""
        text = mailField.text!
        if isValidEmail(text){

            NSUserDefaults.standardUserDefaults().setObject(nameField.text!, forKey: "name")
            NSUserDefaults.standardUserDefaults().setObject(lastNameField.text!, forKey: "lastName")
            NSUserDefaults.standardUserDefaults().setObject(loginField.text!, forKey: "login")
            NSUserDefaults.standardUserDefaults().setObject(passwordField.text!, forKey: "Password")
            NSUserDefaults.standardUserDefaults().setObject(mailField.text!, forKey: "mail")
            NSUserDefaults.standardUserDefaults().setObject(bDate, forKey: "bDate")
            NSUserDefaults.standardUserDefaults().synchronize()
            
        }else{
            let dialog = UIAlertController(title: "Messege", message: "You enter incorrect Email", preferredStyle: UIAlertControllerStyle.Alert)
            dialog.addAction(UIAlertAction(title: "OK",style: UIAlertActionStyle.Default, handler: nil))
            self.presentViewController(dialog, animated: true, completion: nil)
            
        }
    }
    
    @IBAction func printAction(sender: AnyObject) {
        
        var text = ""
        text = mailField.text!
        if isValidEmail(text){
            
            print(nameField.text)
            print(lastNameField.text)
            print(loginField.text)
            print(passwordField.text)
            print(mailField.text)
            print(bDate)
            
        }else{
            let dialog = UIAlertController(title: "Messege", message: "You enter incorrect Email", preferredStyle: UIAlertControllerStyle.Alert)
            dialog.addAction(UIAlertAction(title: "OK",style: UIAlertActionStyle.Default, handler: nil))
            self.presentViewController(dialog, animated: true, completion: nil)
            
        }
        
    }
    
    
    
}