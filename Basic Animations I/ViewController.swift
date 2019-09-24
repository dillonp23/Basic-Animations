//
//  ViewController.swift
//  Basic Animations I
//
//  Created by Dillon P on 9/24/19.
//  Copyright © 2019 Lambda iOSPT2. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let label = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()
//        configureRedView()
        configureLabel()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        label.center = view.center
    }


    func configureRedView() {
           
           let redView = UIView()
           
           redView.backgroundColor = .red
           redView.translatesAutoresizingMaskIntoConstraints = false
           
           // Adding our red view as subview of view controllers view
           view.addSubview(redView)
           
        
        let blueView = UIView()
        
        blueView.backgroundColor = .blue
        blueView.translatesAutoresizingMaskIntoConstraints = false
        
        // Adding our red view as subview of view controllers view
        view.addSubview(blueView)
           
           /// define the minimum number of constraints to enable view to layout one way and no ambiguity
           
//           let leadingConstraint = NSLayoutConstraint(item: redView, attribute: .leading, relatedBy: .equal, toItem: view.safeAreaLayoutGuide, attribute: .leading, multiplier: 1.0, constant: 30)
//           let verticalConstraint = NSLayoutConstraint(item: redView, attribute: .top, relatedBy: .equal, toItem: view.safeAreaLayoutGuide, attribute: .top, multiplier: 1.0, constant: 0)
//           let heightConstraint = NSLayoutConstraint(item: redView, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 100.0)
//           let aspectRatioConstraint = NSLayoutConstraint(item: redView, attribute: .width, relatedBy: .equal, toItem: redView, attribute: .height, multiplier: 1.0, constant: 0.0)
        
        
        let leadingConstraint = redView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30)
        let verticalConstraint = redView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0)
        let heightConstraint = redView.heightAnchor.constraint(equalToConstant: 100.0)
        let aspectRatioConstraint = redView.widthAnchor.constraint(equalTo: redView.heightAnchor)
        
        let leadingConstraintB = blueView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30)
        let verticalConstraintB = blueView.topAnchor.constraint(equalTo: redView.bottomAnchor, constant: 20)
        let heightConstraintB = blueView.heightAnchor.constraint(equalToConstant: 100.0)
        let aspectRatioConstraintB = blueView.widthAnchor.constraint(equalTo: blueView.heightAnchor)
           
           NSLayoutConstraint.activate([
               leadingConstraint,
               verticalConstraint,
               heightConstraint,
               aspectRatioConstraint,
               leadingConstraintB,
               verticalConstraintB,
               heightConstraintB,
               aspectRatioConstraintB
           ])
           
       }

    func configureLabel() {
        
        label.frame = CGRect(x: 0, y: 0, width: 200, height: 200)
        view.addSubview(label)
        
        label.widthAnchor.constraint(equalTo: label.heightAnchor).isActive = true
        label.translatesAutoresizingMaskIntoConstraints = false
        
        label.layer.cornerRadius = 12
        label.layer.borderWidth = 0
        
        label.text = "🤯"
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 96)
        
        
        
        
    }
    
    
    
}

