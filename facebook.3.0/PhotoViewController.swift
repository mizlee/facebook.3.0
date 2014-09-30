//
//  PhotoViewController.swift
//  facebook.3.0
//
//  Created by Lee Cline on 9/29/14.
//  Copyright (c) 2014 yahoo. All rights reserved.
//

import UIKit

class PhotoViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var doneImage: UIImageView!
    
    @IBOutlet weak var doneButton: UIButton!
    
    @IBOutlet weak var actionTools: UIImageView!
   
    @IBOutlet weak var imageOne: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView.contentSize = CGSize(width: 320, height: 600) // customize this?
        scrollView.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func scrollViewDidScroll(scrollView: UIScrollView!) {
        // This method is called as the user scrolls
    println("this is working!")
    }
    
    
    func scrollViewWillBeginDragging(scrollView: UIScrollView!) {
        UIView.animateWithDuration(0.4, animations: { () -> Void in
        self.actionTools.alpha  = 0.0
            self.doneImage.alpha = 0.0
            //move image along y axis
            // let scroll do the work: don't do a pan or anything, maybe limiting scrollview size will set the right constraints?
        })
    }
    
    func scrollViewDidEndDragging(scrollView: UIScrollView!,
        willDecelerate decelerate: Bool) {
            // This method is called right as the user lifts their finger
    println("the scrolling slows")
            //set up a temporary image--moved down from scroll to begin drag. this works, just need to know when or where to call.
//            var tempView = UIImageView(frame: CGRect(x: 0, y: 44, width: 320, height: 480))
//            tempView.image = UIImage(named: "wedding1")
//            view.addSubview(tempView)
//            self.imageOne.hidden = true
}
    
    func scrollViewDidEndDecelerating(scrollView: UIScrollView!) {
        // This method is called when the scrollview finally stops scrolling.
    }

    @IBAction func onDoneButton(sender: AnyObject) {
    dismissViewControllerAnimated(true, completion: nil)
    }

}
