//
//  CASpringAnimations.swift
//  Taekwondo
//
//  Created by Reynald Marquez-Gragasin on 5/19/25.
//

import UIKit

class CASpringAnimations: UIViewController {

    private var firstName = UILabel()
    private var startBtn = UIButton()
    private var pulseBtn = UIButton()
    private var bounceBtn = UIButton()

    
    private var pulseView = UIView()
    private var bounceView = UIView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .orange
        
        firstName.frame = CGRect(x: 70, y: 80, width: 300, height: 40)
        firstName.text = "LION HEART"
        firstName.textColor = .white
        firstName.font = UIFont(name: "arial", size: 38)
        view.addSubview(firstName)
        
        startBtn.frame = CGRect(x: 80, y: 140, width: 200, height: 50)
        startBtn.setTitle("EaseOut Animate", for: .normal)
        startBtn.setTitleColor(.white, for: .normal)
        startBtn.backgroundColor = .blue
        startBtn.addTarget(self, action: #selector(startBtnTapped), for: .touchUpInside)
        view.addSubview(startBtn)
        
        pulseView.frame = CGRect(x: 130, y: 210, width: 100, height: 100)
        pulseView.layer.cornerRadius = pulseView.frame.width / 2
        pulseView.clipsToBounds = true
        pulseView.backgroundColor = .yellow
        view.addSubview(pulseView)

        pulseBtn.frame = CGRect(x: 80, y: 330, width: 200, height: 50)
        pulseBtn.setTitle("Pulse Animate", for: .normal)
        pulseBtn.setTitleColor(.white, for: .normal)
        pulseBtn.backgroundColor = .blue
        pulseBtn.addTarget(self, action: #selector(otherBtnTapped), for: .touchUpInside)
        view.addSubview(pulseBtn)

        bounceView.frame = CGRect(x: 130, y: 390, width: 100, height: 100)
        bounceView.layer.cornerRadius = bounceView.frame.width / 2
        bounceView.clipsToBounds = true
        bounceView.backgroundColor = .yellow
        view.addSubview(bounceView)

        bounceBtn.frame = CGRect(x: 80, y: 500, width: 200, height: 50)
        bounceBtn.setTitle("Bounce Animate", for: .normal)
        bounceBtn.setTitleColor(.white, for: .normal)
        bounceBtn.backgroundColor = .blue
        bounceBtn.addTarget(self, action: #selector(bounceBtnTapped), for: .touchUpInside)
        view.addSubview(bounceBtn)

    }
    
    @objc func startBtnTapped() {
        let springAnimation = CASpringAnimation(keyPath: "transform.scale")
        springAnimation.fromValue = 0
        springAnimation.toValue = 1
        firstName.layer.add(springAnimation, forKey: "bounce")
    }

    @objc func otherBtnTapped() {
//        let jump = CASpringAnimation(keyPath: "position.y")
//        jump.initialVelocity = 100.0
//        jump.mass = 10.0
//        jump.stiffness = 1500.0
//        jump.damping = 50.0

        
        
        let pulse = CASpringAnimation(keyPath: "transform.scale")
        pulse.fromValue = 1.25
        pulse.toValue = 1.0
        pulse.duration = 0.90
        pulse.repeatCount = .infinity
        pulseView.layer.add(pulse, forKey: nil)
    }
    
    @objc func bounceBtnTapped() {
        let spring = CASpringAnimation()
        spring.keyPath = "position.y"
        spring.fromValue = 390
        spring.toValue = 450
        spring.damping = 2
        spring.duration = 2
        bounceView.layer.add(spring, forKey: nil)
    }
}
