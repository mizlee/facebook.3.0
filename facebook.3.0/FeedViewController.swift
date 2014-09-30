  //
//  FeedViewController.swift
//  facebook.3.0
//
//  Created by Lee Cline on 9/8/14.
//  Copyright (c) 2014 yahoo. All rights reserved.
//

import UIKit

class FeedViewController: UIViewController, UIViewControllerTransitioningDelegate, UIViewControllerAnimatedTransitioning {

    var isPresenting: Bool = true
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var contentView: UIImageView!
    
//    var photo1View = UIImageView(frame: CGRect(x: 0, y: 0, width: 320, height: 480))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView.contentSize = CGSize(width: 320, height: 1025)
    }
    
//snippet 2b:
    func animationControllerForPresentedController(presented: UIViewController!, presentingController presenting: UIViewController!, sourceController source: UIViewController!) -> UIViewControllerAnimatedTransitioning! {
        isPresenting = true
        return self
    }
    
    func animationControllerForDismissedController(dismissed: UIViewController!) -> UIViewControllerAnimatedTransitioning! {
        isPresenting = false
        return self
    }       
//snippet 2c:
    func transitionDuration(transitionContext: UIViewControllerContextTransitioning) -> NSTimeInterval {
        // The value here should be the duration of the animations scheduled in the animationTransition method
        return 0.4
    }
    
//the hard part:
    func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
        println("animating transition")
        var containerView = transitionContext.containerView()
        var toViewController = transitionContext.viewControllerForKey(UITransitionContextToViewControllerKey)!
        var fromViewController = transitionContext.viewControllerForKey(UITransitionContextFromViewControllerKey)!
        
        if (isPresenting) {
            containerView.addSubview(toViewController.view)
            toViewController.view.alpha = 0
            
            // add fakey here for anim in?
            
            UIView.animateWithDuration(0.4, animations: { () -> Void in
                toViewController.view.alpha = 1
                CGAffineTransformMakeScale(0.5, 0.5)
                }) { (finished: Bool) -> Void in
                    transitionContext.completeTransition(true)
            }
        } else {
            UIView.animateWithDuration(0.4, animations: { () -> Void in
                fromViewController.view.alpha = 0
                }) { (finished: Bool) -> Void in
                    transitionContext.completeTransition(true)
                    fromViewController.view.removeFromSuperview()
            }
        }
    }

    
    @IBAction func onTapImage1(sender: UITapGestureRecognizer) {
        performSegueWithIdentifier("toPhoto1", sender: self)
//        photo1View.image = UIImage(named: "wedding1")
//        view.addSubview(photo1View)
//    
}
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
  //snippet one
        override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        var destinationVC = segue.destinationViewController as UIViewController
        destinationVC.modalPresentationStyle = UIModalPresentationStyle.Custom
        destinationVC.transitioningDelegate = self
        }
   
    //this should pass image info in a transition
    //    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
    //        var destinationViewController = segue.destinationViewController as PhotoViewController
    //
    //what the: which is my image name and which is untouchable code???
    //destinationViewController.imageOne = imageView.imageOne
    //}

}
