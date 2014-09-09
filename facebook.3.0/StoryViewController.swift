//
//  StoryViewController.swift
//  facebook.3.0
//
//  Created by Lee Cline on 9/8/14.
//  Copyright (c) 2014 yahoo. All rights reserved.
//

import UIKit

class StoryViewController: UIViewController {

    @IBOutlet weak var scrollStory: UIScrollView!
    
    @IBOutlet weak var contentStory: UIImageView!
    
    @IBOutlet weak var back: UIButton!
    
    @IBOutlet weak var SampleLikeButton: UIButton!
    
    @IBOutlet weak var commentButton: UIButton!
    
    @IBOutlet weak var commentView: UIView!
    
    @IBOutlet weak var commentTextField: UITextField!
    
    @IBAction func onSampleLikeTap(sender: AnyObject) {

        SampleLikeButton.selected = !SampleLikeButton.selected

        func keyboardWillShow(notification: NSNotification!) {
            
        }
        
        func keyboardWillHide(notification: NSNotification!) {
            
        }
}
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    scrollStory.contentSize = CGSize(width: 320, height: 1000)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    
        
        
  }
    @IBAction func onBackButton(sender: AnyObject) {
        self.navigationController!.popViewControllerAnimated(true)
}
    @IBAction func onCommentButton(sender: AnyObject) {
    commentTextField.becomeFirstResponder()}
    
    @IBAction func cancelStory(sender: AnyObject) {
    dismissViewControllerAnimated(true, completion: nil)
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
