//
//  ViewController.swift
//  gravityballs
//
//  Created by Eneko Alonso on 6/6/14.
//  Copyright (c) 2014 Eneko Alonso. All rights reserved.
//

import UIKit
import CoreMotion

class ViewController: UIViewController {

    let diameter:CGFloat = 20
    let total = 20

    var balls = UIView[]()
    var animator: UIDynamicAnimator?
    var gravityBehavior: UIGravityBehavior?
    var motionManager: CMMotionManager?
    var motionQueue: NSOperationQueue?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        animator = UIDynamicAnimator(referenceView: self.view)
        
        view.backgroundColor = UIColor(red: 0.9, green: 0.88, blue: 0.8, alpha: 1)
        
        for i in 1...total {
            let x = (CGFloat)(arc4random() % 300)
            let y = (CGFloat)(arc4random() % 300)
            let frame = CGRectMake(x, y, diameter, diameter)
            var ball = UIView(frame: frame)
            ball.backgroundColor = randomColor()
            // TODO: use a UIBeizerPath to indicate the collision boundary of the balls
            ball.layer.cornerRadius = ball.frame.size.height / 2;
            ball.layer.masksToBounds = true;
            balls.append(ball)
            view.addSubview(ball)
        }

        gravityBehavior = UIGravityBehavior(items: balls)
        animator?.addBehavior(gravityBehavior)
        
        var elasticityBehavior = UIDynamicItemBehavior(items: balls)
        elasticityBehavior.elasticity = 0.7
        elasticityBehavior.friction = 0.3
        animator?.addBehavior(elasticityBehavior)
        
        var collisionBehavior = UICollisionBehavior(items: balls)
        collisionBehavior.translatesReferenceBoundsIntoBoundary = true
        animator?.addBehavior(collisionBehavior)

        motionManager = CMMotionManager()
        motionQueue = NSOperationQueue()
        motionManager?.startDeviceMotionUpdatesToQueue(motionQueue) {
            (motion:CMDeviceMotion!, error:NSError!) -> Void in
            let gravity:CMAcceleration = motion.gravity
            dispatch_async(dispatch_get_main_queue()) {
                let vector = CGVectorMake((CGFloat)(gravity.x), (CGFloat)(-gravity.y))
                self.gravityBehavior!.gravityDirection = vector
            }
        }
    }
    
    func randomColor() -> UIColor {
        let hue = ( (CGFloat)(arc4random() % 256) / 256.0 );  //  0.0 to 1.0
        let saturation = ( (CGFloat)(arc4random() % 128) / 256.0 ) + 0.5;  //  0.5 to 1.0, away from white
        let brightness = ( (CGFloat)(arc4random() % 128) / 256.0 ) + 0.5;  //  0.5 to 1.0, away from black
        return UIColor(hue: hue, saturation: saturation, brightness: brightness, alpha: 1)
    }
}

