//
//  ViewController.swift
//  SwipeGesture
//
//  Created by Sai Sandeep on 09/11/17.
//  Copyright © 2017 iosRevisited. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    
    let imageView = UIImageView()
     
    
    var swipeGesture  = UISwipeGestureRecognizer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = #imageLiteral(resourceName: "cat")
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        view.addSubview(imageView)
        imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        imageView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        imageView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.6).isActive = true
        imageView.heightAnchor.constraint(equalTo: imageView.widthAnchor, multiplier: 1).isActive = true
        
        let directions: [UISwipeGestureRecognizerDirection] = [.up, .down, .right, .left]
        
        for direction in directions {
            swipeGesture = UISwipeGestureRecognizer(target: self, action: #selector(self.swipwView(_:)))
            imageView.addGestureRecognizer(swipeGesture)
            swipeGesture.direction = direction
            imageView.isUserInteractionEnabled = true
            imageView.isMultipleTouchEnabled = true
        }
    }
    
    @objc func swipwView(_ sender : UISwipeGestureRecognizer){
        UIView.animate(withDuration: 1.0) {
            if sender.direction == .right { // Swipe right action
                
                self.imageView.frame = CGRect(x: self.view.frame.size.width - self.imageView.frame.size.width, y: self.imageView.frame.origin.y , width: self.imageView.frame.size.width, height: self.imageView.frame.size.height)
            }else if sender.direction == .left{ // Swipe left action
                
                self.imageView.frame = CGRect(x: 0, y: self.imageView.frame.origin.y , width: self.imageView.frame.size.width, height: self.imageView.frame.size.height)
                
            }else if sender.direction == .up{ // Swipe up action
                
                self.imageView.frame = CGRect(x: self.view.frame.size.width - self.imageView.frame.size.width, y: 0 , width: self.imageView.frame.size.width, height: self.imageView.frame.size.height)
            }else if sender.direction == .down{ // Swipe down action
                
                self.imageView.frame = CGRect(x: self.view.frame.size.width - self.imageView.frame.size.width, y: self.view.frame.size.height - self.imageView.frame.height , width: self.imageView.frame.size.width, height: self.imageView.frame.size.height)
            }
            self.imageView.layoutIfNeeded()
            self.imageView.setNeedsDisplay()
        }
    }
    
}


