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
        configureButtons()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        label.center = view.center /// not exactly clear on this and why do it but look into later... most of the time, probably fine using and animating constraints, vs frame based (like here)
        ///doing this way is frame based animation vs constraint based
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
    
    func configureButtons() {
        
        let rotateButton = UIButton(type: .system)
        rotateButton.setTitle("Rotate", for: .normal)
        rotateButton.addTarget(self, action: #selector(rotateButtonTapped), for: .touchUpInside)
        
        let keyButton = UIButton(type: .system)
        keyButton.setTitle("Key", for: .normal)
        keyButton.addTarget(self, action: #selector(keyButtonTapped), for: .touchUpInside)
        
        let springButton = UIButton(type: .system)
        springButton.setTitle("Spring", for: .normal)
        springButton.addTarget(self, action: #selector(springButtonTapped), for: .touchUpInside)
        
        let squashButton = UIButton(type: .system)
        squashButton.setTitle("Squash", for: .normal)
        squashButton.addTarget(self, action: #selector(squashButtonTapped), for: .touchUpInside)
        
        let anticButton = UIButton(type: .system)
        anticButton.setTitle("Antic", for: .normal)
        anticButton.addTarget(self, action: #selector(anticButtonTapped), for: .touchUpInside)
        
        
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(stackView)
        
        stackView.axis = .horizontal
        stackView.distribution = .equalSpacing
        
        stackView.addArrangedSubview(rotateButton)
        stackView.addArrangedSubview(keyButton)
        stackView.addArrangedSubview(springButton)
        stackView.addArrangedSubview(squashButton)
        stackView.addArrangedSubview(anticButton)
        
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            stackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            stackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -10)
        ])
    }
    
    @objc func rotateButtonTapped() {
        // step one: rotate clockwise 45 degrees
        // step two: rotate counter-cw 45 degrees
        
        UIView.animate(withDuration: 2.0, animations: {
            self.label.transform = CGAffineTransform(rotationAngle: CGFloat.pi/4)
        }) { (_) in // this is a bool value that checks whether the animation completes.. we don't care here so just ignoring the argument
            UIView.animate(withDuration: 2.0) {
                self.label.transform = .identity /// this is equal to where we started -> however this is just runnin immeditely and we need to set a duration
            }
        }
    }
    
    @objc func keyButtonTapped() {
        // 1: rotate cw 45
        // 2: rotate c-cw 45
        // 3: move up by some points
        // 4: move back down same number of points
        
        label.center = view.center
        
        UIView.animateKeyframes(withDuration: 5.0, delay: 0, options: [], animations: {
            
            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 0.25) {
                self.label.transform = CGAffineTransform(rotationAngle: CGFloat.pi/4)
            }
            
            UIView.addKeyframe(withRelativeStartTime: 0.25, relativeDuration: 0.25) {
                self.label.transform = .identity
            }
            
            UIView.addKeyframe(withRelativeStartTime: 0.5, relativeDuration: 0.25) {
                self.label.center = CGPoint(x: self.view.center.x, y: self.view.center.y - 60)
            }
            /// could do this with CGaffineTransform (translation) as well
            UIView.addKeyframe(withRelativeStartTime: 0.75, relativeDuration: 0.25) {
                self.label.center = self.view.center
            }
            
        }, completion: nil)
    }
    
    @objc func springButtonTapped() {
        label.center = view.center
        label.transform = CGAffineTransform(scaleX: 0.0001, y: 0.0001)
        UIView.animate(withDuration: 3.0, delay: 0, usingSpringWithDamping: 0.3, initialSpringVelocity: 0, options: [], animations: {
            self.label.transform = .identity
        }, completion: nil)
    }
    
    ///Two different types of things going on: animate or animate keyframes
    
    @objc func squashButtonTapped() {
        // start off screen
        // animate down to center
        // squish horizontally (springy)
        // squish vertically (springy)
        
        label.center = CGPoint(x: view.center.x, y: -label.bounds.size.height)
        
        let animationBlock = {
            UIView.addKeyframe(withRelativeStartTime: 0.0, relativeDuration: 0.4) {
                self.label.center = self.view.center
            }
            UIView.addKeyframe(withRelativeStartTime: 0.3, relativeDuration: 0.2) {
                self.label.transform = CGAffineTransform(scaleX: 1.7, y: 0.6)
            }
            UIView.addKeyframe(withRelativeStartTime: 0.5, relativeDuration: 0.2) {
                self.label.transform = CGAffineTransform(scaleX: 0.6, y: 1.7)
            }
            UIView.addKeyframe(withRelativeStartTime: 0.7, relativeDuration: 0.10) {
                self.label.transform = CGAffineTransform(scaleX: 1.11, y: 0.9)
            }
            UIView.addKeyframe(withRelativeStartTime: 0.8, relativeDuration: 0.10) {
                self.label.transform = .identity
            }
        }
        
        UIView.animateKeyframes(withDuration: 1.5, delay: 0, options: [], animations: animationBlock, completion: nil)
        
    }
    
    @objc func anticButtonTapped() {
        
        label.center = view.center
        
        let animBlock = {
            UIView.addKeyframe(withRelativeStartTime: 0.0, relativeDuration: 0.1) {
                self.label.transform = CGAffineTransform(rotationAngle: CGFloat.pi / 16.0)
            }
            UIView.addKeyframe(withRelativeStartTime: 0.1, relativeDuration: 0.2) {
                self.label.transform = CGAffineTransform(rotationAngle: -1 * CGFloat.pi / 16.0)
            }
            UIView.addKeyframe(withRelativeStartTime: 0.2, relativeDuration: 0.8) {
                self.label.center = CGPoint(
                    x: self.view.bounds.size.width + self.label.bounds.size.width,
                    y: self.view.center.y)
            }
        }
        
        UIView.animateKeyframes(withDuration: 1.5, delay: 0, options: [], animations: animBlock, completion: nil)
        
    }
    
}

