//
//  LoginViewController.swift
//  facebook.3.0
//
//  Created by Lee Cline on 9/10/14.
//  Copyright (c) 2014 yahoo. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {


    @IBOutlet weak var loginButton: UIButton!
   
    @IBOutlet weak var emailField: UITextField!
    
    @IBOutlet weak var passwordField: UITextField!
    
    @IBOutlet weak var loadingView: UIActivityIndicatorView!
    
    @IBOutlet var tapListener: UITapGestureRecognizer!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillShow:", name: UIKeyboardWillShowNotification, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillHide:", name: UIKeyboardWillHideNotification, object: nil)
        // Do any additional setup after loading the view.
    }

    
    @IBAction func onloginButton(sender: AnyObject) {
        loginButton.selected = true
        loadingView.startAnimating()
        // Delay for 2 seconds, then run the code between the braces.
        delay(2, closure: { () -> () in
            self.loadingView.stopAnimating()
            self.loginButton.selected = false
            
            if (self.emailField.text == "tim" && self.passwordField.text == "password") {
                
                self.performSegueWithIdentifier("loginSegue", sender: self)
            } else {
                UIAlertView(title: "Oops", message: "Wrong email or password!", delegate: nil, cancelButtonTitle: "OK").show()
                }
        })
        
    }

    @IBAction func onbuttonSegue(sender: AnyObject) {
    }

    @IBAction func onTap(sender: AnyObject) {view.endEditing(true)
    }
    
    func delay(delay:Double, closure:()->()) {
        dispatch_after(
            dispatch_time(
                DISPATCH_TIME_NOW,
                Int64(delay * Double(NSEC_PER_SEC))
            ),
        dispatch_get_main_queue(), closure)
    }
    
    
    func keyboardWillShow(notification: NSNotification!) {
    }
    
    func keyboardWillHide(notification: NSNotification!) {
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
