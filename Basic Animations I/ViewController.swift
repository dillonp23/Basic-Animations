//
//  ViewController.swift
//  Basic Animations I
//
//  Created by Dillon P on 9/24/19.
//  Copyright © 2019 Lambda iOSPT2. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        configureRedView()
        // Do any additional setup after loading the view.
    }


    func configureRedView() {
           
           let redView = UIView()
           
           redView.backgroundColor = .red
           redView.translatesAutoresizingMaskIntoConstraints = false
           
           // Adding our red view as subview of view controllers view
           view.addSubview(redView)
           
           
           /// define the minimum number of constraints to enable view to layout one way and no ambiguity
           
           let leadingConstraint = NSLayoutConstraint(item: redView, attribute: .leading, relatedBy: .equal, toItem: view.safeAreaLayoutGuide, attribute: .leading, multiplier: 1.0, constant: 30)
           let verticalConstraint = NSLayoutConstraint(item: redView, attribute: .bottom, relatedBy: .equal, toItem: view.safeAreaLayoutGuide, attribute: .bottom, multiplier: 1.0, constant: 0)
           let heightConstraint = NSLayoutConstraint(item: redView, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 100.0)
           let aspectRatioConstraint = NSLayoutConstraint(item: redView, attribute: .width, relatedBy: .equal, toItem: redView, attribute: .height, multiplier: 1.0, constant: 0.0)
           
           NSLayoutConstraint.activate([
               leadingConstraint,
               verticalConstraint,
               heightConstraint,
               aspectRatioConstraint
           ])
           
       }

    
    
}

