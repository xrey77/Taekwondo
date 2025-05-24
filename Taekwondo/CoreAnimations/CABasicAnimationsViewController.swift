//
//  CABasicAnimationsViewController.swift
//  Taekwondo
//
//  Created by Reynald Marquez-Gragasin on 5/19/25.
//

import UIKit

class CABasicAnimationsViewController: UIViewController {

    private var globeIcon = UIImageView()
    private var globeBtn = UIButton()
    private var SlantBtn = UIButton()

    
    private var orangeButton = UIButton()
    private var blueButton = UIButton()
    private var redButton = UIButton()
    private var purpleButton = UIButton()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        orangeButton.frame = CGRect(x: 10, y: 50, width: 100, height: 100)
        orangeButton.setTitle("Orange", for: .normal)
        orangeButton.backgroundColor = .orange
        orangeButton.setTitleColor(.white, for: .normal)
        orangeButton.addTarget(self, action: #selector(orangebuttonTapped), for: .touchUpInside)
        view.addSubview(orangeButton)
        
        
        blueButton.frame = CGRect(x: 150, y: 50, width: 100, height: 100)
        blueButton.setTitle("Blue", for: .normal)
        blueButton.backgroundColor = .blue
        blueButton.setTitleColor(.white, for: .normal)
        blueButton.addTarget(self, action: #selector(bluebuttonTapped), for: .touchUpInside)
        view.addSubview(blueButton)

        redButton.frame = CGRect(x: 10, y: 170, width: 100, height: 100)
        redButton.setTitle("Red", for: .normal)
        redButton.backgroundColor = .red
        redButton.setTitleColor(.white, for: .normal)
        redButton.addTarget(self, action: #selector(redbuttonTapped), for: .touchUpInside)
        view.addSubview(redButton)

        purpleButton.frame = CGRect(x: 10, y: 290, width: 100, height: 100)
        purpleButton.setTitle("Purple", for: .normal)
        purpleButton.backgroundColor = .purple
        purpleButton.setTitleColor(.white, for: .normal)
        purpleButton.addTarget(self, action: #selector(purpleButtonbuttonTapped), for: .touchUpInside)
        view.addSubview(purpleButton)

        globeIcon.frame = CGRect(x: 90, y: 390, width: 200, height: 200)
        globeIcon.image = UIImage(named: "globes")
        view.addSubview(globeIcon)
        
        
        globeBtn.frame = CGRect(x: 120, y: 610, width: 150, height: 50)
        globeBtn.setTitle("start animation", for: .normal)
        globeBtn.setTitleColor(.white, for: .normal)
        globeBtn.backgroundColor = .blue
        globeBtn.addTarget(self, action: #selector(startAnimationTapped), for: .touchUpInside)
        view.addSubview(globeBtn)

        
        SlantBtn.frame = CGRect(x: 150, y: 340, width: 160, height: 50)
        SlantBtn.setTitle("Slant Animation", for: .normal)
        SlantBtn.backgroundColor = .blue
        SlantBtn.setTitleColor(.white, for: .normal)
        SlantBtn.addTarget(self, action: #selector(slantButtonbuttonTapped), for: .touchUpInside)
        view.addSubview(SlantBtn)

        
    }
    

    @objc func orangebuttonTapped() {
        let animateButton = self.orangeButton
        let animation = CABasicAnimation(keyPath: #keyPath(CALayer.cornerRadius))
        animation.duration = 1.0
        animation.fromValue = orangeButton.layer.cornerRadius
        animation.toValue = orangeButton.frame.height/2
        animation.timingFunction = CAMediaTimingFunction(name: .easeOut)
        animateButton.layer.add(animation, forKey: "cornerRadius")
        orangeButton.layer.cornerRadius = orangeButton.frame.height / 2
    }

    @objc func bluebuttonTapped() {
        let animateBlueButton = self.blueButton
        let animation = CABasicAnimation(keyPath: #keyPath(CALayer.opacity))
        animation.duration = 1.0
        animation.fromValue = 1
        
        let value: Float = 0.0
        animation.toValue = value
        
        animation.timingFunction = CAMediaTimingFunction(name: .easeIn)
        animateBlueButton.layer.add(animation, forKey: "opacity")
        animateBlueButton.layer.opacity = value
    }
 
    @objc func redbuttonTapped() {
        let redButtonPosision = CGPoint(x: blueButton.center.x, y: redButton.center.y)
        
        let moveAnimation = CABasicAnimation(keyPath: #keyPath(CALayer.position))
        moveAnimation.fromValue = redButton.center
        moveAnimation.toValue = redButtonPosision
        
        let rotationAnimation = CABasicAnimation(keyPath: "transform.rotation.z")
        rotationAnimation.fromValue = 0
        rotationAnimation.toValue = NSNumber(value: Double.pi * 7 /  4)
        
        let groupAnimation = CAAnimationGroup()
        groupAnimation.animations = [moveAnimation, rotationAnimation]
        groupAnimation.duration = 2
        groupAnimation.timingFunction = CAMediaTimingFunction(name: .easeInEaseOut)
        
        redButton.layer.add(groupAnimation, forKey: "groupAnimation")
        let rotationAngle = CGFloat(Double.pi * 7 / 4)
        redButton.transform = CGAffineTransform(rotationAngle: rotationAngle)
        redButton.layer.position = redButtonPosision
    }
    
    @objc func purpleButtonbuttonTapped() {
        let purpleButtonPosition = CGPoint(x: view.center.x, y: view.center.y)
        let moveAnimation = CABasicAnimation(keyPath: #keyPath(CALayer.position))
        moveAnimation.fromValue = purpleButton.center
        moveAnimation.toValue = purpleButtonPosition
        
        let scaleAnimation = CABasicAnimation(keyPath: "transform.scale")
        scaleAnimation.fromValue = 1.0
        scaleAnimation.toValue = 1.5
        
        let colorAnimation = CABasicAnimation(keyPath: #keyPath(CALayer.backgroundColor))
        colorAnimation.toValue = UIColor.magenta.cgColor
        
        let groupAnimation = CAAnimationGroup()
        groupAnimation.animations = [moveAnimation, scaleAnimation, colorAnimation]
        groupAnimation.duration = 1.0
        groupAnimation.timingFunction = CAMediaTimingFunction(name: .easeInEaseOut)
        groupAnimation.repeatCount = 2
        groupAnimation.autoreverses = true
        
        purpleButton.layer.add(groupAnimation, forKey: "groupAnimation")
        
    }

    @objc func startAnimationTapped() {
        
        let scaleAnimation = CABasicAnimation()
        scaleAnimation.valueFunction = CAValueFunction(name: CAValueFunctionName.scale)
        scaleAnimation.fromValue = [0, 0, 0]
        scaleAnimation.toValue = [1, 1, 1]
        scaleAnimation.duration = 3
        globeIcon.layer.add(scaleAnimation,
                         forKey: "transform")

    }
    
    @objc func slantButtonbuttonTapped() {
        let animation = CABasicAnimation(keyPath: "position")
        animation.fromValue = CGPoint(x: orangeButton.frame.origin.x + (orangeButton.frame.size.width/2),
                                      y: orangeButton.frame.origin.y + orangeButton.frame.size.height/2)
        animation.toValue = CGPoint(x: 300, y: 400)
        animation.duration = 1
        animation.fillMode = .forwards
        animation.isRemovedOnCompletion = false
        animation.beginTime = CACurrentMediaTime()
        orangeButton.layer.add(animation, forKey: nil)
    }
     

}

